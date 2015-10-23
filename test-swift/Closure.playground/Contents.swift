//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/**
 * author:Leo
 * version:Swift 2.0
 */

// 将一个闭包赋值给一个变量
var firstClosure = {
    (a: Int ,b: Int) -> Int in
    return a + b
}
var result = firstClosure(10,15)


// 定义一个简单的函数，和闭包做对比
func function1(a: Int , b: Int) -> Int{
    return a - b
}
var func_result = function1(20, b: 19)


// 闭包可以作为一个函数参数来写，参数类型+返回值类型就确定了一个闭包的类型，既firstClosure
func function2(paramClosure: (pa: Int,pb: Int) -> Int){
    let result = paramClosure(pa: 19,pb: 19)
    print(result)
}
function2(firstClosure)


//func function3(a3: Int,b3: Int){
//    (pa: Int,pb: Int) -> Int in
//    return 0
//}

// 这个map方法是在数组中有定义，源码里多处用到泛型，我们这里用闭包重写实现功能
let digitNames = [0:"零", 1:"一", 2:"二", 3:"三", 4:"四", 5:"五", 6:"六", 7:"七", 8:"八", 9:"九", 10:"拾"]
let numbers = [10,15,289]
numbers.map{
    (var number) -> String in
    var output = ""
    while number > 0{
        output = digitNames[number % 10]! + output
        print(output)
        number /= 10
    }
    return output
}
