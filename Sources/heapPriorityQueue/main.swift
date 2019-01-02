let c = PriorityQueue<Int>()
c.add(10)
c.add(20)
c.add(70)
c.add(28)
c.add(67)
c.add(33)
c.add(3)
c.add(1)
c.add(28)
c.add(7)
c.add(33)
c.add(6)

while c.size != 0 {
  print(c.dequeue()!)
}
