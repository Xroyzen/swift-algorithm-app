
import Foundation

protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}

class Teacher: Subject {
    
    var observerCollection = NSMutableSet()
    var task = "" {
        didSet {
            notify(withString: task)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection{
            (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
}

protocol PropertyObserver {
    func didGet(newTask: String)
}

class Pupil: NSObject, PropertyObserver {
    
    var homeTask = ""
    
    func didGet(newTask: String) {
        homeTask = newTask
        print("Pupil got new task!")
    }
    
}

let teacher = Teacher()
let pupil = Pupil()

teacher.add(observer: pupil)
teacher.task = "Hello, World!"
teacher.task = "2"









