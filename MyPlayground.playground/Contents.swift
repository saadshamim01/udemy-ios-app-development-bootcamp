//import UIKit
//
//func calculator(n1:Int, n2:Int, operation:(Int, Int)->Int) -> Int{
//    return operation(n1,n2)
//}
//
//func add(n1:Int, n2:Int) -> Int{
//    return n1 + n2
//}
//
//
//
//
//calculator(n1: 3, n2: 2, operation: add)
//let result = calculator(n1: 132, n2: 17, operation: { $0 * $1})
//print (result)
//
//
//
//let array = [23,43,34,34,12]
//
//
//let newString = array.map{"\($0)"}
//print (newString)


class Assignment {
    
    
    func fibonacci(n: Int) {
        
        //Write your code here.
        var num1 = 0
        var num2 = 1
        
        for _ in 0 ..< n {
            
            let num = num1 + num2
            num1 = num2
            num2 = num
            
        }
        print("result = \(num2)")
        
        
    }
    
}
Assignment.fibonacci(4)







