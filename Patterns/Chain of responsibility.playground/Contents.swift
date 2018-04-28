
class Enemy {
    var strength = 500
}

protocol MilitaryChain {
    var strength: Int { get }
    var nextRank: MilitaryChain? { get set }
    func shouldDefeatWithStrength(amount: Int)
}

class Soldier: MilitaryChain {
    var strength = 100
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Soldier win!")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class Officer: MilitaryChain {
    var strength = 500
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("Officer win!")
        } else {
            nextRank?.shouldDefeatWithStrength(amount: amount)
        }
    }
}

class General: MilitaryChain {
    var strength = 1000
    var nextRank: MilitaryChain?
    
    func shouldDefeatWithStrength(amount: Int) {
        if amount < strength {
            print("General win!")
        } else {
            print("We can't defeat this enemy!")
        }
    }
}


let enemy = Enemy()

let soldier = Soldier()
let officer = Officer()
let general = General()

soldier.nextRank = officer
officer.nextRank = general

soldier.shouldDefeatWithStrength(amount: enemy.strength)










