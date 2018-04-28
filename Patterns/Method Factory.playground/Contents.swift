
protocol Vehicle {
    func drive()
}

class Car: Vehicle {
    
    func drive() {
        print("drive a car")
    }
}

class Truck: Vehicle {
    
    func drive() {
        print("drive a truck")
    }
}

class Bus: Vehicle {
    
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactory {
    
    func produce() -> Vehicle
}

class CarFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        return Car()
    }
}

class TruckFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        return Truck()
    }
}

class BusFactory: VehicleFactory {
    
    func produce() -> Vehicle {
        return Bus()
    }
}



















