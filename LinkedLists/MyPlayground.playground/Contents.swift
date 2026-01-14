// linkeed list is a collection of values arranged in a liner , undirectional sequence



import Foundation
// the node here becuse we use references to reference the next value in the liked lists which suit the class bechavior (A reference type )
 public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String (describing:  next) + " "
    }
}
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3
node3.next = nil

print(node1)
// We use a struct for LinkedList to give it value semantics,
// so copying the list creates an independent copy (like Array in Swift).
public struct Linkedlist<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    
    public mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
           push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    public mutating func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var curruntIndex = 0
        
        while currentNode != nil && curruntIndex < index {
            currentNode = currentNode!.next
            curruntIndex += 1
        }
        
        return currentNode
    }
}

extension Linkedlist: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
