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


// If statements

var age = 13

if age >= 18 {
    print("You can play")
} else {
    print("Sorry, you are too young")
}

var name2 = "Marie"

if name2 == "Marie" {
    print("Hi \(name) you can play")
} else {
    print("Sorry \(name) you cannot play")
}

if name2 == "Kirsten" || name2 == "Marie" {
    print("Welcome \(name2)")
}

// Challenge

var username = "mariesta"

var password = "test"

if username == "mariesta" && password == "test"{
    print("Welcome \(username)")
} else if username == "mariesta" && password != "test" {
    print("Incorrect Password")
} else if username != "mariesta" && password == "test" {
    print("Incorrect Username")
} else {
    print("Incorrect Credentials")
}

// Loops

for i in 1 ..< 10 {
    print(i)
}

var prices = [3.99, 4.99, 2.99]

for price in prices {
    print(price)
}

var totalPrice = 0.0
for (index, value) in prices.enumerated() {
    totalPrice = totalPrice + value
}

print(totalPrice)


// Challenge

var arr:[Double] = [4, 9, 13]

for (index, value) in arr.enumerated() {
    arr[index] = value / 2
}

print(arr)

// While Loops

var i = 1

while i < 10 {
    print(i)
    i += 1
}

// Challenge

var arr3 = [1, 2, 3, 4, 5]
var j = 0

while j < arr3.count {
    arr3[j] = arr3[j] - 1
    j += 1
}

print(arr3)


// New Project
func isPrime(n: Int) -> Bool {
    if n <= 1 {
        return false
    } else if n <= 3 {
        return true
    } else if n % 2 == 0 || n % 3 == 0{
        return false
    }
    
    var i = 5
    while i * i <= n {
        if n % i == 0 || n % (i+2) == 0 {
            return false
        }
        i = i + 6
    }
    return true
}

var number2 = 50

var result = isPrime(n: number2)