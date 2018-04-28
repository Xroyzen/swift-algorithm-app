
protocol Porsche {
    func getPrice() -> Double
    func getDescription() -> String
}

class Boxster: Porsche {
    
    func getPrice() -> Double {
        return 100
    }
    
    func getDescription() -> String {
        return "Boxster"
    }
}

class PorscheDecorator: Porsche {
    
    private var decoratedPorsche: Porsche
    
    required init(dp: Porsche){
        decoratedPorsche = dp
    }
    
    func getPrice() -> Double {
        return decoratedPorsche.getPrice()
    }
    
    func getDescription() -> String {
        return decoratedPorsche.getDescription()
    }
}

class PremiumAudioSystem: PorscheDecorator {
    
    required init(dp: Porsche){
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 30
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with premium audio system"
    }
}


class PanoramicSunroof: PorscheDecorator {
    
    required init(dp: Porsche) {
        super.init(dp: dp)
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 10
    }
    
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}



// function main()...

var porscheBoxster: Porsche = Boxster()
porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PanoramicSunroof(dp: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()

porscheBoxster = PremiumAudioSystem(dp: porscheBoxster)
porscheBoxster.getDescription()
porscheBoxster.getPrice()













