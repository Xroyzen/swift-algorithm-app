
protocol Coworker {
    func hire(coworker: Coworker)
    func getInfo()
    var lvl: Int { get }
}

// branch
class Manager: Coworker {
    
    private var _coworkers = [Coworker]()
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        _coworkers.append(coworker)
    }
    
    func getInfo() {
        print(lvl.description + " my worker: ")
        for manager in _coworkers {
            manager.getInfo()
        }
    }
}

// leaf
class LowManager: Coworker {
    var lvl: Int
    
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    func hire(coworker: Coworker) {
        print("can't hire")
    }
    
    func getInfo() {
        print(lvl.description)
    }
}



// function main()...

let mainManager = Manager(lvl: 1)
let managerLvl_2 = Manager(lvl: 2)
let managerLvl_10 = Manager(lvl: 10)

let lowManager = LowManager(lvl: 1)

mainManager.hire(coworker: managerLvl_2)
managerLvl_2.hire(coworker: managerLvl_10)
managerLvl_2.hire(coworker: lowManager)

mainManager.getInfo()









