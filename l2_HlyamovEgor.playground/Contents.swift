import UIKit
import Darwin

// Проверка на четность
func chet(x : Int){
    let c = x % 2
    if(c == 0){
        print("Число \(x) четное")
    }
    else{
        print("Число \(x) нечетное")
    }
}
//Проверка на деление на 3 без остатка
func del_three(x : Int){
    let c = x % 3
    if(c == 0){
        print("Число \(x) делится на три без остатка")
    }
    else{
        print("Число \(x) не делится на три без остатка (Остаток \(c))")
    }
}
func fibonachi(index : Int) -> Int { //Функция вычисления числа фибоначи
    if (index < 2){
        return index
    }
    else{
        return mas_fib[index-1]+mas_fib[index-2]
    }

}
print("1)")
chet(x: 6) //1) Проверка на четность
print("2)")
del_three(x: 9) //2)  Проверка на деление на три

var numbers: [Int] = [] //3)  Создание массива 0..99
for i in 0 ..< 100 {
    numbers.append(i)

}
for elem in numbers{ //4) Удаление элементов из массива
    if ((elem % 2 == 0) || (elem % 3 != 0)){
        numbers.remove(at : numbers.firstIndex(of: elem)!)
    }
}
print("3,4)")
print(numbers)// Вывод


var mas_fib: [Int] = [] //5)  Создание массива
for i in 0 ..< 50 { // Заполнение числами фибоначи
    mas_fib.append(fibonachi(index: i))

}
print("5)")
print(mas_fib)// Вывод
print("6)")
var mas: [Int] = [2] //5)  Создание массива
var easy_nums: [Int] = [2]
for i in 3 ..< 501 { // Заполнение числами
        var k = 0;
        for elem in easy_nums{
            if i % elem == 0{
                k = 1
            }
        }
        if(k == 0){
            mas.append(i)
            easy_nums.append(i)
        }
}
print(mas)

var x = 2
x += 1
