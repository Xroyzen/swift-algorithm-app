
import UIKit

protocol FilterBehavior {
    func process(image: UIImage) -> UIImage
}

class Filter {
    var filter: FilterBehavior?
    
    func apllyFilter(to image: UIImage){
        filter?.process(image: image)
    }
}



class SepiaFilter: FilterBehavior {
    func process(image: UIImage) -> UIImage {
        print("There is code from filter sepia.")
        return image
    }
}



class BWFilter: FilterBehavior {
    func process(image: UIImage) -> UIImage {
        print("There is code from filter BW.")
        return image
    }
}



let filter = Filter()
let image = UIImage()

filter.filter = BWFilter()
filter.apllyFilter(to: image)









