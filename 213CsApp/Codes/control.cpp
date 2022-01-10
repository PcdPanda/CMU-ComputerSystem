# include <iostream>

long arith(long x, long y, long z){ //注意观察汇编
    //leaq虽然本来是用来计算地址的,但是这里被用来简单的数学计算
    long t1 = x + y;
    long t2 = z + t1;
    long t3 = x + 4; // t3没有被计算,而是直接在t5的运算中被替换掉了
    long t4 = y * 48; // 变成一次 *3和移位
    long t5 = t3 + t4;
    long rval = t2 * t5;
    return rval;
}

template <typename T>
int swap(T * a, T * b){ //注意看汇编里指针的应用
    T c = *a;
    *a = *b;
    *b = c;
    return 0;
}

long absdiff(long x, long y){
    long result;
    if(x < y)result = y - x;
    else result = x - y;
    return result;
}

int great(int a, int b){
    // 因为是int所以register被叫做esi和edi
    // 比较后会用movzbl指令填充0
    long c = absdiff(a, b);
    return a > c;
} 

int sum(int a, int b, int c, int d, int e, int f, int g, int h){
    return a + b + c + d + e + f + g + h; // 观察第7,8个参数怎么被使用的(rsp)
}

int main(int argc, char * argv[]){
    int a = 4;
    for(int i=0;i<sum(1,2,3,4,5,6,7,8);i++)a++;
    int b = 5;
    swap(&a, &b); // 如果没调用swap,则根本不会编译该函数
    int * k = &b;
    // a += 1;
    arith(1,2,3);
    for(long i=0;i<6;i++){
        a++;
        (*k)++;
    }
    for(int i=0;i<b;i++)a = great(1,2);
    for(int j=1;j<3;j++)a = absdiff(a, b);
    return 0;
}