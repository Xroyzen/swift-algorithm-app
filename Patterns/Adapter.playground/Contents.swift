
// to adaptee
class SimpleCar {
    
    func sound() -> String {
        return "dir-dir-dir"
    }
}

// target
protocol SupercarProtocol {
    
    func makeNoise() -> String
}

class Supercar: SupercarProtocol {
    
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}

// adaptor
class SupercarAdaptor: SupercarProtocol {
    
    var simpleCar: SimpleCar
    
    init(simpleCar: SimpleCar) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}











