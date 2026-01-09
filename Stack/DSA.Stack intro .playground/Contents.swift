import UIKit
import Foundation

// first what is a stack ?
// data structure which inforce the insertion and retriving data (which is push and pop operations )

// used in ios in navigation stack , memory alocation at at the archticture level , and memory for  local variables

// MARK: -  impelementaion

public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init () {}
    
    // MARK: - mutating function or mutating is somethig like a permission to modify a value types such as struct or enums
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    // MARK: - dicardable result means that the return value maybe ignored
    @discardableResult
    public mutating func pop() -> Element? {
      storage.popLast()
    }
    
    
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
"""
 ----top----
 \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
 -----------
"""
    }
}


var stack = Stack<Int> ()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

print(stack)
