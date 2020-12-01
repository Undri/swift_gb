import Foundation

// Задание 1. Функция, определяющая четность числа
func even(_ n: Int) -> Bool{
    return n % 2 == 0
}
print(even(11))



// Задание 2. Функция, определяющая делимость числа на 3.
func devide3(_ n: Int) -> Bool {
    return n % 3 == 0
}
print(devide3(9))



// Задание 3. Создание возрастающего массива из 100 чисел.
var arr = Array(1...100)
print("\nThe Array: \(arr[0...5])... \(arr[95...99])\n")


// Задание 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
// Version 1.
for el in arr {
    if even(el) {arr.remove(at: arr.firstIndex(of: el)!)}
     else if !devide3(el) {arr.remove(at: arr.firstIndex(of: el)!)}
}
print("Version 1: \(arr)")
// Version 2.
arr = Array(1...100)
var version2 = [Int]()
for el in arr where !even(el) && devide3(el) {version2.append(el)}
arr = version2
print("Version 2: \(arr)")
print()



// Задание 5.* Функцию, которая добавляет в массив новое число Фибоначчи. Добавление 100 чисел Фибоначчи.
func addFibo(toArray array: inout [Decimal]){
    array.append(array.last! + array[array.count - 2])
}
var f: [Decimal] = [0, 1]
for _ in 0...100 {
    addFibo(toArray: &f)
}
print("100 чисел Фибоначчи: \(f[0...6]) ... \(f[95...99])\n" )



// Задание 6.* Заполнить массив простыми числами
func simpleNumbers(from a: Int, to b: Int) -> [Int] {
    var arr = Array(a...b)
    var index = 0
    var deleted = [Int]()
    if arr.contains(1) {arr.remove(at: arr.firstIndex(of: 1)!)}
    for el in arr {
        if !deleted.contains(el) {
            index = arr.firstIndex(of: el)! + el
            while index <= arr.count-1{
                let removed = arr[index]
                deleted.append(removed)
                index += el
            }
        }
    }
    return Set(arr).symmetricDifference(Set(deleted)).sorted()
}

var simpleArray = [Int]()
var simples = simpleNumbers(from: 1, to: 100) // простые числа от 1 до 100
for _ in (0...100) {
    simpleArray.append(simples[Int.random(in: 0..<simples.count)])
}
print("Массив из 100 элементов, заполненный простыми числами \(simpleArray)")
