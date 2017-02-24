// Simple Queue implementation in Swift
//
// A Queue is a FIFO (First In First Out) sequential data structure with the purpose of having an Insertion, Deletion, and Access (for the front element) with time complexity of N(1)
//
// This file was also written to practice XCode's documentation standards, so feel free to refer to the comments for more details about the code
//
// Marwan Alani - 2017

import Foundation

//************ Node Class Begins ************//

/// Base Node class to be used in a Queue
class Node<T> {

    /// The variable to hold the data part of the node
    let data: T

    /// An optional link to the next node
    var next: Node<T>?

    init(data: T) {
        self.data = data
        self.next = nil
    }

    init(data: T, nextNode: Node<T>?) {
        self.data = data
        self.next = nextNode
    }
}

//************ Node Class Ends ************//

//************ Queue Class Begins ************//

/// Generic Queue implementation
class Queue<T> {

    /// The front node of the queue
    private var front: Node<T>?

    /// The last (back) node of the queue
    private var back: Node<T>?

    /// Default initializer with empty queue
    init() {
        self.front = nil
        self.back = nil
    }

    /// Overloaded initializer to create a queue with 1 node
    /// Note that the "node" is passed by reference, hence we copy its data to a new node first
    ///
    /// - Parameter top: Set the front of the queue as the passed parameter
    init(front: Node<T>) {
        let nodeCopy = Node(data: front.data)
        self.front = nodeCopy
        self.back = nodeCopy
    }

    /// Check if the queue is empty
    ///
    /// - Returns: A boolean value to indicate whether the queue is empty.
    public func isEmpty() -> Bool {
        return self.front == nil
    }

    /// Inserts a value at the back of the queue. O(1)
    ///
    /// - Parameter data: The data value to be inserted
    public func enqueue(data: T) {
        if (self.isEmpty()) {
            let newNode = Node(data: data)
            self.front = newNode
            self.back = newNode
        } else {
            let newNode = Node(data: data)
            self.back?.next = newNode
            self.back = newNode
        }
    }

    /// Inserts a node at the back of the queue. O(1)
    /// Note that the "node" is passed by reference, hence we copy its data to a new node first
    ///
    /// - Parameter node: The node to be inserted
    public func enqueue(node: Node<T>) {
        let nodeCopy = Node(data: node.data)
        self.back?.next = nodeCopy
    }


    /// Removes the front node in the queue and returns its value. If the queue is empty, it returns a nil. O(1)
    ///
    /// - Returns: An optional T. The data of the removed node (if any), or nil otherwise
    public func dequeue() -> T? {
        var removedValue: T? = nil
        if (!self.isEmpty()) {
            removedValue = self.front?.data
            self.front = self.front?.next
        }
        return removedValue
    }


    /// Returns the front data value in the queue (if any) without deleting the node. O(1)
    ///
    /// - Returns: The optional data value of the first node in the queue. Returns nil if the queue is empty
    public func peek() -> T? {
        var value: T? = nil
        if (!self.isEmpty()) {
            value = self.front?.data
        }
        return value
    }

    /// Create an Array from the contents of the queue. O(n)
    ///
    /// - Returns: An array of type T containing the elements of the queue in the same order
    public func toArray() -> [T] {
        var array = [T]()
        var currentNode = self.front
        while (currentNode != nil) {
            array.append(currentNode!.data)
            currentNode = currentNode!.next
        }
        return array
    }
}

//************ Queue Class Ends ************//

//************ Main Program (for testing) Begins ************//

// Create an empty queue
let myQueue = Queue<Int>()

// Set N to the desired number of test elements. Default is 20
let N: UInt32 = 20

// Populate the stack with random numbers
print("Enqueue \(N) random number(s) into the Queue...\n")
for _ in 1...N {
    myQueue.enqueue(data: Int(arc4random_uniform(N)+1))
}

// Print the queue as an Array
print("Printing the Queue as an Array:")
print(myQueue.toArray(),"\n")

// Remove the first 2 values, then add a random number
print("Dequeue the front element: \(myQueue.dequeue()!)")
print("Dequeue the front element: \(myQueue.dequeue()!)")
print("Enqueue a random element...\n")
myQueue.enqueue(data: Int(arc4random_uniform(N)+1))

// Print the queue as an Array
print("Printing the updated Queue as an Array:")
print(myQueue.toArray(),"\n")

// Peek at the current front
print("Peeking into the front element of the Queue: \(myQueue.peek()!)\n")

//************ Main Program (for testing) Ends ************//
