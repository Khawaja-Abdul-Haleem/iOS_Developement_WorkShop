import UIKit

/// simple concept of GCD and operationQueue
struct Example {
    
    func doWork() {
        let blockOperation = BlockOperation()
        //blockOperation.qualityOfService = .utility
        
        blockOperation.addExecutionBlock {
            debugPrint("Hello KAH")
        }
        
        blockOperation.addExecutionBlock {
            debugPrint("Welcome KAH")
        }
        
        blockOperation.addExecutionBlock {
            debugPrint("LoggedIn Successfully")
        }
        
        //blockOperation.start()
        
        let anotherBlockOperation = BlockOperation()
        anotherBlockOperation.addExecutionBlock {
            debugPrint("Hi KAH ! This is another BlockOperation")
        }
        
        let operationQueue = OperationQueue()
        operationQueue.qualityOfService = .utility
       // operationQueue.addOperation(blockOperation)
       // operationQueue.addOperation(anotherBlockOperation)
        
        operationQueue.addOperations([blockOperation, anotherBlockOperation], waitUntilFinished: false)
    }
    
    
}

let obj = Example()
obj.doWork()
