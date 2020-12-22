// 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
class Stack<T: Comparable> {
    var elements: [T] = []
    enum stackErrors: Error {
        case notEnoughElementsInStack
    }
    func push(element: T){
        elements.append(element)
    }
    
    func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeLast()
    }
    
    func popMultiple(howMany num: Int) -> ([T]?, Error?) {
        guard num <= elements.count else {
            return (nil, stackErrors.notEnoughElementsInStack)
        }
        var tmp = [T]()
        for _ in 1...num {
            tmp.append(pop()!)
        }
        return (tmp, nil)
    }
}




// 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
enum QueueError: Error {
    case noSuchElement
    case noFreeSpace
}
class QueueWIthSize<T: Comparable> {
    var elements: [T] = []
    var size: Int
    func push(_ element: T) throws {
        guard elements.count + 1 <= size else {
            throw QueueError.noFreeSpace
        }
        elements.append(element)
    }
    func pop() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    let equal: (T, T) -> Bool = {(item1: T, item2: T) -> Bool in
        return item1 == item2
    }
    init(size: Int) {
        self.size = size
    }
    // фильтр удаляет из массива все элементы, равные заданному
    func removeAll (element: T) throws -> QueueWIthSize {
        // Проверка, есть ли элемент в очереди
        guard elements.contains(element) else {
            throw QueueError.noSuchElement
        }
        var temp = [T]()
        for el in self.elements {
            if !equal(element, el) {
                temp.append(el)
            }
        }
        self.elements = temp
        return self
    }
   // подправил сабскрипт для случаев, когда вылетает Index out of range
    subscript(index: Int) -> T? {
        guard index >= 0, index < elements.count else {
            return nil
        }
        return elements[index]
    }
}


var s = Stack<Int>()
s.push(element: 1)
s.push(element: 2)
s.push(element: 3)
let multiplePops = s.popMultiple(howMany: 2)
print(multiplePops.0!)
let multiplePops2 = s.popMultiple(howMany: 12)
if let pops = multiplePops2.0 {
    print("Pops: \(pops)")
} else if let error = multiplePops2.1 {
    print("Error: \(error)") //Error: notEnoughElementsInStack
}


var q = QueueWIthSize<Int>(size: 3)
// Заполняем очередь пока возможно
for element in 1...10 {
    do {
        try q.push(element)
    } catch {
        print("Queue is full!")
        break
    }
}

q.elements
try q.removeAll(element: 2)
q.elements
do {
    print(try q.removeAll(element: 29))
} catch {
    print("Queue does not contain such an element")
}




