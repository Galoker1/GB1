import UIKit
import Foundation

struct Queue<T>:CustomStringConvertible{
    var array: [T] = []
    var first: T? {
        if !array.isEmpty{
            return array.first
        }
        return nil
    }
    //Добавление в конец очереди
    mutating func push(_ element: T){
        array.append(element)
    }
    var peek : T?{
        return array.first
            
    }
    //Удаление первого элемента
    mutating func pop() -> T?{
        if array.isEmpty{
            return nil
        }
        else{
            return array.removeFirst()
        }
    }
    // Удаление первого с условием
    mutating func pop(predicate:(T?) -> Bool) -> T?{
        let firstElement = peek
        if predicate(firstElement){
            return pop()
        }
        return nil
        
    }
    
    //Вывод массива
    var description: String{
        return array.description
    }
    //Доступ к элементу по индексу
    subscript(index:Int) -> T?{
        get{
            guard !array.isEmpty,index >= 0,index < array.count else{
                return nil
            }
            return array[index]
        }
        set{
            guard let newValue = newValue, index >= 0,index < array.count else{
                return
            }
            array[index] = newValue
            
        }
    }
    // Применить ко всем элементам очереди
    func map(_ transform: (T)-> T) -> [T]{
        var array2 : [T] = []
        for item in array{
            let item2 = transform(item)
            array2.append(item2)
        }
        return array2
    }

}

var que = Queue<Int>()

que.push(1)
que.push(2)
que.push(3)
que.first
print(que)
que.pop()
print(que)

que[0]
que[2]
que[1] = 6
que[2] = 9
print(que.map {$0 * 6})

let popWithPredicate = que.pop(predicate: {element in
    guard let element = element else{
            return false
}
        return element % 2 == 0
}
)
popWithPredicate
