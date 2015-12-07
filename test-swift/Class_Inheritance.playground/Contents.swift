//: Playground - noun: a place where people can play
// 2015-12-03 Leo)Xcode7.1
import UIKit

/* 阻止被重写的方法，只需要在关键字前加上final(final var,final func) */
class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) KM per hour"
    }
    
    func makeNoise(){
        // maybe its subclass will do something
    }
}

let basicVehicle = Vehicle()
basicVehicle.description

// 第一个子类(自行车)给一个属性
class Bicycle: Vehicle{
    var hasGlassWindow = false
}

let bicycle = Bicycle()
bicycle.currentSpeed = 15.0
bicycle.hasGlassWindow = true
print("Bicycle: \(bicycle.description)")

// 第二个子类双人自行车
class Tandem: Bicycle{
    var passengers = 2
}

let tandem = Tandem()
tandem.hasGlassWindow = false
tandem.passengers = 2
tandem.currentSpeed = 18.0
print("Tandem: \(tandem.description)")


// 重写属性和方法
class Car: Vehicle{
    var gear = 1
    override var description: String{
        print(super.description)
        return super.description + " in gear \(gear)"
    }
    
    override func makeNoise() {
        print("Kahh Kahh")
    }
}

let car = Car()
car.currentSpeed = 35.0
car.gear = 2
print("Car: " + car.description)
car.makeNoise()

// 给继承来的属性加属性观察器，一般不同时加set和观察器
class AutomaticCar: Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}















