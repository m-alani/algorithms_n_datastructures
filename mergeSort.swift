// Merge Sort (Top-Down, Recursive, with separate Arrays) implementation in Swift
//
// Merge Sort has the time complexity of O(n log n), and it is considered an efficient general purpose sort algorithm.
// This implementation is great for explanatory uses, however, it has an added space complexity because of the Array duplication (n log n). Merge sort can be implemented without the use of separate Arrays/Lists in production code bases, that way it won't have a space complexity overhead, but it will definitely be harder to understand (code-wise)
//
// The following implementation of Merge Sort generates & prints an array of randomly generated integers (of length N; default is 20), sorts the array, and prints the sorted array.
//
// Marwan Alani - 2017

import Foundation

// Definition of the generic Merge helper function
func merge<T>(arr1: inout [T], arr2: inout [T], compare: (T,T) -> Bool) -> [T] {
    var output = [T]()
    while (arr1.count != 0 && arr2.count != 0) {
        output.append(compare(arr1[0], arr2[0]) ? arr1.removeFirst() : arr2.removeFirst())
    }
    while (arr1.count != 0) {
        output.append(arr1.removeFirst())
    }
    while (arr2.count != 0) {
        output.append(arr2.removeFirst())
    }
    return output
}

// Definition of the generic Merge Sort (recursive) Algorithm function
func mergeSort<T>(inputArray: [T], comparator:(T,T) -> Bool) -> [T] {
    if inputArray.count == 1 {
        return inputArray
    } else {
        var subArray1 = Array(inputArray[0...(inputArray.count-1)/2])
        var subArray2 = Array(inputArray[(inputArray.count-1)/2 + 1...inputArray.count-1])
        subArray1 = mergeSort(inputArray: subArray1, comparator: comparator)
        subArray2 = mergeSort(inputArray: subArray2, comparator: comparator)
        return merge(arr1: &subArray1, arr2: &subArray2, compare: comparator)
    }
}

// Definition of generic comparator functions
func descending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem > secondItem}
func ascending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem < secondItem}

// Set the size of the test array (and the upper bound of the random numbers to fill it: 1 to N)
let N: UInt32 = 20

// Initialize (and print) the test array
var unsortedArray = (1...N).map{_ in Int(arc4random_uniform(N)+1)}
print(unsortedArray)

// Sort the array without mutating it (change the comparator function to control the order of the sort)
let sortedArray = mergeSort(inputArray: unsortedArray, comparator: ascending)

// Print the sorted array
print(sortedArray)
