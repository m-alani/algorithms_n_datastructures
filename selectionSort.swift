// Selection Sort implementation in Swift
//
// Selection Sort has the time complexity of O(n^2), and it is not recommended to be used at all.
//
// The following implementation of Selection Sort generates and prints an array of randomly generated integers (of length N; default is 20), sorts the array, prints the total number of swaps, and prints the sorted array.
//
// Marwan Alani - 2017

import Foundation

// Definition of the generic Selection Sort Algorithm function
func selectionSort<T>(inputArray: [T], shouldSwap:(T,T) -> Bool) -> [T] {
    var outputArray = inputArray
    var swaps = 0
    if outputArray.count > 1 {
        for mainIndex in 0...outputArray.count-2 {
            var swapIndex = mainIndex
            for subIndex in mainIndex+1...outputArray.count-1 {
                if shouldSwap(outputArray[subIndex], outputArray[swapIndex]) {
                    swapIndex = subIndex
                }
            }
            if swapIndex != mainIndex {
                swap(&outputArray[swapIndex], &outputArray[mainIndex])
                swaps += 1
            }
        }
    }
    print("Selection Sort completed after \(swaps) swap(s)")
    return outputArray
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
let sortedArray = selectionSort(inputArray: unsortedArray, shouldSwap: ascending)

// Print the sorted array
print(sortedArray)
