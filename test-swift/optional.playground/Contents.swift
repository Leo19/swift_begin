 //: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
 
var optInt:Int?
optInt = 49
print("\(optInt)")
print("thats true")
 
 print("this is my house")

 let intValue:Int = 10
 var sum:Int = optInt! + intValue
 print("\(sum)")
 
 var optStr:String?
 optStr = "hi siri"
 
 var name:String = "zhang san"
 
 var fullName = optStr! + name
 print("\(fullName)")
 
 // optional可用于if判断如果有值就是true否则是false
 var optValue: Double = 10
 if optValue == 10{
    print("true")
 }else{
    print("false")
 } 
 
 var st:String = "100"
 var value:Int = Int(st)!