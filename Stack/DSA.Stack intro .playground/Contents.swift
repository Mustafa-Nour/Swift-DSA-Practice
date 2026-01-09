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
    
    public  func peek() -> Element? {
        storage.last
    }
    
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public var stackSize: Int {
        storage.count
    }
    
    
    
    
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
"""
 ----top----
 \(storage.map { "\($0)" }.reversed().joined(separator: "|"))
 -----------
"""
    }
}
// MARK: - popular problems on stack (reverse an array using stack )

let array: Array = [1,2,3,4,5]

func reverseUsingStack (_ arrayTorevese  : Array<Any>) {
    var reversedArray = Stack<Int>()
    
    for value in arrayTorevese {
        reversedArray.push(value as! Int)
    }
    
    print(reversedArray)
}

reverseUsingStack(array)


/// MARK: - Valid parantheses problem


var testString = "h(e))llo(world)()"
func checkPrentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for char in string {
        if char == "(" {
            stack.push(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                 stack.pop()
            }
        }
    }
    return stack.isEmpty
}

checkPrentheses(testString)
