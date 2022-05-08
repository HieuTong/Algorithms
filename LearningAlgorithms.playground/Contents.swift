import UIKit
public func example(of description: String, action: () -> ()) {
  print("---Example of \(description)---")
  action()
  print()
}

////Stack

//public struct Stack<Element> {
//
//    private var storage: [Element] = []
//
//    public init() { }
//
//    public init(_ element: [Element]) {
//        storage = element
//    }
//
//    public mutating func push(_ element: Element) {
//      storage.append(element)
//    }
//
//    @discardableResult
//    public mutating func pop() -> Element? {
//      storage.popLast()
//    }
//
//    public func peek() -> Element? {
//        storage.last
//    }
//
//    public var isEmpty: Bool {
//        peek() == nil
//    }
//}
//
//extension Stack: CustomDebugStringConvertible {
//
//    public var debugDescription: String {
//        """
//        ----top----
//        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
//        -----------
//        """
//    }
//}
//
//extension Stack: ExpressibleByArrayLiteral {
//  public init(arrayLiteral elements: Element...) {
//    storage = elements
//  }
//}

//example(of: "using a stack") {
//  var stack = Stack<Int>()
//  stack.push(1)
//  stack.push(2)
//  stack.push(3)
//  stack.push(4)
//
//  print(stack)
//
//  if let poppedElement = stack.pop() {
//    assert(4 == poppedElement)
//    print("Popped: \(poppedElement)")
//  }
//}

//example(of: "initializing a stack from an array") {
//  let array = ["A", "B", "C", "D"]
//  var stack = Stack(array)
//  print(stack)
//  stack.pop()
//}
//
//example(of: "initializing a stack from an array literal") {
//  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
//  print(stack)
//  stack.pop()
//}
//

//// chalenge 1
//func stackReverse<T>(_ array: [T]) {
//    var stack = Stack<T>()
//
//    for item in array {
//        stack.push(item)
//    }
//
//    while let value = stack.pop() {
//        print(value)
//    }
//}
//
//stackReverse([1,3,4,2])

//// chalenge 2
//func checkParentheses(_ string: String) -> Bool {
//    var stack = Stack<Character>()
//
//    for ch in string {
//        if ch == "(" {
//            stack.push(ch)
//        } else if ch == ")" {
//            if stack.isEmpty {
//                return false
//            } else {
//                stack.pop()
//            }
//        }
//    }
//
//    return stack.isEmpty
//}
//
//checkParentheses("a(b)")

////Linklist

//public class Node<Value> {
//
//    public var value: Value
//    public var next: Node?
//
//    public init(value: Value, next: Node? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//extension Node: CustomStringConvertible {
//
//    public var description: String {
//        guard let next = next else { return "\(value)" }
//
//        return "\(value) -> " + String(describing: next) + ""
//    }
//}
//
//public struct LinkedList<Value> {
//
//    public var head: Node<Value>?
//    public var tail: Node<Value>?
//
//    public init() {}
//
//    public var isEmpty: Bool {
//        head == nil
//    }
//
//    public mutating func push(_ value: Value) {
//        head = Node(value: value, next: head)
//        if tail == nil {
//            tail = head
//        }
//    }
//
//    public mutating func append(_ value: Value) {
//
//        guard !isEmpty else {
//            push(value)
//            return
//        }
//
//        tail?.next = Node(value: value)
//        tail = tail?.next
//    }
//
//    public func node(at index: Int) -> Node<Value>? {
//        // 1
//        var currentNode = head
//        var currentIndex = 1
//
//        // 2
//        while currentNode != nil && currentIndex < index {
//            currentNode = currentNode?.next
//            currentIndex += 1
//        }
//
//        return currentNode
//    }
//
//    @discardableResult
//    public mutating func insert(_ value: Value, after node: Node<Value>)  -> Node<Value> {
//        //2
//        guard tail !== node else {
//            append(value)
//            return tail!
//        }
//
//        node.next = Node(value: value, next: node.next)
//        return node.next!
//    }
//
//    @discardableResult
//    public mutating func pop() -> Value? {
//        defer {
//            head = head?.next
//            if isEmpty {
//                tail = nil
//            }
//        }
//        return head?.value
//    }
//
//    @discardableResult
//    public mutating func removeLast() -> Value? {
//        guard let head = head else {
//            return nil
//        }
//
//        guard head.next != nil else {
//            return pop()
//        }
//
//        var prev = head
//        var current = head
//
//        while let next = current.next {
//            prev = current
//            current = next
//        }
//
//        prev.next = nil
//        tail = prev
//        return prev.value
//    }
//
//    @discardableResult
//    public mutating func remove(after node: Node<Value>) -> Value? {
//        defer {
//            if node.next === tail {
//                tail = node
//            }
//            node.next = node.next?.next
//        }
//        return node.next?.value
//    }
//}
//
//extension LinkedList: CustomStringConvertible {
//
//    public var description: String {
//        guard let head = head else { return "Empty list" }
//        return String(describing: head)
//    }
//}
//
//extension LinkedList: Collection {
//
//  public struct Index: Comparable {
//
//    public var node: Node<Value>?
//
//    static public func ==(lhs: Index, rhs: Index) -> Bool {
//      switch (lhs.node, rhs.node) {
//      case let (left?, right?):
//        return left.next === right.next
//      case (nil, nil):
//        return true
//      default:
//        return false
//      }
//    }
//
//    static public func <(lhs: Index, rhs: Index) -> Bool {
//      guard lhs != rhs else {
//        return false
//      }
//      let nodes = sequence(first: lhs.node) { $0?.next }
//      return nodes.contains { $0 === rhs.node }
//    }
//  }
//
//  public var startIndex: Index {
//    Index(node: head)
//  }
//
//  public var endIndex: Index {
//    Index(node: tail?.next)
//  }
//
//  public func index(after i: Index) -> Index {
//    Index(node: i.node?.next)
//  }
//
//  public subscript(position: Index) -> Value {
//    position.node!.value
//  }
//}

