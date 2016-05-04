//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* 本例与ViewController.swift里的Optional嵌套是一个系列的，本例说的是 */
/* 通过将dict里value设置为nil来删除这条记录 */
var dict :[String:String?] = [:]
dict = ["one": "一"]
func justReturnNil() -> String? {
    return nil
}

// 通过dict["one"] = nil想删除这条记录
dict["one"] = justReturnNil()
// 然而这个dict里的这条记录还在并没有被删除
print("栗子一:\(dict)")

// 第二个栗子，这个Optional<String>.None==String?
dict = ["two":"二"]
dict["two"] = Optional<String>.None
print("栗子二:\(dict)")

// 第三个栗子
dict = ["three":"三"]
dict["three"] = nil
print("栗子三:\(dict)")

// 第四个栗子
dict = ["four":"四"]
let nilValue:String? = nil
dict["four"] = nilValue
print("栗子四:\(dict)")

// 第五个栗子
dict = ["five":"五"]
let nilValue2:String?? = nil
dict["five"] = nilValue2
print("栗子五:\(dict)")

/* 看看apple的源码，竟然是用subscript实现的，估计其他语言里也是这样？？*/
/* 我们自定义了一个[String:String?]的Dictionary实际上swift接收的时候 */
/* 做了一个封装 value成了String?? 的，一切都说通了,我们传一个String? */
/* swift给它包装成Optional.Some(<Optional<String>.None>) 然后再用 */
/* if let判断的时候它不是nil了所以就没删除 */
//public subscript(key: Key) -> Value? {
//    get {
//        return _variantStorage.maybeGet(key)
//    }
//    set(newValue) {
//        if let x = newValue {
//            // FIXME(performance): this loads and discards the old value.
//            _variantStorage.updateValue(x, forKey: key)
//        }
//        else {
//            // FIXME(performance): this loads and discards the old value.
//            removeValueForKey(key)
//        }
//    }
//}







