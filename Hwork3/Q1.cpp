#include <iostream>

// Function for splitting slices of the array to be sorted.
int partition(int arr[], int l, int h) 
{ 
    //Set pivot element
    int x = arr[h]; 
    int i = (l - 1); 

    // Iterate through list sorting elements greater and less than pivot.
    for (int j = l; j <= h - 1; j++) { 
        if (arr[j] <= x) { 
            i++; 
            std::swap(arr[i], arr[j]); 
        } 
    } 
    std::swap(arr[i + 1], arr[h]); 
    return (i + 1); 
} 
// Sorts an array using a stack and while loop. Calls Partition function.
void quickSort(int arr[], int low, int high) 
{ 
    int stack[high - low + 1]; // Starts the stack.
    int top = -1; // Creates top of stack

    stack[++top] = low; 
    stack[++top] = high; 

    //Continues while stack is not empty.
    while (top >= 0) { 

        //Pops high and low from stack
        high = stack[top--]; 
        low = stack[top--]; 

        // Sets pivot element in semi sorted array.
        int p = partition(arr, low, high); 

        // If elements less than pivot, move to left side of stack
        if (p - 1 > low) { 
            stack[++top] = low; 
            stack[++top] = p - 1; 
        } 
        // If elements greater than pivot, move to right side of stack
        if (p + 1 < high) { 
            stack[++top] = p + 1; 
            stack[++top] = high; 
        } 
    } 
} 
//Prints the sorted array.
void printArr(int arr[], int n) 
{ 
    int i; 
    for (i = 0; i < n; ++i) 
        std::cout << arr[i] << " "; 
} 
// Main function calls quicksort and printarr.
int main() 
{ 
    int arr[] = {2,4,5,1,3}; 
    int n = sizeof(arr) / sizeof(*arr);
    quickSort(arr, 0, n - 1); 
    printArr(arr, n); 
    return 0; 
} 