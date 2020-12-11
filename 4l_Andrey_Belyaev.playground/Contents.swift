enum Action {
    case startEngine
    case killEngine
    case loadTrunk(volume: Int)
    case unloadTrunk(volume: Int)
    case increaseSpeed(speed: Int)
    case decreaseSpeed(speed: Int)
    // разбиться на скорости (для спорткара)
    case dieInAnHighSpeedAccident
    // отцепить прицеп (для грузовика)
    case unhookTrailer
    case podkatitKTelochke
 }

enum TrunkCarBodyType {
    case opened, closed, special
}

class Car {
    var model: String
    var productionYear: Int
    var maxTrunkVolume: Int
    var currentTrunkVolume = 0
    var maxSpeed: Int
    var currentSpeed = 0
    var engineOn = false
    var freeTrunkSpace: Int {
        get {
            return maxTrunkVolume - currentTrunkVolume
        }
    }
    init(model: String, productionYear: Int, maxTrunkVolume: Int, maxSpeed: Int ) {
        self.model = model
        self.productionYear = productionYear
        self.maxTrunkVolume = maxTrunkVolume
        self.maxSpeed = maxSpeed
    
    }
    private func startEngine(){
        self.engineOn = true
    }
    private func killEngine(){
        self.engineOn = false
    }
    private func loadTurunk(volume: Int){
        if self.freeTrunkSpace >= volume {
            self.currentTrunkVolume += volume
        } else {
            print("Not enough space!")
        }
    }
    private func unloadTrunk(volume: Int){
        if volume <= self.currentTrunkVolume {
            self.currentTrunkVolume -= volume
        } else {
            print("No such volume!")
        }
    }
    private func increaseSpeed(speed: Int){
        self.engineOn = true
        if self.currentSpeed + speed <= self.maxSpeed {
            self.currentSpeed += speed
        } else {
            print("Slow down! You're too fast!")
        }
    }
    private func decreaseSpeed(speed: Int){
        if speed > self.currentSpeed {
            self.currentSpeed = 0
        } else {
            self.currentSpeed -= speed
        }
    }
    func dieInAnHighSpeedAccident() {
        ()
    }
    func unhookTrailer(){
        ()
    }
    func podkatitKTelochke(){
        ()
    }
        
    func action(action: Action) {
        switch action {
        case .startEngine:
            startEngine()
        case .killEngine:
            killEngine()
        case .loadTrunk(volume: let volume):
            loadTurunk(volume: volume)
        case .unloadTrunk(volume: let volume):
            unloadTrunk(volume: volume)
        case .increaseSpeed(speed: let speed):
            increaseSpeed(speed: speed)
        case .decreaseSpeed(speed: let speed):
            decreaseSpeed(speed: speed)
        case .dieInAnHighSpeedAccident:
            dieInAnHighSpeedAccident()
        case .podkatitKTelochke:
            podkatitKTelochke()
        case .unhookTrailer:
            unhookTrailer()
        }
    }
}

class SportCar: Car {
    // Сварной каркас безопасности
    var weldedRollCage: Bool
    // Аэродинамический обвес
    var aerodynamicBodyKit: Bool
    // Спортивная тормозная система
    var sportBrakeSystem: Bool
    
    init(model: String, productionYear: Int, maxTrunkVolume: Int, maxSpeed: Int, weldedRollCage: Bool, aerodynamicBodyKit: Bool, sportBrakeSystem: Bool) {
        self.weldedRollCage = weldedRollCage
        self.aerodynamicBodyKit = aerodynamicBodyKit
        self.sportBrakeSystem = sportBrakeSystem
        super.init(model: model, productionYear: productionYear, maxTrunkVolume: maxTrunkVolume, maxSpeed: maxSpeed)
    }
    
    override func dieInAnHighSpeedAccident() {
        if currentSpeed >= 200 {
            model = "lada"
            maxTrunkVolume = 0
            currentTrunkVolume = 0
            maxSpeed = 0
            currentSpeed = 0
            engineOn = false
            print("RIP")
        } else {
            print("You're move too slow! Hurry up!")
        }
    }
    
    override func podkatitKTelochke() {
        let good_models = ["mercedes", "bmw", "lexus", "ferrari", "lamborgini"]
        let bad_models = ["lada", "reno", "pegeout"]
        if good_models.contains(self.model) {
            print("Классная тачка, чувак. У тебя все шансы.")
        } else if bad_models.contains(self.model) {
            print("Чувак, не в этой жизни.")
        } else {
            print("Ну 50 на 50.")
        }
    }
}


class TrunkCar: Car {
    // Количество осей
    var axleNumber: Int
    // Тип кузова
    var bodyType: TrunkCarBodyType
    var trailerHooked: Bool
    init(model: String, productionYear: Int, maxTrunkVolume: Int, maxSpeed: Int, axleNumber: Int, bodyType: TrunkCarBodyType,  trailerHooked: Bool) {
        self.axleNumber = axleNumber
        self.bodyType = bodyType
        self.trailerHooked = trailerHooked
        super.init(model: model, productionYear: productionYear, maxTrunkVolume: maxTrunkVolume, maxSpeed: maxSpeed)
    }
    
    override func podkatitKTelochke() {
        print("Чувак, не в этой жизни.")
    }
    
    override func unhookTrailer() {
        self.trailerHooked = false
    }
}


// attempt to show all class properties
func printProp(car: Car) {
    print("----------------")
    for property in Mirror(reflecting: car).children {
        print("\(property.label!) = \(property.value)")
    }
}

let sportCar = SportCar(model: "ferrari", productionYear: 1999, maxTrunkVolume: 50, maxSpeed: 350, weldedRollCage: false, aerodynamicBodyKit: true, sportBrakeSystem: true)
sportCar.action(action: .increaseSpeed(speed: 200))
sportCar.currentSpeed
sportCar.podkatitKTelochke()
sportCar.dieInAnHighSpeedAccident()

let simpleCar = Car(model: "ford focus", productionYear: 2003, maxTrunkVolume: 200, maxSpeed: 199)
simpleCar.engineOn
simpleCar.action(action: .increaseSpeed(speed: 20))
simpleCar.engineOn

let trunkCar = TrunkCar(model: "volvo", productionYear: 2012, maxTrunkVolume: 3000, maxSpeed: 160, axleNumber: 3, bodyType: .opened, trailerHooked: true)
trunkCar.podkatitKTelochke()
trunkCar.trailerHooked
trunkCar.unhookTrailer()

printProp(car: simpleCar)
printProp(car: sportCar)
printProp(car: trunkCar)
