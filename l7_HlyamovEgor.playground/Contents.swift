import UIKit



  enum TruncError : LocalizedError{
      case NilWeight
      case NegativeWeight
      case OverWeight
      
      var errorDescription: String?{
          switch self{
          case .NilWeight:
              return "Нужно что-то положить"
          case .NegativeWeight:
              return "Некорректное число"
          case .OverWeight:
              return "Столько не влезет"
              
              
          }
      }
  }
class Car{

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


class truncCar: Car{
    var volumeOfTrunk :Int
    enum Cargo{
        case get
        case put
    }
    public func actionWithCargo(mode: Cargo , weight: Int? = nil) throws{
        switch mode{
            case .put:
            guard weight != nil else{
                throw TruncError.NilWeight
            }
            guard Int(weight!) > 0 else{
                throw TruncError.NegativeWeight
            }
            guard (Int((weight)!) <= self.volumeOfTrunk) else{
                throw TruncError.OverWeight
            }
            
                print("Положил в багажник")
                self.cargo = Int((weight)!)
            
            
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

var car2 = truncCar(color: .green, label: "Volvo", year: 2007, volumeOfTrunc: 2000)

do {
    try car2.actionWithCargo(mode: .put, weight : 3000) //Больше чем можно положить

}
catch{
    print(error.localizedDescription)
}

do {
    try car2.actionWithCargo(mode: .put)//Не указан параметр weight

}
catch{
    print(error.localizedDescription)
}

do {
    try car2.actionWithCargo(mode: .put, weight : -20)//Некорректное число

}
catch{
    print(error.localizedDescription)
}

do {
    try car2.actionWithCargo(mode: .put, weight : 200)//Все правильно

}
catch{
    print(error.localizedDescription)
}




