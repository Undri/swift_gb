protocol Weightable {
    var weight: Double {get set};
}


struct Queue<T> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T {
        return elements.removeFirst()
    }
    subscript(index: UInt) -> T {
        return self.elements[Int(index)]
    }
}