//example(of: "Creating and linking nodes") {
//    let node1 = Node(value: 1)
//    let node2 = Node(value: 2)
//    let node3 = Node(value: 3)
//
//    node1.next = node2
//    node2.next = node3
//
//    print(node1)
//}

//example(of: "inserting at a particular index") {
//    var list = LinkedList<Int>()
//    list.push(3)
//    list.push(2)
//    list.push(1)
//
//    print("Before inserting: \(list)")
//    var middleNode = list.node(at: 1)!
//    for _ in 1...4 {
//        middleNode = list.insert(-1, after: middleNode)
//    }
//    print("After inserting: \(list)")
//}

//example(of: "removing the last node") {
//  var list = LinkedList<Int>()
//  list.push(3)
//  list.push(2)
//  list.push(1)
//
//  print("Before removing last node: \(list)")
//  let removedValue = list.removeLast()
//
//  print("After removing last node: \(list)")
//  print("Removed value: " + String(describing: removedValue))
//}

//example(of: "removing a node after a particular node") {
//  var list = LinkedList<Int>()
//  list.push(3)
//  list.push(2)
//  list.push(1)
//
//  print("Before removing at particular index: \(list)")
//  let index = 1
//  let node = list.node(at: index - 1)!
//  let removedValue = list.remove(after: node)
//
//  print("After removing at index \(index): \(list)")
//  print("Removed value: " + String(describing: removedValue))
//}


///chalenge 1: print reverse linkedlist
//func reverseLinkedList<T>(_ list: LinkedList<T>) {
//    reverseLink(node: list.head)
//}
//
//func reverseLink<T>(node: Node<T>?) {
//    guard let node = node else { return }
//    reverseLink(node: node.next)
//    print(node.value)
//}
//
//example(of: "reverse linkedList") {
//  var list = LinkedList<Int>()
//  list.push(3)
//  list.push(2)
//  list.push(1)
//
//  print("Before reverse: \(list)")
//
//  reverseLinkedList(list)
//}

////// Challenge 2:  Find the middle node
//func findTheMiddleNode<T>(list: LinkedList<T>) -> Node<T>? {
//    var slow = list.head
//    var fast = list.head
//
//    while let newFast = fast?.next {
//        fast = newFast.next
//        slow = slow?.next
//    }
//
//    return slow
//}
//
//example(of: "middle node") {
//  var list = LinkedList<Int>()
//  list.push(4)
//  list.push(3)
//  list.push(2)
//  list.push(1)
//
//  print(list)
//
//  if let middle = findTheMiddleNode(list: list) {
//    print(middle.value)
//  }
//}

