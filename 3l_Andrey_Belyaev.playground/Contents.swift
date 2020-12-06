enum Action {
    case startEngine
    case killEngine
    case openWindows
    case closeWindows
    case loadTrunk(volume: Int)
    case unloadTrunk(volume: Int)
    case loadBody(volume: Int)
    case unloadBody(volume: Int)
    
}


struct SportCar {
    let model: String
    let productionDate: Int
    var maxTrunkVolume: Int
    var currentTrunkVolume = 0
    var bodyVolume: Int
    let maxSpeed = 400
    var currentSpeed = 0
    var engineIsOn = false
    var windowsOpen = false
    var volumeToLoad = 0
    
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
            self.currentTrunkVolume += volume
        case .unloadTrunk(volume: let volume):
            self.currentTrunkVolume -= volume
        case .loadBody(volume: let volume):
            self.bodyVolume += volume
        case .unloadBody(volume: let volume):
            self.bodyVolume -= volume
        }
    }
}


struct TrunkCar {
    let model: String
    let productionDate: Int
    let maxTrunkVolume: Double
    let maxSpeed = 90.0
    var currentSpeed = 0.0
    var currentTrunkVolume = 0.0
    var engineIsOn = false
    var windowsOpen = false
    var trunkIsFull: Bool {
        get {
            return maxTrunkVolume == currentTrunkVolume
        }
    }
    var freeSpace: Double {
        get {
            return maxTrunkVolume - currentTrunkVolume
        }
    }
}


