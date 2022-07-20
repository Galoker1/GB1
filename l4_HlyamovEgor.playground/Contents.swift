import UIKit

class Car{
    enum Windows{
        case open
        case close
    }
    enum Engine{
        case on
        case off
    }
 
    public func info(){
        print("Марка: \(self.label) Год: \(self.year)  Открыты окна: \(self.windowsOpen) Запущен Двигатель: \(self.engineOn)")
    }
    public func actionWithEngine(mode: Engine){
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
    
    public func actionWithWindows(mode: Windows){
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
    var color: UIColor
    let year :Int

    var engineOn :Bool = false
    var windowsOpen :Bool = false
    var cargo : Int = 0
    init(color: UIColor, label:String, year: Int){
        self.color = color
        self.label = label
        self.year = year

    }
}
class sportCar: Car{
    var nitro : Bool = false
    enum Nitro{
        case on
        case off
    }
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
}

class truncCar: Car{
    var volumeOfTrunk :Int
    enum Cargo{
        case get
        case put
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

    init(color: UIColor, label:String, year: Int, volumeOfTrunc:Int) {
        self.volumeOfTrunk = volumeOfTrunc
    super.init(color: color, label:label, year: year)
    }
    
}
var car1 = sportCar(color: .red, label: "Mazda", year: 2002)
var car2 = truncCar(color: .green, label: "Volvo", year: 2007, volumeOfTrunc: 2000)

car2.actionWithCargo(mode: .put, weight : 400)

car1.actionWithWindows(mode: .open)


car1.actionWithEngine(mode: .on)
car1.actionWithNitro(mode: .on)


car1.info()
car2.info()
