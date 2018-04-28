
class FruitShop {
    
    func buyFruits() -> String {
        return "fruits"
    }
}

class MeatShop {
    
    func buyMeat() -> String {
        return "meat"
    }
}

class SweetShop {
    
    func buySweets() -> String {
        return "sweets"
    }
}

// Facade
class Supermarket {
    
    private let _fruitShop = FruitShop()
    private let _meatShop = MeatShop()
    private let _sweetShop = SweetShop()
    
    func buyProducts() -> String {
        var products = ""
        products += _fruitShop.buyFruits() + ", "
        products += _meatShop.buyMeat() + ", "
        products += _sweetShop.buySweets() + ", "
        
        return "I bought: " + products
    }
}














