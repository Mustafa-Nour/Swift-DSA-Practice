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
    
    // MARK: - Push to the linked list head like the head of a train.
    public mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    // MARK: -this func push the elements in the tail of the list
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
           push(value)
            return
        }
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    // MARK: -  returns the node of the index given
    public mutating func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var curruntIndex = 0
        
        while currentNode != nil && curruntIndex < index {
            currentNode = currentNode!.next
            curruntIndex += 1
        }
        return currentNode
    }
    
    // MARK: - pop func removing the head of the list
    @discardableResult
    public mutating func pop() -> Value? {
        do {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // MARK: -  remove after function
    @discardableResult
    public mutating func removeAfter(after node: Node<Value>) ->Value? {
        do {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
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

var linkedl = Linkedlist<Int> ()

linkedl.append(1)
linkedl.append(2)
linkedl.append(3)

linkedl.pop()

print(linkedl)