////Challenge 4: Merge two lists sorting
//func mergeTwoList<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
//    guard !left.isEmpty else {
//      return right
//    }
//
//    guard !right.isEmpty else {
//      return left
//    }
//
//    var newHead: Node<T>?
//
//    // 1
//    var tail: Node<T>?
//    var currentLeft = left.head
//    var currentRight = right.head
//    // 2
//    if let leftNode = currentLeft, let rightNode = currentRight {
//      if leftNode.value < rightNode.value {
//        newHead = leftNode
//        currentLeft = leftNode.next
//      } else {
//        newHead = rightNode
//        currentRight = rightNode.next
//      }
//      tail = newHead
//    }
//
//    // 1
//    while let leftNode = currentLeft, let rightNode = currentRight {
//      // 2
//      if leftNode.value < rightNode.value {
//        tail?.next = leftNode
//        currentLeft = leftNode.next
//      } else {
//        tail?.next = rightNode
//        currentRight = rightNode.next
//      }
//      tail = tail?.next
//    }
//
//    if let leftNodes = currentLeft {
//      tail?.next = leftNodes
//    }
//
//    if let rightNodes = currentRight {
//      tail?.next = rightNodes
//    }
//
//    var list = LinkedList<T>()
//    list.head = newHead
//    list.tail = {
//      while let next = tail?.next {
//        tail = next
//      }
//      return tail
//    }()
//    return list
//}
//
//example(of: "merging two lists") {
//  var list = LinkedList<Int>()
//  list.push(3)
//  list.push(2)
//  list.push(1)
//  var anotherList = LinkedList<Int>()
//  anotherList.push(-1)
//  anotherList.push(-2)
//  anotherList.push(-3)
//  print("First list: \(list)")
//  print("Second list: \(anotherList)")
//  let mergedList = mergeTwoList(list, anotherList)
//  print("Merged list: \(mergedList)")
//}

////Queue
//
//public struct Queue<T> {
//
//    private var leftStack: [T] = []
//    private var rightStack: [T] = []
//
//    public init() {}
//
//    public var isEmpty: Bool {
//        leftStack.isEmpty && rightStack.isEmpty
//    }
//
//    public var peek: T? {
//        !leftStack.isEmpty ? leftStack.last : rightStack.first
//    }
//
//    @discardableResult public mutating func enqueue(_ element: T) -> Bool {
//        rightStack.append(element)
//        return true
//    }
//
//    public mutating func dequeue() -> T? {
//        if leftStack.isEmpty {
//            leftStack = rightStack.reversed()
//            rightStack.removeAll()
//        }
//        return leftStack.popLast()
//    }
//}

////Tree
//public class TreeNode<T> {
//    public var value: T
//    public var children: [TreeNode] = []
//
//    public init(_ value: T) {
//        self.value = value
//    }
//
//    public func add(_ child: TreeNode) {
//        children.append(child)
//    }
//}
//
//extension TreeNode {
//    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
//        visit(self)
//        children.forEach {
//            $0.forEachDepthFirst(visit: visit)
//        }
//    }
//}
//
//extension TreeNode {
//    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
//        visit(self)
//        var queue = Queue<TreeNode>()
//        children.forEach { queue.enqueue($0) }
//        while let node = queue.dequeue() {
//            visit(node)
//            node.children.forEach { queue.enqueue($0) }
//        }
//    }
//}
//
//extension TreeNode where T: Equatable {
//    public func search(_ value: T) -> TreeNode? {
//        var result: TreeNode?
//        forEachLevelOrder { (node) in
//            if node.value == value {
//                result = node
//            }
//        }
//        return result
//    }
//}
//
//func makeBeverageTree() -> TreeNode<String> {
//  let tree = TreeNode("Beverages")
//
//  let hot = TreeNode("hot")
//  let cold = TreeNode("cold")
//
//  let tea = TreeNode("tea")
//  let coffee = TreeNode("coffee")
//  let chocolate = TreeNode("cocoa")
//
//  let blackTea = TreeNode("black")
//  let greenTea = TreeNode("green")
//  let chaiTea = TreeNode("chai")
//
//  let soda = TreeNode("soda")
//  let milk = TreeNode("milk")
//
//  let gingerAle = TreeNode("ginger ale")
//  let bitterLemon = TreeNode("bitter lemon")
//
//  tree.add(hot)
//  tree.add(cold)
//
//  hot.add(tea)
//  hot.add(coffee)
//  hot.add(chocolate)
//
//  cold.add(soda)
//  cold.add(milk)
//
//  tea.add(blackTea)
//  tea.add(greenTea)
//  tea.add(chaiTea)
//
//  soda.add(gingerAle)
//  soda.add(bitterLemon)
//
//  return tree
//}
//
//example(of: "depth-first traversal") {
//  let tree = makeBeverageTree()
////  tree.forEachDepthFirst { print($0.value) }
//  tree.forEachLevelOrder { print($0.value) }
//}

