import UIKit

struct SportCar {
    
    enum Windows{
        case open
        case close
    }
    enum Engine{
        case on
        case off
    }
    enum Cargo{
        case get
        case put
    }
    public func info(){
        print("Марка: \(self.label) Год: \(self.year) Обьем Багажника:\(self.volumeOfTrunk) Открыты окна: \(self.windowsOpen) Запущен Двигатель: \(self.engineOn) Вес Груза: \(self.cargo)")
    }
    public mutating func actionWithEngine(mode: Engine){
        switch mode{
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
    public mutating func actionWithCargo(mode: Cargo , weight: Int? = nil){
        switch mode{
            case .put:
            if(weight == nil){
                print("Нужно что нибудь положить")
            }
            else if (Int((weight)!) < 1){
                print("Недопустимое значение")
            }
            else if (Int((weight)!) > self.volumeOfTrunk){
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
    public mutating func actionWithWindows(mode: Windows){
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
    let label :String
    let year :Int
    let volumeOfTrunk :Int
    var engineOn :Bool = false
    var windowsOpen :Bool = false
    var cargo : Int = 0
}

struct TrunkCar {
    enum Windows{
        case open
        case close
    }
    enum Engine{
        case on
        case off
    }
    enum Cargo{
        case get
        case put
    }
    public mutating func actionWithEngine(mode: Engine){
        switch mode{
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
    public mutating func actionWithCargo(mode: Cargo , weight: Int? = nil){
        switch mode{
            case .put:
            if(weight == nil){
                print("Нужно что нибудь положить")
            }
            else if (Int((weight)!) < 1){
                print("Недопустимое значение")
            }
            else if (Int((weight)!) > self.volumeOfTrunk){
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
    public func info(){
        print("Марка: \(self.label) Год: \(self.year) Обьем Багажника:\(self.volumeOfTrunk) Открыты окна: \(self.windowsOpen) Запущен Двигатель: \(self.engineOn) Вес Груза: \(self.cargo)")
    }
    public mutating func actionWithWindows(mode: Windows){
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
    let label :String
    let year :Int
    let volumeOfTrunk :Int
    var engineOn :Bool = false
    var windowsOpen :Bool = false
    var cargo : Int = 0
}

var car1 = SportCar(label: "Honda", year: 2002, volumeOfTrunk: 300)
var car2 = SportCar(label: "Toyota", year: 2010, volumeOfTrunk: 500)

var car3 = TrunkCar(label: "Volvo", year: 2011, volumeOfTrunk: 2000)
var car4 = TrunkCar(label: "Kamaz", year: 1999, volumeOfTrunk: 1500)

car1.actionWithEngine(mode: .on)
car2.actionWithEngine(mode: .off)
car3.actionWithEngine(mode: .on)

car3.actionWithCargo(mode: .put , weight: 250)

car4.actionWithWindows(mode: .open)


car1.info()
car2.info()
car3.info()
car4.info()
