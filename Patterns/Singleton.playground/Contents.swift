
class Safe {
    
    var money = 0
    static let shared = Safe()
    
    private init() {}
}




// function main()...

var safe = Safe.shared
safe.money += 1000
safe.money

let safe1 = Safe.shared
safe1.money -= 100
safe1.money







