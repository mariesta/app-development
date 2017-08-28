//: Playground - noun: a place where people can play

import UIKit

// Strings

var str = "Hello, playground"

var name:String = "Marie"

print("hello " + name)

// Integers

var int:Int = 9

int = int * 2

int = int / 4

var anotherInt = 7

print(int + anotherInt)

print("The value of int is \(int)")

// Doubles

var number:Double = 8.4

print(number * 7)

print(number * Double(int))

// Boolean

var isMale:Bool = true

// Exercise

var a:Int = 7

var b:Double = 14.7

var string = "The result is \(b * Double(a))"

// Arrays

var array = [1, 2, 3, 4]

print(array.count)

array.append(5)

array.remove(at: 3)

array.sort()

// Exercise

var array2 = [2, 3, 4]

array2.remove(at: 1)

array2.append(array2[0] * array2[1])

// Dictionaries

var dictionary = [
    "computer": "something to play call of duty on",
    "book": "something to enjoy on a rainy day"
]

print(dictionary["book"]!)

dictionary["pen"] = "Something to write with"

dictionary.removeValue(forKey: "computer")

print(dictionary)

// Challenge
var foodMenu = [
  "scrambled eggs": 3.99,
  "salmon side": 2.99,
  "brownie": 3.99
]

var totalCost = foodMenu["scrambled eggs"]! + foodMenu["salmon side"]! + foodMenu["brownie"]!

print("The total is \(totalCost)")




