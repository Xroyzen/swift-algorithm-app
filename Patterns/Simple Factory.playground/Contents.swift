
// It is NOT pattern, but ...

enum CarType {
    case huge, fast
}

class HugeCar: Car {
    
    func drive() {
        print("huge car")
    }
}

class FastCar: Car {
    
    func drive() {
        print("fast car")
    }
}

protocol Car {
    func drive()
}

class CarFactory {
    static func produceCar(type: CarType) -> Car {
        switch type {
        case .huge: return HugeCar()
        case .fast: return FastCar()
        }
    }
}



// function main()...

let hugeCar = CarFactory.produceCar(type: .huge)
let fastCar = CarFactory.produceCar(type: .fast)

















