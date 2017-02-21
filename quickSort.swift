// Quick Sort recursive implementation in Swift
//
// Quick Sort has the average time complexity of O(n log n), and it is considered to be an efficient general purpose sort algorithm even though it has a worse case time complexity of (n^2).
// This implementation is great for explanatory uses, however, it has an added space complexity because of the Array duplication (2n). Quick sort can be implemented without the use of separate Arrays/Lists in production code bases, that way it won't have a space complexity overhead, but it will need to mutate the original unsorted array to acheive a space complexity of (n)
//
// The following implementation of Quick Sort generates & prints an array of randomly generated integers (of length N; default is 20), copies the array, and prints the sorted copy of the array.
//
// Marwan Alani - 2017

import Foundation

// Partitioning function to partition values around the pivot
func partition<T: Comparable>(array: inout [T], low: Int, high: Int, pivot: T) -> Int {
    var left = low
    var right = high
    while (left <= right) {
        while (ascending(firstItem: array[left], secondItem: pivot)) {
            left += 1
        }
        while (ascending(firstItem: pivot, secondItem: array[right])) {
            right -= 1
        }
        if (left <= right) {
            if (left != right) {
                swap(&array[left], &array[right])
            }
            left += 1
            right -= 1
        }
    }
    return left
}

// Recursive implementation of the Quick Sort Algorithm
func quickSort<T: Comparable>(array: inout [T], low: Int, high: Int) {
    if (low < high) {
        let pivot = array[(low + high)/2]
        let p_index = partition(array: &array, low: low, high: high, pivot: pivot)
        quickSort(array: &array, low: low, high: p_index-1)
        quickSort(array: &array, low: p_index, high: high)
    }
}

// Wrapper function to create a copy of the unsorted array and then apply Quick Sort on the copy and return it.
func quickSort<T: Comparable>(input: [T]) -> [T] {
    var output = input
    quickSort(array: &output, low: 0, high: output.count-1)
    return output
}

// Definition of generic comparator functions
func descending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem > secondItem}
func ascending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem < secondItem}

// Set the size of the test array (and the upper bound of the random numbers to fill it: 1 to N)
let N: UInt32 = 20

// Initialize (and print) the test array
var unsortedArray = (1...N).map{_ in Int(arc4random_uniform(N)+1)}
print(unsortedArray)

// Sort the array without mutating it
let sortedArray = quickSort(input: unsortedArray)

// Print the sorted array
print(sortedArray)
