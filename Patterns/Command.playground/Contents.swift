
class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int){
        self.accountName = accountName
        self.balance = balance
    }
}

protocol Command {
    
    func execute()
    var isComplete: Bool { get set }
}

class Deposit: Command {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int){
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class Withdraw: Command {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int){
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        }
        else {
            print("Not enough money")
        }
    }
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    private var _transaction: [Command] = []
    
    var pendingTransactions: [Command] {
        get {
            return _transaction.filter{ $0.isComplete == false }
        }
    }
    
    func addTransaction(command: Command){
        _transaction.append(command)
    }
    
    func processingTransactions(){
        _transaction.filter { $0.isComplete == false }.forEach{ $0.execute() }
    }
}


// function main()...

let account = Account(accountName: "I'm", balance: 1000)
let transactionManager = TransactionManager.shared
transactionManager.addTransaction(command: Deposit(account: account, amount: 150))
transactionManager.addTransaction(command: Withdraw(account: account, amount: 250))
transactionManager.pendingTransactions
account.balance
transactionManager.processingTransactions()
transactionManager.pendingTransactions
account.balance


































