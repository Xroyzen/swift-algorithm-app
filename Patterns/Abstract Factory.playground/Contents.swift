
protocol Car {
    
    func drive()
}

protocol Bus {
    
    func drive()
}

protocol Factory {
    
    func produceCar() -> Car
    func produceBus() -> Bus
}


// MARK: - Car
class LittleSizeCar: Car {
    
    func drive() {
        print("driva a little car")
    }
}

class MiddleSizeCar: Car {
    
    func drive() {
        print("drive a middle car")
    }
}


// MARK: - Bus
class LittleSizeBus: Bus {
    
    func drive() {
        print("drive a little bus")
    }
}

class MiddleSizeBus: Bus {
    
    func drive() {
        print("drive a middle bus")
    }
}


// MARK: - Factory
class LittleSizeFactory: Factory {
    
    func produceBus() -> Bus {
        return LittleSizeBus()
    }
    
    func produceCar() -> Car {
        return LittleSizeCar()
    }
}

class MiddleSizeFactory: Factory {
    
    func produceCar() -> Car {
        return MiddleSizeCar()
    }
    
    func produceBus() -> Bus {
        return MiddleSizeBus()
    }
}


// function main()...

let littleSizeFactory = LittleSizeFactory()
let middleSizeFactory = MiddleSizeFactory()

let littleSizeCar = littleSizeFactory.produceCar()
littleSizeCar.drive()

let middleSizeBus = middleSizeFactory.produceBus()
middleSizeBus.drive()







