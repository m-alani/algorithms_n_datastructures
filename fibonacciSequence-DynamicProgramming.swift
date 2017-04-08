
// fibonacciSequence-DynamicProgramming.Swift
//
// This is a sample implementation of the Fibonacci Sequence in 2 separate function written to showcase a common example of Dynamic Programming implementations and the benifits of it.
// This implementation assumes that the Fibonacci Sequnece (F) base cases are F(0)=0 & F(1)=1
//
// Marwan Alani - 2017

/// Simple function to find the Fibonacci Sqeuence value of N recursively
/// This function has the time complexity of O(2^n)
///
/// - Parameter n:  A non-negative integer representing the index of the Fibonacci sequence value to find
/// - Returns:      The Fibonacci value of the given index
func recursiveFib(of n: UInt) -> UInt {
    var fib: UInt = 1
    if (n > 2) {
        fib = recursiveFib(of: n-1) + recursiveFib(of: n-2)
    }
    return fib
}


/// A memoized implementation of the Fibonacci Sequence using Dynamic Programming.
/// This function has the time complexity of O(n)
///
/// - Parameter n: A non-negative integer representing the index of the Fibonacci sequence value to find
/// - Returns: The Fibonacci value of the given index
func memoizedFib(of n: UInt) -> UInt {
    var cache = [UInt:UInt]()
    cache[0] = 0
    cache[1] = 1
    func fib(_ n: UInt) -> UInt {
        if (cache[n] == nil) {
            cache[n] = fib(n-1) + fib(n-2)
        }
        return cache[n]!
    }
    return fib(n)
}


/******************** BEGINNING OF MAIN ********************/

// Set N to the desired Fibonacci number you want to test against
let n: UInt = 45

// Find the Fibonacci of N using the regular approach
var startingTime = Date()
var fibNumber = recursiveFib(of: n)
var elapsedTime = Double(round(Date().timeIntervalSince(startingTime) * 1000) / 1000)
print("Regular Approach:\n  The Fibonacci Sequence value of \(n) is: \(fibNumber)\n    Found in \(elapsedTime) seconds.")

// Find the Fibonacci of N using Dynamic Programming
startingTime = Date()
fibNumber = memoizedFib(of: n)
elapsedTime = Double(round(Date().timeIntervalSince(startingTime) * 1000) / 1000)
print("\nUsing Dynamic Programming:\n  The Fibonacci Sequence value of \(n) is: \(fibNumber)\n    Found in \(elapsedTime) seconds.")

/*********************** END OF MAIN ***********************/
