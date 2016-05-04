//: Playground - noun: a place where people can play
// Leo)Xcode 7.2
import Foundation

let fruits = ["orange","apple","grape","peach",""]

fruits.count
fruits.capacity

for element in fruits{
    print(element)
}

var arr = [Int]()
arr.count

var girl = [String](count: 100, repeatedValue: "girls")
var boy = [String](count: 1000, repeatedValue: "boy")

girl.capacity
girl.count

boy.capacity
boy.count

boy.popLast()

// swift官方注释里这个方法复杂度是o(1)
let revFruits = fruits.reverse()

var dics: [String : String] = [
    "CTU":"成都双流国际机场",
    "SHA":"上海虹桥国际机场",
    "PVG":"浦东国际机场",
    "SYX":"三亚凤凰国际机场",
    "NNN":"备用机场"
]
dics.count
dics.isEmpty
dics["SZX"] = "深圳国际机场"
dics["SZX"] = "2号航站楼"


let keys = dics.keys
let values = dics.values

for key in keys{
    print(key)
}
for value in values{
    print(value)
}

// 数字中文字典
let numName = [
    0: "零",
    1: "一",
    2: "二",
    3: "三",
    4: "四",
    5: "五",
    6: "六",
    7: "七",
    8: "八",
    9: "九"
]
// 阿拉伯数字
let arabNum = [17,58,79,147,14178,100]
arabNum.map(){
    var t = $0
    var dest = ""
    while t > 0{
        dest = numName[t % 10]! + dest
        t /= 10
    }
    print(dest)
}



// 更新，第二个更新是会返回一个Optional结果用于判断是否更新成功的
dics["NNN"] = "军用机场"
print(dics["NNN"])

dics.updateValue("国外机场", forKey: "NNN")
print(dics["NNN"])

if let someAirport = dics.updateValue("民用机场", forKey: "XXX"){
    print("update success \(someAirport)")
}else{
  print("update failure")
}

for(key,value) in dics{
    print("\(key) --- \(value)")
}

let kkeys = dics.keys
for key1 in kkeys{
    print(key1)
}

// $0 是返回结果而$1是参数,后面的.0=key而.1=value
let allDics = dics.reduce("", combine: {$0 + "\($1.0), "})
print(allDics)

// 匿名闭包此时可以用$0如果声明了闭包则不能用$0
let fruits1 = fruits.map({
    $0.uppercaseString + "1111"
})
print(fruits1)

// 非匿名闭包,这里就不能再用$0了
let chars = "c"
let fruits2 = fruits.map({
    
    (fn) in
    fn.lowercaseString.characters.reverse()
})


let sortedFruits = fruits.sort({$0 <= $1})
print(sortedFruits[0])


var strArray = [String]()
strArray.append("one")
strArray.append("two")
strArray.append("three")

// $0 是返回值 $1是元素，如果元素是对象需要操作对象里的属性，用enumerate
// 此时$1是一个对象，可以对其属性进行操作
let result = strArray.enumerate().reduce("", combine: {
    $0 + $1.element
})
print(result)

// reduce("" 双引号代表返回值的类型，不要写String Xcode7.2 在此会报错
let reverseResult = strArray.reduce("", combine: {
    $1 + $0
})
print(reverseResult)

// 也可以做更复杂的操作
let sophisticatedString = strArray.enumerate().reduce("", combine: {
    $0 + $1.element + ($1.index < strArray.endIndex-1 ? "，":"")
})
print(sophisticatedString)

// 遍历每一个元素，返回类型和调用它的数组类型一样
let flatString = strArray.flatMap({
    $0 + "---"
})
print(flatString)

// 存储属性都赋值了所以会有一个默认的按顺序构造器
class ChecklistItem {
    var text = ""
    var checked = false
    
    init(text: String,checked: Bool){
        self.text = text
        self.checked = checked
    }
}

