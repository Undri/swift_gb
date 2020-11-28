// Задание 1. Решение квадратного уравнения

let a: Double = 3.0
let b: Double = -7.0
let c: Double = 2
let d = b * b - 4 * a * c

if d < 0 {
    print("Решений нет!")
} else if d == 0 {
    print("Единственное решение: " + String((-b + d.squareRoot()) / (2*a)))
} else {
    let x1 = (-b + d.squareRoot()) / (2*a)
    let x2 = (-b - d.squareRoot()) / (2*a)
    print("x1: " + String(x1))
    print("x2: " + String(x2))
}

// Задание 2. Гипотенуза, площадь и периметр прямоугольного треугольника

let cat1 = 3.0
let cat2 = 4.0
let hyp = (cat1*cat1 + cat2*cat2).squareRoot()

print("Гипотенуза: " + String(hyp))
print("Периметр: " + String(cat1 + cat2 + hyp))
print("Площадь: " + String(cat1*cat2/2))

// Задание 3. Вычисление суммы вклада через 5 лет
var vklad = 100.0
let proc = 0.05
for i in 0...4 {
    vklad = vklad + vklad * proc
    let year: String
    switch i + 1 {
    case 1:
        year = "год"
    case 5:
        year = "лет"
    default:
        year = "года"
    }
    print("Сумма через " + String(i + 1) + " " + year + " " + String(vklad) + " RUпий")
}
