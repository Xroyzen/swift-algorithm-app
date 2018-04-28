
// MARK: - Virtual proxy

/*class User {
    var id = "123"
}

protocol ServerProtocol {
    func grandAccess(user: User)
    func denyAccess(user: User)
}

class Server: ServerProtocol {
    func grandAccess(user: User) {
        print("access granted for \(user.id)")
    }
    
    func denyAccess(user: User) {
        print("acess denied for \(user.id)")
    }
}

class Proxy: ServerProtocol {
    lazy private var server: Server = Server()
    
    func grandAccess(user: User) {
        server.grandAccess(user: user)
    }
    
    func denyAccess(user: User) {
        server.denyAccess(user: user)
    }
}*/

// Def proxy
class User {
    let name = "qwe"
    let password = "123"
}

protocol ServerProtocol {
    func grandAccess(user: User)
}

class Server: ServerProtocol {
    func grandAccess(user: User) {
        print("access granted for \(user.name)")
    }
}

class Proxy: ServerProtocol {
    private var _server: Server!
    
    func grandAccess(user: User) {
        guard _server != nil else {
            print("access can't be granted for \(user.name)")
            return
        }
        _server.grandAccess(user: user)
    }
    
    func authenticate(user: User) {
        guard user.password == "123" else { return }
        print("all okay")
        _server = Server()
    }
}














