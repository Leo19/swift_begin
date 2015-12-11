//: Playground - noun: a place where people can play
/* Leo)Xcode7.2 */
/* swift指定构造器总是向上代理，便利构造器总是横向代理 */
/* swift是两段式构造过程，第一个阶段是把所有存储型属性的值都确定 */
/* 确定的过程是通过 */
import UIKit

class Vehicle{
    // 所有存储类型都有值，所以会得到一个默认构造器
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) wheels"
    }
}

// 获得默认构造器
let vehicle = Vehicle()
print(vehicle.description)


// 覆盖父类的构造器，先初始化父类中的存储属性
class Bicycle: Vehicle {
    var passengers: Int
    override init(){
        // 先初始化本类中得所有存储属性，再初始化父类的，然后还可以再修改
        passengers = 1
        super.init()
        // 父类中已初始化，此处可以再次修改，但是不能修改继承来的常量属性
        numberOfWheels = 2
    }
}

// 输出的是2
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")




class Food{
    var name: String
    init(foodName: String){
        name = foodName
    }
    
    convenience init(){
        print("F constructor")
        self.init(foodName: "[Unnamed]")
    }
}

let namedMeat = Food(foodName: "Bacon")
let foodName = namedMeat.name
print(foodName)

// Food的子类，引入了一个int类型属性
class RecipeIngredient: Food{
    var quantity: Int
    init(name: String,quantity: Int){
        self.quantity = quantity
        super.init(foodName: name)
    }
    
    override convenience init(foodName name: String){
        print("R contructor")
        self.init(name: name,quantity: 2)
    }
}

/* 由于RecipeIngredient类实现了所有父类的指定构造器 */
/* 所以子类就自动继承父类的所有便利构造器也就是init() */
/* 但是它里调用的self.init(name: String)方法是子类的，并非父类的 */
let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name)
print(oneMysteryItem.quantity)

let oneBacon = RecipeIngredient(foodName: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

// purchased有一个默认值，自己没有定义构造器，所以自动继承所有父类的构造器
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String{
        var output = "\(quantity) x \(name)"
        output += purchased ? "√" : "×"
        return output
    }
}
print("=======================")
let spListItem = ShoppingListItem()
// 下面这一句Xcode7.2会报错
//ShoppingListItem(name: "Bacon")
print("=======================")
let shListItem2 = ShoppingListItem(name: "Eggs", quantity: 2)

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "beef", quantity: 8)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList{
    print(item.description)
}


