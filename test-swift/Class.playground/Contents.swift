//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Map{
    var name = "Duskwood"
}

class Role{
    // lazy属性只有在用到的时候才加载
    lazy var map = Map()
    var online = true
}

let role1 = Role()
role1.map

// 坐标的计算属性
struct coordinate {
    // 横和纵
    var horizon = 0
    var verticality = 0
}

// 步伐
struct pacer {
    var walk = 0
    var run = 0
}

// 人物移动
struct move {
    var initCoordinate = coordinate()
    var rolePacer = pacer()
    
    
    var moveCoordinate: coordinate{
        get{
            let nextHorizon = initCoordinate.horizon + rolePacer.walk
            let nextVerticality = initCoordinate.verticality + rolePacer.walk
            return coordinate(horizon: nextHorizon, verticality: nextVerticality)
        }
        
        set{
            initCoordinate.horizon = newValue.horizon - rolePacer.walk
            initCoordinate.verticality = newValue.verticality - rolePacer.walk
        }
    }
}
var move1 = move(initCoordinate: coordinate(),rolePacer: pacer(walk: 10, run: 20))

// 总攻击力
struct warrior{
    var weapons = 0,halmet = 0, rings = 0, arms = 0
    var experince = 1
    var attack : Int{
        return experince * (weapons + halmet + rings + arms)
    }
}

let soilder = warrior(weapons: 30, halmet: 10, rings: 20, arms: 30, experince: 2)
soilder.attack

// 属性监视器
class Calculation{
    var experince: Int = 0{
        willSet{
            print("the experince now is: \(newValue)")
        }
    
        didSet{
            print("added experince is: \(experince - oldValue)")
        }
    }
}

var apo = Calculation()
apo.experince = 100
apo.experince = 300

// 静态属性
struct backPack{
    static let capacity = 200
    var items: [String]
}

backPack.capacity
var package = backPack(items: ["大红","大蓝","烤鹌鹑","魔法面包"])
backPack.capacity



















