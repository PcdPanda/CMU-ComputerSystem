#include <iostream>
struct data
{
    /* data */
    char a; //占用4 (填充3)
    int b[2]={3,5}; // 占用2*4
    // 空格占用4,使c对齐到8
    double c=-8; // 占用8
    char d; // 占用8
} x[2] = {{'a', {1, 2}, 3, 'd'}, {'a', {1, 2}, 3, 'd'}};


int access(int A1[][5], int * A2[]){
    int b = A1[1][2];
    int c = A2[1][2];
    return b - c;
}

int main(int argc, char* argv[]){
    int A1[3][5];
    int *A2[3] = {A1[0], A1[1], A1[2]};
    std::cout << access(A1, A2) << "\n";
    std::cout << sizeof(x) << "\n"; // 占用32
    std::cout << x[0].d; // 占用32
    return 0;
}