//// Binary tree
//
//public class BinaryNode<Element> {
//
//    public var value: Element
//    public var leftChild: BinaryNode?
//    public var rightChild: BinaryNode?
//
//    public init(value: Element) {
//        self.value = value
//    }
//}
//
//var tree: BinaryNode<Int> = {
//    let zero = BinaryNode(value: 0)
//    let one = BinaryNode(value: 1)
//    let five = BinaryNode(value: 5)
//    let seven = BinaryNode(value: 7)
//    let eight = BinaryNode(value: 8)
//    let nine = BinaryNode(value: 9)
//
//    seven.leftChild = one
//    one.leftChild = zero
//    one.rightChild = five
//    seven.rightChild = nine
//    nine.leftChild = eight
//
//    return seven
//}()
//
//extension BinaryNode: CustomStringConvertible {
//
//  public var description: String {
//    diagram(for: self)
//  }
//
//  private func diagram(for node: BinaryNode?,
//                       _ top: String = "",
//                       _ root: String = "",
//                       _ bottom: String = "") -> String {
//    guard let node = node else {
//      return root + "nil\n"
//    }
//    if node.leftChild == nil && node.rightChild == nil {
//      return root + "\(node.value)\n"
//    }
//    return diagram(for: node.rightChild,
//                   top + " ", top + "┌──", top + "│ ")
//         + root + "\(node.value)\n"
//         + diagram(for: node.leftChild,
//                   bottom + "│ ", bottom + "└──", bottom + " ")
//  }
//}
//
//
////example(of: "tree diagram") {
////    print(tree)
////}
//
//extension BinaryNode {
//    public func traverseInOrder(visit: (Element) -> Void) {
//        leftChild?.traverseInOrder(visit: visit)
//        visit(value)
//        rightChild?.traverseInOrder(visit: visit)
//    }
//
//    public func traversePreOrder(visit: (Element) -> Void) {
//        visit(value)
//        leftChild?.traversePreOrder(visit: visit)
//        rightChild?.traversePreOrder(visit: visit)
//    }
//
//    public func traversePostOrder(visit: (Element) -> Void) {
//        leftChild?.traversePostOrder(visit: visit)
//        rightChild?.traversePostOrder(visit: visit)
//        visit(value)
//    }
//}
//
//public struct BinarySearchTree<Element: Comparable> {
//
//    public private(set) var root: BinaryNode<Element>?
//
//    public init() {}
//}
//
//extension BinarySearchTree: CustomStringConvertible {
//
//    public var description: String {
//        guard let root = root else { return "Empty tree" }
//        return String(describing: root)
//    }
//}
//
//extension BinarySearchTree {
//
//    public mutating func insert(_ value: Element) {
//        root = insert(from: root, value: value)
//    }
//
//    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
//        // 1
//        guard let node = node else {
//            return BinaryNode(value: value)
//        }
//
//        if value < node.value {
//            node.leftChild = insert(from: node.leftChild, value: value)
//        } else {
//            node.rightChild = insert(from: node.rightChild, value: value)
//        }
//
//        return node
//    }
//
//    public func contains(_ value: Element) -> Bool {
//        var current = root
//
//        while let node = current {
//            if node.value == value {
//                return true
//            }
//
//            if value < node.value {
//                current = node.leftChild
//            } else {
//                current = node.rightChild
//            }
//        }
//
//        return false
//    }
//}
//
//private extension BinaryNode {
//
//    var min: BinaryNode {
//        leftChild?.min ?? self
//    }
//}
//
//extension BinarySearchTree {
//
//    public mutating func remove(_ value: Element) {
//        root = remove(node: root, value: value)
//    }
//
//    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
//        guard let node = node else {
//            return nil
//        }
//
//        if value == node.value {
//            if node.leftChild == nil && node.rightChild == nil {
//                return nil
//            }
//
//            if node.leftChild == nil {
//                return node.rightChild
//            }
//
//            if node.rightChild == nil {
//                return node.leftChild
//            }
//
//            node.value = node.rightChild!.min.value
//            node.rightChild = remove(node: node.rightChild, value: node.value)
//
//        } else if value < node.value {
//            node.leftChild = remove(node: node.leftChild, value: value)
//        } else {
//            node.rightChild = remove(node: node.rightChild, value: value)
//        }
//
//        return node
//    }
//}
//
//var exampleTree: BinarySearchTree<Int> {
//  var bst = BinarySearchTree<Int>()
//  bst.insert(3)
//  bst.insert(1)
//  bst.insert(4)
//  bst.insert(0)
//  bst.insert(2)
//  bst.insert(5)
//  return bst
//}
//
//example(of: "building a BST") {
////  var bst = BinarySearchTree<Int>()
////  for i in 0..<5 {
////    bst.insert(i)
////  }
////  print(bst)
//
////    print(exampleTree)
//}
//
//example(of: "removing a node") {
//    var tree = exampleTree
//    print("Tree before removal: ")
//    print(tree)
//    tree.remove(3)
//    print("Tree after remove root: ")
//    print(tree)
//}

