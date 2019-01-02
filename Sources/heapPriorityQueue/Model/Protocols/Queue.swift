protocol Queue {
  associatedtype DataType: Comparable
  
  /**
   Inserts a new item into the queue.
   - parameter item: The item to add.
   - returns: Whether or not the insert was successful.
   */
  @discardableResult func add(_ item: DataType) -> Bool
  
  /**
   Removes the first item in line.
   - returns: The removed item.
   - throws: An error of type QueueError.
   */
  @discardableResult func remove() throws -> DataType
  
  /**
   Gets the first item in line and removes it from the queue.
   - returns: An Optional containing the first item in the queue.
   */
  func dequeue() -> DataType?
  
  /**
   Gets the first item in line, without removing it from the queue.
   - returns: An Optional containing the first item in the queue.
   */
  func peek() -> DataType?
  
  /**
   Clears the queue.
   */
  func clear() -> Void
}
