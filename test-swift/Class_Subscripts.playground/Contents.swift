//: Playground - noun: a place where people can play
// 2015-12-3 Leo)Xcode7.1

import UIKit

/* 可以在类，结构体，枚举中定义下标脚本。可定义多个下标脚本，通过参数名字区分 */
/* 是访问集合(collection)，列表(list)，或序列(sequence)中元素的快捷方式 */
/* 最常见的Array和Dictionary要访问他们中的元素就可以这样写 array[index] */
/*  */
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let doubleTimesTable = TimesTable(multiplier: 3)
print("five times three is \(doubleTimesTable[5])")


// Dictonary里没有的key-value即是新增
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
print(numberOfLegs.count)
numberOfLegs["bird"] = 2
print(numberOfLegs.count)

// 将一个key的value设置为nil时表示删除
numberOfLegs["spider"] = nil
print(numberOfLegs.count)

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    // 初始化方法，值类型即使不写也会有默认的逐一构造器
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        self.grid = Array(count: rows * columns , repeatedValue: 0.0)
    }
    
    // 判断行和列是否合法
    func indexIsValidForRow(row: Int,column: Int) -> Bool{
        return row >= 0 && row < self.rows && column >= 0 && column < self.columns
    }
    
    subscript(row: Int, column: Int) -> Double{
        // 通过row * column + column是想模仿二维数组(0,2)就是第一行第三个
        get{
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            return grid[row * column + column]
        }
        
        set{
            // 越界时触发断言
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            grid[row * column + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 4, columns: 6)
matrix[1,3] = 2.2
matrix[0,4] = 4.5

// 会报错而且会
//let noneValue = matrix[6,7]

// 下面是几个常见的数组操作闭包
matrix.grid.map(){
    (Double d) in
    print(d)
}
matrix.grid.map(){
    print($0)
}

var big = matrix.grid.filter(){
    ($0 > 0.0)
}
print(big.capacity)














