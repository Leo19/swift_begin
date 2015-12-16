//: Playground - noun: a place where people can play
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
    (String fn) in
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
items.append(ChecklistItem(text: "WoW",checked: false))
items.append(ChecklistItem(text: "VoV",checked: true))
func countUncheckedItems() -> Int{
    // 操作对象，第一要用enumerate()第二要用$1.element 返回值要写0
    let result = items.enumerate().reduce(0, combine: {
        $0 + ($1.element.checked ? 0 : 1)
    })
    
    print(result)
    return result
}





































