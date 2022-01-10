# include <iostream>
# include <cstring>

void merge_sort(int arr[], int num){
    if(num<=1)return;
    int idx = num / 2;
    merge_sort(arr, idx);
    merge_sort(arr + idx, num-idx);
    auto first = arr, second = arr + idx;
    int * tmp = new int[num];
    int i = 0, j = 0, k = 0;
    while(i<idx&&j<num-idx){
        if(arr[i]<arr[idx+j])tmp[k++] = arr[i++];
        else tmp[k++] = arr[idx+j++];
    }
    if(i>=idx)std::memcpy(tmp+k, arr+idx+j, (num - j - idx)* sizeof(int));
    else std::memcpy(tmp+k, arr+i, (idx - i)* sizeof(int));
    std::memcpy(arr, tmp, num * sizeof(int));
    delete []tmp;
}


int main(int argc, char* argv[]){
    int num;
    std::cout << "Please input the length of array\n";
    std::cin >> num;
    // int new  arr[num];
    int * arr = new int[num];
    for(int i=0;i<num;i++){
        std::cout << "Please input the " << i << "th element\n";
        int ele;
        std::cin >> ele;
        arr[i] = ele;
    }
    merge_sort(arr, num);
    for(int i=0;i<num;i++)std::cout << arr[i] << "\n";
    delete []arr;
    return 0;
}