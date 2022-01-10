# include <fcntl.h>
# include <stdio.h>
# include <unistd.h>

int main(int argc, char* argv[]){
    int fd, s = 10000 & 0x1;
    char c1, c2;
    fd = open("./file", O_RDONLY, 0);
    read(fd, &c1, 1); 
    if(fork()){
        sleep(s);
        read(fd, &c2, 1); 
        printf("parent read %c %c", c1, c2);
    }
    else{
        sleep(1-s);
        read(fd, &c2, 1); 
        printf("child read %c %c", c1, c2);
    }
    return 0;
}