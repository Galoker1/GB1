import UIKit

enum Windows{
    case open
    case close
}
enum Engine{
    case on
    case off
}
protocol Car {
    var Name:String {get}
    var Year:Int {get}
    var engineOn: Bool{get set}
    var windowsOpen: Bool{get set}
}
extension Car{
    mutating func actionWithEngine(mode: Engine){
            switch mode {
                case .on:
                if(self.engineOn == true){
                    print("Двигатель уже запущен")
                }
                else{
                    print("Запускаю Двигатель")
                    self.engineOn = true
                }
            case .off:
                if(self.engineOn == false){
                    print("Двигатель уже выключен")
                }
                else{
                    print("Заглушаю Двигатель")
                    self.engineOn = false
                }
            }
        }
    mutating func actionWithWindows(mode: Windows){
        switch mode{
            case .open:
            if(self.windowsOpen == true){
                print("Окна уже открыты")
            }
            else{
                print("Открываю окна")
                self.windowsOpen = true
            }
        case .close:
            if(self.windowsOpen == false){
                print("Окна уже закрыты")
            }
            else{
                print("Закрываю окна")
                self.windowsOpen = false
            }
        }
    }
}
class SportCar: Car{
    enum Nitro{
        case on
        case off
    }
    var Name: String
    var nitro : Bool = false
    var Year: Int
    
    var engineOn: Bool = false
    var windowsOpen: Bool = false
    
    
    public func actionWithNitro(mode: Nitro){
        switch mode{
            case .on:
            if(self.nitro == true){
                print("Нитро уже запущено")
            }
            else{
                print("Включаю нитро")
                self.nitro = true
            }
            
            
        case .off:
            if(self.nitro == false){
                print("Нитро уже выключено")
            }
            else{
                print("Выключаю нитро")
                self.nitro = false
            }
        }
        
    }
    init(Name:String,Year:Int){
        self.Name = Name
        self.Year = Year
    }
    
    
    
}

class TruncCar: Car{
    enum Cargo{
        case get
        case put
    }
    var Name: String
    var cargo: Int = 0
    var Year: Int
    var volumeOfTrunc:Int = 0
    var engineOn: Bool = false
    var windowsOpen: Bool = false
    init(Name:String,Year:Int){
        self.Name = Name
        self.Year = Year
    }
    public func actionWithCargo(mode: Cargo , weight: Int? = nil){
        switch mode{
            case .put:
            if(weight == nil){
                print("Нужно что нибудь положить")
            }
            else if (Int((weight)!) < 1){
                print("Недопустимое значение")
            }
            else if (Int((weight)!) > self.volumeOfTrunc){
                print("Столько не влезет")
            }
            else{
                print("Положил в багажник")
                self.cargo = Int((weight)!)
            }
            
        case .get:
            if(self.cargo == 0){
                print("Багажник пустой")
            }
            else{
                print("Достал из багажника")
                self.cargo = 0
            }
        }
        
    }
    init(Name:String,Year:Int,volumeOfTrunc:Int){
        self.Name = Name
        self.Year = Year
        self.volumeOfTrunc = volumeOfTrunc
    }

    
    
}
extension TruncCar: CustomStringConvertible{
    var description: String{
        return "Марка: \(self.Name), Год: \(self.Year), Обьем Багажника: \(self.volumeOfTrunc)"
    }
}
extension SportCar: CustomStringConvertible{
    var description: String{
        return "Марка: \(self.Name), Год: \(self.Year)"
    }
}
var honda = SportCar(Name: "Honda", Year: 2012)

honda.actionWithEngine(mode: .on)
honda.actionWithWindows(mode: .open)
honda.actionWithWindows(mode: .close)
honda.actionWithNitro(mode: .on)

var volvo = TruncCar(Name: "Volvo", Year: 2001, volumeOfTrunc: 1500)
volvo.actionWithEngine(mode: .on)
volvo.actionWithWindows(mode: .open)
volvo.actionWithWindows(mode: .close)
volvo.actionWithCargo(mode: .put, weight: 300)



print(volvo)
print(honda)
