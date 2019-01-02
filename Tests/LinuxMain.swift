import XCTest

import heapPriorityQueueTests

var tests = [XCTestCaseEntry]()
tests += heapPriorityQueueTests.allTests()
XCTMain(tests)