/* 可失败构造器具体的定义，如果给构造器传入无效值，或缺少某种外部资源 */
/* 时构造失败，可失的败构造器会创建一个类型为自身类型的可选类型的对象 */
/* 并且通过return nil语句表明在什么情况下构造器方法应该返回构造失败 */
struct Animal {
    let species: String
    init?(species: String){
        if species.isEmpty{ return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature{
    print("WoW this is a species of \(giraffe.species) animal")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil{
    print("The anonymous creature could not be initialized")
}

/* 枚举类型的可失败构造器 return nil 这句表明在此情况下返回失败 */
/* 值类型的可失败构造器，可以在构造过程中的任意时间点触发构造失败 */
enum MinionsUnit{
    case Kevin,Dave,Stuart,Jorge
    init?(symbol: Character){
        switch symbol{
            case "K":
                self = .Kevin
            case "D":
                self = .Dave
            case "S":
                self = .Stuart
            case "J":
                self = .Jorge
            default:
                return nil
        }
    }
}

// 这个枚举没有给值只有MinionsUnit.Dave
let dave = MinionsUnit(symbol: "D")
if dave != nil {
    print("this is \(dave)")
}
let unknownUnit = MinionsUnit(symbol: "X")
if unknownUnit == nil{
    print("he is not a minions")
}


enum MinionsName: Character{
    case Bob = "B", Jon = "J" , Tim = "T"
}
let bob = MinionsName(rawValue: "B")
if bob != nil{
    print("this is minions name is: \(bob!.rawValue)")
}
let unknownMinions = MinionsName(rawValue: "X")
if unknownMinions == nil{
    print("this is an anknown units")
}


/* 对类而言，可失败构造器只能在类引入的所有存储型属性被初始化后 */
/* 以及构造器代理调用完成后，才能触发构造失败 */
class Product{
    let name: String!
    init?(name: String){
        self.name = name
        if name.isEmpty { return nil }
    }
}

/* 类，结构体，枚举的可失败构造器可以横向和纵向代理到其他可失败构造器 */
/* 无论横向或纵向代理，只要触发构造失败，整个构造过程会立即终止，然后 */
/* 可失败构造器也可以代理到其他非可失败构造器，通过这种方式你可以增加 */
/* 一个可能的失败状态到现有的构造过程中,init?()和init!()都可以并且 */
/* 可以互相重写，但是init!()一旦构造失败，会触发一个断言 */
class CarItem: Product {
    let quantity: Int!
    init?(name: String,quantity: Int) {
        // 这两步满足了触发构造失败前必须总是完成构造器代理调用这个条件
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 {return nil}
    }
}

if let twoSocks = CarItem(name: "sock", quantity: 2){
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CarItem(name: "shirt", quantity: 0){
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
}else{
    print("Unable to initialize zero shirts")
}

// 父类可失败构造器会触发
if let oneUnnamed = CarItem(name: "", quantity: 1){
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
}else{
    print("Unable to initialize one unnamed product")
}

/* 必要构造器，在类的构造器前添加required修饰符表明所有子类的必须实现该构造器 */
class SomeClass{
    var name = ""
    required init(){
        // code
    }
    
    init(name: String){
        self.name = name
    }
}

/* 子类重写父类的必要构造器时，必须在子类构造器前页添加required修饰符，不用写override */
class SomeSubclass: SomeClass{
    var age = 0
    // 子类中写完代码后要调用一下super.init()
    required init(){
        // subclass code
        super.init()
    }
    
    init(name: String,age: Int){
        self.age = age
        super.init(name: name)
    }
}

class Document{
    var name: String?
    
    init(){}
    
    init?(name: String){
        self.name = name
        if name.isEmpty{ return nil }
    }
}

// 子类用非失败构造器重写了可失败构造器
class AutomaticallyNamedDocument: Document{
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    // 子类重写了父类的可失败构造器，用另一种方式处理了空字符串额的情况
    override init(name: String) {
        super.init()
        if name.isEmpty{
            self.name = "[Untitled]"
        }else{
            self.name = name
        }
    }

}

class UntitledDocument: Document{
    override init() {
        // 此处用了感叹号!来强制解包，并且传入了的是非空字符串常量来调用它
        super.init(name: "[Untitled]")!
    }
}

/* 通过闭包或函数设置属性的默认值 */
/* 如果某个存储型属性的默认值需要一些定制或者设置，可以用闭包或者全局函数 */
/* 每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而他们 */
/* 的返回值会当做默认值赋给此属性 */
class Object{
    var anyThing = ""
}
// 特别留意闭包后面的一对小括号，意思是让swift立即执行此闭包，并且将返回值赋给property
class AnyObject{
    let property: Object = {
        var obj = Object()
        return obj
    }()
}

/* 下面例子中定义了一个结构体Checkerboard构建一个西洋跳棋游戏的棋盘 */
/* 西洋跳棋游戏在一副黑白交替的10x10的期盼中进行，在Checkerboard  */
/* 的结构体中定义了属性boardColors他是一个包含100个Bool值的数组。 */
/* 在数组中，值为true的元素表示一个黑格，值为false的元素表示一个白格 */
/* 数组中第一个元素代表棋盘上左上角的格子，最后一个元素代表棋盘上右下角的格子 */
struct Checkerboard {
    let boardColors: [Bool] = {
        // 做一个和变量类型相同的临时变量
        var tempBoard = [Bool]()
        var isBlack = false
        for i in 1...10{
            for k in 1...10{
                tempBoard.append(isBlack)
                // 每一列黑白交替
                isBlack = !isBlack
            }
            // 每行都黑白交替
            isBlack = !isBlack
        }
        // 一定要返回
        return tempBoard
    }()
    
    // 一个额外的方法
    func squareIsBlackAtRow(row: Int,column: Int) -> Bool{
        // 就是用一维数组模仿二维数组
        return boardColors[(row * 10) + column]
    }
}

// 看看最后一个和第一个格子里的元素
let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))
print(board.squareIsBlackAtRow(9, column: 9))
