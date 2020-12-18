
struct Queue<T: Comparable> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    let equal: (T, T) -> Bool = {(item1: T, item2: T) -> Bool in
        return item1 == item2
    }

    // фильтр удаляет из массива все элементы, равные заданному
    func removeAll (element: T) -> [T] {
        var temp = [T]()
        for el in self.elements {
            if equal(element, el) {
                temp.append(el)
            }
        }
        return temp
    }
    subscript(index: Int) -> T? {
        return elements[index]
    }
}


var q = Queue<Int>()
q.push(12)
q.push(13)
q.push(14)
q.push(13)
print(q)
q.removeAll(element: 13)
