//: Playground - noun: a place where people can play

var str = "Hello, playground"


// 没有任何原始类型的枚举
enum PlanetName{
    case Earth
    case Venus
    case Mars
    case Jupiter
    case Saturn
}
var planet = PlanetName.Earth
planet = .Jupiter


// 有原始类型的枚举，其中Saturn没有给赋值但swift会隐式按顺序赋值Saturn.rawValue=5
enum PlanetIndex: Int{
    case Earth = 1
    case Venus = 2
    case Mars = 3
    case Jupiter = 4
    case Saturn
}
let saturn = PlanetIndex.Saturn.rawValue

// 通过rawValue也就是原始值来做switch case
let possiblePlanet = 4
if let somePlanet = PlanetIndex(rawValue: possiblePlanet){
    switch somePlanet{
    case .Earth:
        print("a beautiful planet")
    case .Mars:
        print("not so bad planet")
    default:
        print("other planets")
    }
}else{
    print("not one of our galaxy planets")
}

// 关联值，关联值和原始值区别是原始值不能更改
enum Barcode{
    case BNRGB(Int,Int,Int)
    case OXRGB(String)
}

// 下面这个就会报错
//PlanetIndex.Saturn.rawValue = 90

var greenBarcode = Barcode.BNRGB(32, 32, 64)
greenBarcode = .OXRGB("green")

let colorType = (32,32,64)
switch greenBarcode{
    case .BNRGB(let rc,let gc,let bc):
        print("\(rc),\(gc),\(bc)")
    case .OXRGB(let ffc):
        print("this is color string \(ffc)")
}



