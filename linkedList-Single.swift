// Linked List (Simple Singly) implementation in Swift
//
// This file was also written to practice XCode's documentation standards, so feel free to refer to the comments for more details about the code
//
// Marwan Alani - 2017

import Foundation

//************ Node Class Begins ************//

/// Base Node class to be used in a Linked List
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

//************ Linked List Class Begins ************//

/// Generic Singly Linked List implementation
class LinkedList<T> {

    /// The root node of the list
    private var root: Node<T>?

    /// The number of nodes/values in the list.
    public var count: Int = 0

    /// Default initializer with empty list
    init() {
        self.root = nil
    }

    /// Overloaded initializer to create a list with 1 node
    /// Note that we're copying the data from the node first because it is passed by reference, and we want owenership over our nodes
    ///
    /// - Parameter root: Set the root of the list as the passed parameter
    init(root: Node<T>) {
        let nodeCopy = Node(data: root.data)
        self.root = nodeCopy
    }

    /// Create a string representation of the list
    ///
    /// - Returns: A string conatining the comma separated values of the list
    public func toString() -> String {
        var tempString = "["
        var currentNode = self.root
        if let unwrappedNode = currentNode {
            tempString += "\(unwrappedNode.data)"
            currentNode = unwrappedNode.next
        }
        while (currentNode != nil) {
            tempString += ", \(currentNode!.data)"
            currentNode = currentNode!.next
        }
        tempString += "]"
        return tempString
    }

    /// Check if the list is empty
    ///
    /// - Returns: A boolean value to indicate whether the list is empty.
    public func isEmpty() -> Bool {
        return self.count == 0
    }

    /// Inserts a value at the beginning of the list. O(1)
    ///
    /// - Parameter data: The data value to be inserted
    public func insertFirst(data: T) {
        let newNode = Node(data: data, nextNode: self.root)
        self.root = newNode
        self.count += 1
    }

    /// Inserts a node at the beginning of the list. O(1)
    /// Note that we're copying the data from the node first because it is passed by reference, and we want owenership over our nodes
    ///
    /// - Parameter node: The node to be inserted
    public func insertFirst(node: Node<T>) {
        let nodeCopy = Node(data: node.data)
        nodeCopy.next = self.root
        self.root = nodeCopy
        self.count += 1
    }

    /// Inserts a value at the end of the list. O(n)
    ///
    /// - Parameter data: The data value to be inserted
    public func insertLast(data: T) {
        if (self.count == 0) {
            self.root = Node(data: data)
            self.count += 1
        } else {
            var currentNode = self.root
            while (currentNode!.next != nil) {
                currentNode = currentNode!.next
            }
            currentNode!.next = Node(data: data)
            self.count += 1
        }
    }

    /// Inserts a node at the end of the list. O(n)
    /// Note that we're copying the data from the node first because it is passed by reference, and we want owenership over our nodes
    ///
    /// - Parameter node: The node to be inserted
    public func insertLast(node: Node<T>) {
        let nodeCopy = Node(data: node.data)
        if (self.count == 0) {
            self.root = nodeCopy
            self.count += 1
        } else {
            var currentNode = self.root
            while (currentNode!.next != nil) {
                currentNode = currentNode!.next
            }
            currentNode!.next = nodeCopy
            self.count += 1
        }
    }

    /// Removes the first node in the list and returns its value. If the list is empty, it returns a nil. O(1)
    ///
    /// - Returns: An optional T. The data of the removed node (if any), or nil otherwise
    public func removeFirst() -> T? {
        var removedValue: T? = nil
        if (self.count != 0) {
            removedValue = root?.data
            self.root = self.root!.next
            self.count -= 1
        }
        return removedValue
    }

    /// Removes the last node in the list and returns its value. If the list is empty, it returns a nil. O(n)
    ///
    /// - Returns: An optional T. The data of the removed node (if any), or nil otherwise
    public func removeLast() -> T? {
        var removedValue: T? = nil
        if (self.count == 1) {
            removedValue = self.root!.data
            self.root = nil
            self.count -= 1
        } else if (self.count > 1) {
            var previousNode = self.root
            while (previousNode!.next!.next != nil) {
                previousNode = previousNode!.next
            }
            removedValue = previousNode!.next!.data
            previousNode!.next = nil
            self.count -= 1
        }
        return removedValue
    }

    /// Returns the first data value in the list (if any). O(1)
    ///
    /// - Returns: The optional data value of the first node in the list. Returns nil if the list is empty
    public func first() -> T? {
        var value: T? = nil
        if (self.count > 0) {
            value = self.root?.data
        }
        return value
    }

    /// Returns the last data value in the list (if any). O(n)
    ///
    /// - Returns: The optional data value of the last node in the list. Returns nil if the list is empty
    public func last() -> T? {
        var value: T? = nil
        if (self.count > 0) {
            var currentNode = self.root
            while (currentNode?.next != nil) {
                currentNode = currentNode?.next
            }
            value = currentNode?.data
        }
        return value
    }

    /// Create an Array from the contents of the list. O(n)
    ///
    /// - Returns: An array of type T containing the elements of the list in the same order
    public func toArray() -> [T] {
        var array = [T]()
        var currentNode = self.root
        while (currentNode != nil) {
            array.append(currentNode!.data)
            currentNode = currentNode!.next
        }
        return array
    }
}

//************ Linked List Class Ends ************//

//************ Main Program (for testing) Begins ************//

// Create an empty list
let myList = LinkedList<Int>()

// Set N to the desired number of test elements. Default is 20
let N: UInt32 = 20

// Populate the list with random numbers (half to the front, half to the back)
for _ in 1...N/2 {
    myList.insertFirst(data: Int(arc4random_uniform(N)+1))
}
for _ in 1...N/2 {
    myList.insertLast(data: Int(arc4random_uniform(N)+1))
}

// Print the list
print("Initial List with \(myList.count) item(s):")
print(myList.toString(),"\n")

// Use each remove function once
print("Removing the first element: \(myList.removeFirst()!)")
print("Removing the last element: \(myList.removeLast()!)\n")

// Use the "peek" functions (first & last)
print("Peeking into the first element: \(myList.first()!)")
print("Peeking into the last element: \(myList.last()!)\n")

// Printing the list as an array
print("The list as an array of \(myList.count) item(s):")
print(myList.toArray())

//************ Main Program (for testing) Ends ************//