// 给数组几个值
var items = [ChecklistItem]()
var item = ChecklistItem(text: "LoL",checked: true)
items.append(item)
items.append(ChecklistItem(text: "WoW",checked: true))
items.append(ChecklistItem(text: "VoV",checked: true))
func countUncheckedItems() -> Int{
    // 操作对象，第一要用enumerate()第二要用$1.element 返回值要写0
    let result = items.enumerate().reduce(0, combine: {
        // $0 是返回结果 $1是元素
        $0 + ($1.element.checked ? 1 : 0)
    })
    
    return result
}
countUncheckedItems()

// flatMap比较简单，闭包里也不要做太复杂的操作
let nestedArray = [[1,2,3],[6,7,8],[9]]
let flattened = nestedArray.flatMap{$0}
print(flattened)

// reduce功能很强大，但是能用简单的就用简单的
let reduced = nestedArray.reduce([], combine: {
    $0 + $1
})
print("this is a split line========")
print(reduced)

// 将optional的数组转化成非optional的是flatMap擅长的
let optionalArray:[Int?] = [6,nil,7,nil,8]
let non_op = optionalArray.flatMap({
    // 不能写 $0 != nil 否则返回Bool数组了
    $0
})

print(non_op)

// filter 只做过滤返回值仍然是optinal的
let stillOptional = optionalArray.filter({
    $0 != nil
})
print(stillOptional)

// 这段是推特上一位朋友写的更加复杂也更简略的代码
let newDict = ["a":"b"].reduce(["c":"d"], combine: {
    (var dict,var pair) in
    // 其实是个trick，等于dict["a"]="b" 直接增加了一项
    dict[pair.0] = pair.1
    return dict
})
print(newDict)

// 再次证明了 $0 是返回值 $1 是参数其实
let doubleArray = [1,4].reduce([Int](), combine: {
    (var ret,param) in ret.append(param)
    // 重点在这里，嵌套了一个map()
    ret = ret.map{$0 * 2}
    return ret
})
print(doubleArray)

// 用reduce实现一个map功能
let arr5 = [1,4,8,2,5,9]
let ret = arr5.reduce([], combine: {
    (a: [Int], element: Int) -> [Int] in
    print("a: \(a)")
    var t = Array(a)
    print("t: \(t)")
    t.append(element * 2)
    return t
})


// reduce方法一次求出数组中奇数的和、以及偶数的积
let tup = arr5.reduce((0,1), combine: {
    (a: (Int, Int) , element: Int) -> (Int,Int) in
    if (element % 2 == 0) {
        return (a.0,a.1 * element)
    } else {
        return (a.0 + element, a.1)
    }
})
print(tup)

// 用reduce方法找出数组中最大值
let arr6 = [1,2,6,4,5]
let max: Int = arr6.reduce(0, combine: {
    (a: Int, element: Int) -> Int in
    return a > element ? a : element
})
print("max: \(max)")

// 高阶函数可以链式调用，求一个数组中偶数的平方和
let arr7 = [1,2,4,7,9]
let square: Int = arr7.filter({
    $0 % 2 == 0
}).map({
    $0 * $0
}).reduce(0, combine: {
    return $0 + $1
})
print(square)

/*===================== 结论 ===================*/
/*如果有一个数组需要给每一个元素加前缀或后缀用flatMap()*/
/*如果有一个嵌套的或者对象类型的数组有可能要一次性的在值的*/
/*前后做操作就用reduce()如果将其他值和数值或数组合并就用join()*/


/* 高阶函数：                          */
/* 1.如果一个函数接受一个多多个函数当做参数 */
/* 2.并且可以把一个函数当做返回值         */
/* 高阶函数可以和对象一样对主体进行封装，可以用高阶函数来隐藏私有变量 */
/*  */
func getClock() -> () -> Int {
    var count: Int = 0
    let getCount = {
        () -> Int in
        count = count + 1;
        return count;
    }
    return getCount
}

let t1 = getClock()
t1()
t1()

















