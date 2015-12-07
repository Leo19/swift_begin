//: Playground - noun: a place where people can play


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













































