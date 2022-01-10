#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h> // 定义了getaddrinfo
#include <stdlib.h>
#include <netinet/in.h>
#include <memory.h>
#define MAXLINE 100

void client(char * domain){
    struct addrinfo *p, *list_p, hints; // addrinfo是一个链表
    memset(&hints, 0, sizeof(struct addrinfo));
    // hint告诉get addrinfo的一些特征信息
    hints.ai_family = AF_INET; // 使用IPV4地址
    hints.ai_socktype = SOCK_STREAM; // 使用TCP协议
    char buf[MAXLINE];

    int flag = getaddrinfo(domain, NULL, &hints, &list_p); // 返回的结果放在链表list_p中
    if(flag!=0){
        fprintf(stderr, "get address error: %s\n", gai_strerror(flag));
        exit(1);
    }
    flag = NI_NUMERICHOST;
    int i = 0;
    for(p=list_p;p;p=p->ai_next){
        getnameinfo(p->ai_addr, p->ai_addrlen, buf, MAXLINE, NULL, 0, flag); 
        printf("%s\n", buf);
        // 通过get name info把socket address转化成domain name并打印
        int client_fd = socket(p->ai_family, p->ai_socktype, p->ai_protocol); 
        // 可以把client_fd当做文件描述符
        if(client_fd < 0){
            fprintf(stderr, "Fail %d\n", i++);
            continue;
        }
        if(connect(client_fd, p->ai_addr, p->ai_addrlen) != -1){
            printf("Success %d\n", i++);
            break;
        }
        close(client_fd);
    }
    freeaddrinfo(list_p);
}
void server(char * port="5555"){
    struct addrinfo *p, *list_p, hints; // addrinfo是一个链表
    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_INET; // 使用IPV4地址
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE | AI_ADDRCONFIG;
    hints.ai_flags |= AI_NUMERICSERV; //告诉getaddrinfo这次需要获得端口
    char buf[MAXLINE];

    int flag = getaddrinfo(NULL, port, &hints, &list_p); // 返回的结果放在链表list_p中
    if(flag!=0){
        fprintf(stderr, "get address error: %s\n", gai_strerror(flag));
        exit(1);
    }

    for(p=list_p;p;p=p->ai_next){
        getnameinfo(p->ai_addr, p->ai_addrlen, buf, MAXLINE, NULL, 0, flag); 
        printf("%s\n", buf);
        // 通过get name info把socket address转化成domain name并打印
        int listen_fd = socket(p->ai_family, p->ai_socktype, p->ai_protocol);
        int optval = 1; 
        // 可以把client_fd当做文件描述符
        if(listen_fd < 0){
            fprintf(stderr, "Fail %d\n", i++);
            continue;
        }
        setsockopt(listen_fd, SOL_SOCKET, SO_REUSEADDR, (const void *)&optval, sizeof(int));
        if(bind(listen_fd, p->ai_addr, p->ai_addrlen) != -1){
            printf("Success %d\n", i++);
            if(listen(listen_fd, LISTENQ) < 0)close(listen_fd);
            break;
        }
        close(listen_fd);
    }
    freeaddrinfo(list_p);
}

int main(int argc, char * argv[]){
    client(argv[1]);
    return 0;
}
