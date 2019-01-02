/**
 A PriorityQueue implementation based on a Heap data structure.
 */
class PriorityQueue<DataType: Comparable> {
  /**
   The backing storage for our queue.
   */
  private var queue: Array<DataType>
  
  /**
   The current size of the queue.
   */
  public var size: Int {
    return self.queue.count
  }
  
  public init() {
    self.queue = Array<DataType>()
  }
}

extension PriorityQueue: Queue {
  @discardableResult
  public func add(_ item: DataType) -> Bool {
    self.queue.append(item)
    self.heapifyUp(from: self.queue.count - 1)
    return true
  }
  
  @discardableResult
  public func remove() throws -> DataType {
    guard self.queue.count > 0 else {
      throw QueueError.noSuchItem("Attempt to remove item from an empty queue.")
    }
    return self.popAndHeapifyDown()
  }
  
  public func dequeue() -> DataType? {
    guard self.queue.count > 0 else {
      return nil
    }
    return self.popAndHeapifyDown()
  }
  
  public func peek() -> DataType? {
    return self.queue.first
  }
  
  public func clear() {
    self.queue.removeAll()
  }
  
  /**
   Pops the first item in the queue and restores the min heap order of the queue by moving the root item towards the end of the queue.
   - returns: The first item in the queue.
   */
  private func popAndHeapifyDown() -> DataType {
    let firstItem = self.queue[0]
    
    if self.queue.count == 1 {
      self.queue.remove(at: 0)
      return firstItem
    }
    
    self.queue[0] = self.queue.remove(at: self.queue.count - 1)
    
    self.heapifyDown()
    
    return firstItem
  }
  
  /**
   Restores the min heap order of the queue by moving an item towards the beginning of the queue.
   - parameter index: The index of the item to move.
   */
  private func heapifyUp(from index: Int) {
    var child = index
    var parent = child.parent
    
    while parent >= 0 && self.queue[parent] > self.queue[child] {
      swap(parent, with: child)
      child = parent
      parent = child.parent
    }
  }
  
  /**
   Restores the min heap order of the queue by moving the root item towards the end of the queue.
   */
  private func heapifyDown() {
    var parent = 0
    
    while true {
      let leftChild = parent.leftChild
      if leftChild >= self.queue.count {
        break
      }
      
      let rightChild = parent.rightChild
      var minChild = leftChild
      if rightChild < self.queue.count && self.queue[minChild] > self.queue[rightChild] {
        minChild = rightChild
      }
      
      if self.queue[parent] > self.queue[minChild] {
        self.swap(parent, with: minChild)
        parent = minChild
      } else {
        break
      }
    }
  }
  
  /**
   Swaps the items located at two different indices in our backing storage.
   - parameter firstIndex: The index of the first item to swap.
   - parameter secondIndex: The index of the second item to swap.
   */
  private func swap(_ firstIndex: Int, with secondIndex: Int) {
    let firstItem = self.queue[firstIndex]
    self.queue[firstIndex] = self.queue[secondIndex]
    self.queue[secondIndex] = firstItem
  }
}

extension PriorityQueue: CustomStringConvertible {
  public var description: String {
    return self.queue.description
  }
}

private extension Int {
  var leftChild: Int {
    return (2 * self) + 1
  }
  
  var rightChild: Int {
    return (2 * self) + 2
  }
  
  var parent: Int {
    return (self - 1) / 2
  }
}
