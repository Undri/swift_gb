enum Action {
    case startEngine
    case killEngine
    case openWindows
    case closeWindows
    case loadTrunk(volume: Int)
    case unloadTrunk(volume: Int)
    case loadBody(volume: Int)
    case unloadBody(volume: Int)
    case increaseSpeed(speed: Int)
    case decreaseSpeed(speed: Int)
    // Разбиться на высокой скорости (реализуется только в спорткаре)
    case dieInAnHighSpeedAccident
    // Подкатить к девушке
    case podkatitKTelochke
}


struct SportCar {
    var model: String
    var productionDate: Int
    var maxTrunkVolume: Int
    var currentTrunkVolume = 0
    var maxBodyVolume: Int
    var currentBodyVolume = 0
    var maxSpeed = 400
    var currentSpeed = 0
    var engineIsOn = false
    var windowsOpen = false
    var freeTrunkSpace: Int {
        get {
            return maxTrunkVolume - currentTrunkVolume
        }
    }
    var freeBodySpace: Int {
        get {
            return maxBodyVolume - currentBodyVolume
        }
    }
    mutating func action(action: Action) {
        switch action {
        case .startEngine:
            self.engineIsOn = true
        case .killEngine:
            self.engineIsOn = false
        case .openWindows:
            self.windowsOpen = true
        case .closeWindows:
            self.windowsOpen = false
        case .loadTrunk(volume: let volume):
            // Выполняем загрузку только в случае, если есть свободное место
            if self.freeTrunkSpace >= volume {
                self.currentTrunkVolume += volume
            }
        case .unloadTrunk(volume: let volume):
            // Выполняем разгрузку, если есть возможность выгрузить запрашиваемый объем
            if volume <= self.currentTrunkVolume {
                self.currentTrunkVolume -= volume
            }
        case .loadBody(volume: let volume):
            if freeBodySpace >= volume {
                self.currentBodyVolume += volume
            } else {
                print("Not enough space!")
            }
        case .unloadBody(volume: let volume):
            if volume <= self.currentBodyVolume {
                self.currentBodyVolume -= volume
            } else {
                print("No such volume!")
            }
        case .increaseSpeed(speed: let speed):
            // Увеличение скорости не должно превысить максимально возможную скорость
            if self.currentSpeed + speed <= self.maxSpeed {
                self.currentSpeed += speed
            } else {
                print("Too fast!")
            }
        case .decreaseSpeed(speed: let speed):
            // Если скорость для уменьшения больше текущей, то просто зануляем текущую скорость
            if speed > self.currentSpeed {
                self.currentSpeed = 0
            } else {
                self.currentSpeed -= speed
            }
        case .dieInAnHighSpeedAccident:
            if currentSpeed >= 200 {
                model = "lada"
                productionDate = 0
                maxTrunkVolume = 0
                currentTrunkVolume = 0
                maxBodyVolume = 0
                currentBodyVolume = 0
                maxSpeed = 0
                currentSpeed = 0
                engineIsOn = false
                windowsOpen = true
            }
        case .podkatitKTelochke:
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
}


struct TrunkCar {
    let model: String
    let productionDate: Int
    let maxTrunkVolume: Int
    let maxSpeed = 90
    var currentSpeed = 0
    var currentTrunkVolume = 0
    var engineIsOn = false
    var windowsOpen = false
    var trunkIsFull: Bool {
        get {
            return maxTrunkVolume == currentTrunkVolume
        }
    }
    var freeSpace: Int {
        get {
            return maxTrunkVolume - currentTrunkVolume
        }
    }
    
    mutating func action(action: Action) {
        switch action {
        case .startEngine:
            self.engineIsOn = true
        case .killEngine:
            self.engineIsOn = false
        case .openWindows:
            self.windowsOpen = true
        case .closeWindows:
            self.windowsOpen = false
        case .loadTrunk(volume: let volume):
            // Выполняем загрузку только в случае, если есть свободное место
            if self.freeSpace >= volume {
                self.currentTrunkVolume += volume
            } else {
                print("Not enough space!")
            }
        case .unloadTrunk(volume: let volume):
            // Выполняем разгрузку, если есть возможность выгрузить запрашиваемый объем
            if volume <= self.currentTrunkVolume {
                self.currentTrunkVolume -= volume
            } else {
                print("No such volume!")
            }
            
        // Принято решение лишить грузовика возможности загрузки в кузов
        case .loadBody(volume: _):
            ()
        case .unloadBody(volume: _):
            ()
            
        case .increaseSpeed(speed: let speed):
            // Увеличение скорости допустимо только с включенным двигателем
            // Увеличение скорости не должно превысить максимально возможную скорость
            self.engineIsOn = true
            if self.currentSpeed + speed <= self.maxSpeed {
                self.currentSpeed += speed
            } else {
                print("Slow down! You're too fast!")
            }
        case .decreaseSpeed(speed: let speed):
            // Если скорость для уменьшения больше текущей, то просто зануляем текущую скорость
            if speed > self.currentSpeed {
                self.currentSpeed = 0
            } else {
                self.currentSpeed -= speed
            }
        // Разбиться на грузовеке на большой скорости почти невозможно
        case .dieInAnHighSpeedAccident:
            ()
        case .podkatitKTelochke:
            print("Чувак, не в этой жизни.")
        }
    }
}


var ferrari = SportCar(model: "ferrari", productionDate: 1984, maxTrunkVolume: 100, maxBodyVolume: 30)
ferrari.action(action: Action.podkatitKTelochke)
ferrari.action(action: Action.increaseSpeed(speed: 250))
ferrari.currentSpeed
ferrari.action(action: Action.dieInAnHighSpeedAccident)
ferrari.model
ferrari.action(action: Action.podkatitKTelochke)
ferrari.maxSpeed
print(ferrari)

var kamaz = TrunkCar(model: "kamaz", productionDate: 1999, maxTrunkVolume: 5000)

kamaz.action(action: Action.openWindows)
kamaz.windowsOpen
kamaz.action(action: Action.loadTrunk(volume: 4999))
kamaz.currentTrunkVolume
kamaz.action(action: Action.loadTrunk(volume: 2000))
kamaz.currentTrunkVolume
print(kamaz)