//AVL Tree

public class AVLNode<Element> {
    
    public var value: Element
    public var leftChild: AVLNode?
    public var rightChild: AVLNode?
    
    public init(value: Element) {
        self.value = value
    }
    
    public var height = 0
    
    public var balanceFactor: Int {
        leftHeight - rightHeight
    }
    
    public var leftHeight: Int {
        leftChild?.height ?? -1
    }
    
    public var rightHeight: Int {
        rightChild?.height ?? -1
    }
}

extension AVLNode: CustomStringConvertible {
    
    public var description: String {
       diagram(for: self)
    }
    
    private func diagram(for node: AVLNode?,
                           _ top: String = "",
                           _ root: String = "",
                           _ bottom: String = "") -> String {
        guard let node = node else {
          return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
          return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
          + root + "\(node.value)\n"
          + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

extension AVLNode {
    
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

public struct AVLTree<Element: Comparable> {
    
    public private(set) var root: AVLNode<Element>?

    public init() {}
}

extension AVLTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "Empty tree "}
        return String(describing: root)
    }
}

extension AVLTree {
    
    public func constants(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

private extension AVLNode {
    
    var min: AVLNode {
        leftChild?.min ?? self
    }
}

extension AVLTree {
    
    private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        let pivot = node.rightChild!
        node.rightChild = pivot.leftChild
        
        pivot.leftChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        
        let pivot = node.leftChild!
        node.rightChild = pivot.leftChild
        pivot.rightChild = node
        
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let rightChild = node.rightChild else {
            return node
        }
        node.rightChild = rightRotate(rightChild)
        return leftRotate(node)
    }
    
    private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
        guard let leftChild = node.leftChild else {
            return node
        }
        node.leftChild = leftRotate(leftChild)
        return rightRotate(node)
    }
    
    private func balanced(_ node : AVLNode<Element>) -> AVLNode<Element> {
        switch node.balanceFactor {
        case 2:
            if let leftChild = node.leftChild, leftChild.balanceFactor == -1 {
                return leftRightRotate(node)
            } else {
                return rightRotate(node)
            }
        case -2:
            if let rightChild = node.rightChild, rightChild.balanceFactor == 1 {
                return rightLeftRotate(node)
            } else {
                return leftRotate(node)
            }
        default:
          return node
        }
    }
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: AVLNode<Element>?,
                        value: Element) -> AVLNode<Element> {
        guard let node = node else {
            return AVLNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        let balancedNode = balanced(node)
        balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
        return balancedNode
    }
}

//example(of: "repeated insertions in sequence") {
//  var tree = AVLTree<Int>()
//  for i in 0..<15 {
//    tree.insert(i)
//  }
//  print(tree)
//}

example(of: "removing a value") {
  var tree = AVLTree<Int>()
  tree.insert(15)
  tree.insert(10)
  tree.insert(16)
  tree.insert(18)
  print(tree)
  tree.remove(10)
  print(tree)
}
