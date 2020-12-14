protocol Car {
    var model: String {get set}
    var productionYear: Int {get set}
    var engineIsOn: Bool {get set}
    var maxSpeed: Int {get set}
    var currentSpeed: Int {get set}
    mutating func increaseSpeed(speed: Int)
    func makeNoise()
}

enum TrunkCarBodyType {
    case opened, closed, special
}

class SportCar: Car {
    var model: String
    var productionYear: Int
    var engineIsOn = false
    var maxSpeed: Int
    var currentSpeed = 0
    var weldedRollCage: Bool
    var aerodynamicBodyKit: Bool
    var sportBrakeSystem: Bool
    init(model: String, productionYear: Int, maxSpeed: Int, weldedRollCage: Bool, aerodynamicBodyKit: Bool, sportBrakeSystem: Bool) {
        self.model = model
        self.productionYear = productionYear
        self.maxSpeed = maxSpeed
        self.weldedRollCage = weldedRollCage
        self.aerodynamicBodyKit = aerodynamicBodyKit
        self.sportBrakeSystem = sportBrakeSystem
    }
}

class TrunkCar: Car {
    var model: String
    var productionYear: Int
    var engineIsOn = false
    var maxSpeed: Int
    var currentSpeed = 0
    var axleNumber: Int
    var bodyType: TrunkCarBodyType
    var trailerHooked: Bool
    init(model: String, productionYear: Int, maxSpeed: Int, axleNumber: Int, bodyType: TrunkCarBodyType,  trailerHooked: Bool) {
        self.model = model
        self.productionYear = productionYear
        self.maxSpeed = maxSpeed
        self.axleNumber = axleNumber
        self.bodyType = bodyType
        self.trailerHooked = trailerHooked
    }
}

extension Car {
    mutating func crush() {
        model = "lada"
        engineIsOn = false
        maxSpeed = 0
        currentSpeed = 0
    }
}

extension Car {
    mutating func increaseSpeed(speed: Int){
        currentSpeed += speed
    }
    func makeNoise(){
        print("Beeeeep!")
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "model: \(self.model) \ncurrent speed: \(self.currentSpeed) \nweldedRollCage: \(self.weldedRollCage) \naerodynamicBodyKit: \(self.aerodynamicBodyKit) \nsportBrakeSystem: \(self.sportBrakeSystem)\n"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "model: \(self.model) \ncurrent speed: \(self.currentSpeed) \naxleNumber: \(self.axleNumber) \nbodyType \(self.bodyType) \ntrailerHooked: \(self.trailerHooked)\n"
    }
}

var spCar = SportCar(model: "ferrari", productionYear: 2012, maxSpeed: 400, weldedRollCage: true, aerodynamicBodyKit: true, sportBrakeSystem: true)
spCar.crush()
print(spCar)


let tCar = TrunkCar(model: "volvo", productionYear: 2009, maxSpeed: 150, axleNumber: 3, bodyType: .closed, trailerHooked: false)
tCar.makeNoise()
print(tCar)
