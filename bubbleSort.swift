// Bubble Sort (optimized) implementation in Swift
//
// Bubble Sort has the time complexity of O(n^2) in its worst case, so it is not recommended to be used at all.
// The only advantage Bubble Sort has over most sort algorithms is its ability to detect an already sorted input, which would bring its time complexity down to O(n).
//
// The following optimized implementation of Bubble Sort generates and prints an array of randomly generated integers (of length N; default is 20), prints the total number of swaps and iterations, and prints the sorted array.
//
// Marwan Alani - 2017

import Foundation

// Definition of the generic Bubble Sort Algorithm function (optimized)
func bubbleSort<T>(inputArray: [T], comparator:(T,T) -> Bool) -> [T] {
    var outputArray = inputArray
    var iterations = 0
    var swaps = 0
    if outputArray.count > 1 {
        for mainIndex in 0...outputArray.count-2 {
            var noSwapsOccured = true
            for subIndex in 0...outputArray.count-mainIndex-2 {
                if comparator(outputArray[subIndex], outputArray[subIndex+1]) {
                    swap(&outputArray[subIndex], &outputArray[subIndex+1])
                    swaps += 1
                    noSwapsOccured = false
                }
            }
            iterations += 1
            // Check if the array is already sorted
            if noSwapsOccured {
                break
            }
        }
    }
    print("Bubble Sort completed after \(swaps) swap(s) thourgh \(iterations) iteration(s)")
    return outputArray
}

// Definition of generic comparator functions
func ascending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem > secondItem}
func descending<T: Comparable> (firstItem: T, secondItem: T) -> Bool {return firstItem < secondItem}

// Set the size of the test array (and the upper bound of the random numbers to fill it: 1 to N)
let N: UInt32 = 20

// Initialize (and print) the test array
var unsortedArray = (1...N).map{_ in Int(arc4random_uniform(N)+1)}
print(unsortedArray)

// Sort the array without mutating it (change the comparator function to control the order of the sort)
let sortedArray = bubbleSort(inputArray: unsortedArray, comparator: ascending)

// Print the sorted array
print(sortedArray)
