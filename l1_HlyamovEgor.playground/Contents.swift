import UIKit
import Darwin

// Квадратное уравнение
func sqr(a_x : Double, b_x : Double, c_x: Double){
    print("1) Решение квадратного уравнения")
    let d: Double = b_x*b_x - 4*a_x*c_x
    if( d > 0){
        print((-b_x+sqrt(d))/(2*a_x))
        print((-b_x-sqrt(d))/(2*a_x))
    }
    else if(d == 0){
        print(-b_x/(2*a_x))
    }
    else{
        print("Решений нет")
    }
}
//Треугольник
func triangle(x :Double ,y :Double){
    print("2) Параметры треугольника")
    print("Площадь = \((x*y)/2)")
    let g = sqrt(pow(x, 2) + pow(y, 2))
    print("Гипотенуза = \(g)")
    print("Периметр = \(x+y+g)")
}

// Вклад
func Bank(sum :Double , percent:Double, years :Int){
    print("3) Вычисление суммы вклада")
    var i = 0
    var s = sum
    while i < years{
        s += s*0.01*percent
        i += 1
    }
    print("Сумма вклада через \(years) = \(s)₽")
}
let a : Double = 1
let b : Double = 6
let c : Double = 5
 

sqr(a_x:a,b_x:b,c_x:c)

let k_1 :Double = 3
let k_2 :Double = 4

triangle(x: k_1, y: k_2)

let sum :Double = 100000
let percent :Double = 12
let years :Int = 5
Bank(sum: sum, percent: percent, years: years)

