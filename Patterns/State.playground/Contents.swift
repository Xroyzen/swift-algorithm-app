
protocol State {
    func on(printer: Printer)
    func off(printer: Printer)
    func printDocument(printer: Printer)
}

class Printer {
    var state: State
    
    init() {
        self.state = On()
    }
    
    func set(state: State) {
        self.state = state
    }
    
    func turnOn() {
        state.on(printer: self)
    }
    
    func turnOff() {
        state.off(printer: self)
    }
    
    func print() {
        state.printDocument(printer: self)
    }
}

class On: State {
    func on(printer: Printer) {
        print("it is on already!")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("printing")
        printer.set(state: Print())
    }
}

class Off: State {
    func on(printer: Printer) {
        print("turning printer on")
        printer.set(state: On())
    }
    
    func off(printer: Printer) {
        print("it is off already")
    }
    
    func printDocument(printer: Printer) {
        print("it is off, we can't print")
    }
}

class Print: State {
    func on(printer: Printer) {
        print("it is on already")
    }
    
    func off(printer: Printer) {
        print("turning printer off")
        printer.set(state: Off())
    }
    
    func printDocument(printer: Printer) {
        print("it is printing already")
    }
}



// function main()...

let printer = Printer()
printer.turnOn()
printer.print()
printer.turnOn()
printer.turnOff()
printer.print()
printer.turnOn()



