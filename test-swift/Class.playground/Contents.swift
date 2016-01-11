//: Playground - noun: a place where people can play
// Leo 2015-12-1 Xcode7.1

import UIKit

var str = "Hello, playground"

class Map{
    var name = "WoW"
}

class Role{
    // lazy属性只有在用到的时候才加载
    lazy var map = Map()
    var online = true
}

let role1 = Role()
role1.map

// 坐标的计算属性
struct Coordinate {
    // 横和纵
    var horizon = 0
    var verticality = 0
}

// 步伐
struct Pacer {
    var walk = 0
    var run = 0
}

// 人物移动
struct Move {
    var initCoordinate = Coordinate()
    var rolePacer = Pacer()
    
    
    var moveCoordinate: Coordinate{
        get{
            let nextHorizon = initCoordinate.horizon + rolePacer.walk
            let nextVerticality = initCoordinate.verticality + rolePacer.walk
            return Coordinate(horizon: nextHorizon, verticality: nextVerticality)
        }
        
        set{
            initCoordinate.horizon = newValue.horizon - rolePacer.walk
            initCoordinate.verticality = newValue.verticality - rolePacer.walk
        }
    }
}
var move1 = Move(initCoordinate: Coordinate(),rolePacer: Pacer(walk: 10, run: 20))
// 这个就是访问计算属性
move1.moveCoordinate.horizon
move1.moveCoordinate = Coordinate()


// 总攻击力
struct warrior{
    var weapons = 0,halmet = 0, rings = 0, arms = 0
    var experince = 1
    // 只有一个get属性的时候可以省略get关键字
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
        
        // oldValue和newValue都是默认的，也可以didSet(nValue)这样写
        didSet{
            print("added experince is: \(experince - oldValue)")
        }
    }
}

var apo = Calculation()
apo.experince = 100
apo.experince = 300


// 静态属性
struct BackPack{
    static let capacity = 200
    var items: [String]
}

BackPack.capacity
var package = BackPack(items: ["大红","大蓝","烤鹌鹑","魔法面包"])
BackPack.capacity

// 定义一个值范围的结构体
struct FixedLengthRange{
    var firstValue: Int
    let length: Int
}

// length是let类型，firstValue是var类型
var rangeOfSixItems = FixedLengthRange(firstValue:0,length: 6)
rangeOfSixItems.firstValue = 5

// 由于结构体都是值初始化的时候已经给length了之后不能改了，下面一句会报错
//rangeOfSixItems.length = 8


// 与上面不同的是这个是常量
let letRange = FixedLengthRange(firstValue: 1, length: 9)

// 结构体都是值类型，值类型常量都不可以改了，下面这句会报错
//letRange.firstValue = 10




/* 类型属性相关关=============================== STA */
/* 存储类型属性也是延迟初始化的，在第一次被访问的时候初始化 */
/* 即使他们被多个线程同时访问也系统也会保证只对其初始化一次 */

struct SomeStructure {
    static var storedTypeProperty = "Some Value."
    static var computedTypeProperty: Int{
        return 1
    }
}

enum SomeEnumeration{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 6
    }
}

class ComeClass{
    static var storedTypeProperty = "Some Value."
    static var staticStoredProperty = 10
    
    // 静态类型属性  静态计算属性都是用static修饰
    static var computedTypeProperty: Int{
        return staticStoredProperty
    }
    
    
    // 用class修饰的“计算类型属性”支持子类对父类进行重写，且不需要static关键字
    class var overrideableComputedTypeProperty: Int{
        get{
            return staticStoredProperty
        }
        
        set(nValue){
            staticStoredProperty = nValue
        }
    }
}

// 获取和设置类型属性的值
struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0{
        didSet{
            if currentLevel > AudioChannel.thresholdLevel{
                // 不会超过当前阈值，本次currentLevel改动不会再次触发监视器
                currentLevel = AudioChannel.thresholdLevel
                print("LA")
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels{
                // 存储当前音量作为新德最大输入音量
                AudioChannel.maxInputLevelForAllChannels = currentLevel
                print("AM")
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 12
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
/* 类型属性相关关=============================== END */




/* 方法相关=============================== STA */
/* 结构体、类、枚举里都可以定义实例方法，Swift中通常 */
/* 用一个介词指向方法的第一个参数，比如：with,forby */
/* 这样能够是方法在被调用时能够像一个句子一样被解读读 */
struct Pixel{
    var x = 0.0,y = 0.0
    func isToTheRightOfX(x: Double) -> Bool{
        return x > self.x
    }
    
    // 变异方法，再实例方法中修改值类型
    mutating func moveByX(deltaX: Double,y deltaY: Double){
        self.x += deltaX
        self.y += deltaY
    }
    
    mutating func moveByNewPixel(deltaX: Double,y deltaY: Double){
        self = Pixel(x: x + deltaX,y: y + deltaY)
    }
}

// 枚举let值不可变，这里用let来证明isToTheRightOfX的mutating方法是起作用的
let thePixel = Pixel(x: 5.0, y: 6.0)
if thePixel.isToTheRightOfX(7.0){
    print("the pixel is about to move to the right")
}

var thatPixel = Pixel(x: 1.0,y: 2.0)
thatPixel.moveByNewPixel(3.0, y: 4.0)


/* 定义一个三态开关，一般值类型的属性不能在它的实例方法中被修改 */
/* 如果需要在特定的方法中修改属性，可以选择变异mutating关键字 */
/* 这样就能从方法内部改变它的属性，对它做的任何改变在方法结束时会保留在原始结构中 */
/* 还可以给它隐含的self属性赋值一个全新的实例，新实例在方法结束后将替换原来的实例 */
enum TriStatesSwitch{
    case Off,Low,High
    mutating func next(){
        switch self{
            case .Off:
                self = .Low
            case .Low:
                self = .High
            case .High:
                self = .Off
        }
    }
}
var lightsOn = TriStatesSwitch.Low
lightsOn.next()
lightsOn.next()
lightsOn.next()

/* ==========类型方法例子========== STA */
struct LevelTracker {
    static var highestUnlockedLevel = 1
    
    // 有一个玩家解锁新等级，就将最高等级解锁
    static func unlockLevel(level: Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    // 根据等级判断是否解锁
    static func levelIsUnlocked(level: Int) -> Bool{
        return level <= highestUnlockedLevel
    }
    
    // 变异方法以布尔值指示是否能够设置currentLevel
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool{
        if LevelTracker.levelIsUnlocked(level){
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}

/* 同一台设备只要有一个玩家解锁最高等级，那么这台设备其他玩家也解锁 */
class Player{
    var tracker = LevelTracker()
    let playerName: String
    
    
    func completedLevel(level: Int){
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    
    init(name: String){
        playerName = name
    }
}
var playerAB = Player(name: "Abhorsen")
playerAB.completedLevel(1)
print("Top level is now \(LevelTracker.highestUnlockedLevel)")


var 🐑 = Player(name: "云亲羊")
if 🐑.tracker.advanceToLevel(5){
    print("🐑 is now on level 5")
}else{
    print("level 5 is unlocked to 🐑")
}
/* ==========类型方法例子========== END */
/* 方法相关=============================== END */
// 最终final
























