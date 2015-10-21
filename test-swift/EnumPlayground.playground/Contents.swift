//: Playground - noun: a place where people can play

enum Week : String{
    case Mon = "第一天"
    case Tue = "第二天"
    case Wed = "第三天"
    case Thu = "第四天"
    case Fri = "第五天"
    case Sat = "第六天"
    case Sun = "第七天"
}

var day1 = Week.Mon.rawValue
print("week:\(day1)")

if day1 == .Mon{
    print(true)
}
var str = "Hello, playground"
