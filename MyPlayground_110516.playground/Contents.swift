//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swaping strings using
//Pointers
//Tuples
func swap<T>(inout a:T, inout b:T)
{
    (a, b) = (b, a)
}

var a = "Nombre", b = "Apelllido"
print(a, b)
swap(&a, &b)

print(a, b)


//Concatenate two strings
//Taking 0, 1, or 2 parameters
//Return "none" when there's no parameters
func flexStrings(s1: String = "", s2: String = "") -> String {
    return s1 + s2 == "" ? "none": s1 + s2
}

print(flexStrings())
print(flexStrings(a))
print(flexStrings(s2: b))
print(flexStrings(a, s2: b))
print(flexStrings(b,s2: a))

//The function will return the sum of the passed parameters as a String, following the rules below.
//If a parameter is an empty string or an Int equal to 0, add -10 to the result.
//If a parameter is an String that represents a positive number (e.g. “10”, not “-5”), add it to the result.
//If a parameter is an Int, add it to the result.
//In any other case, do not add it to the result.

func sumAny(anys: Any...) -> String {
    return String((anys.map({item in
        switch item {
        case "" as String, 0 as Int:
            return -10
        case let s as String where Int(s) > 0:
            return Int(s)!
        case is Int:
            return item as! Int
        default:
            return 0
        }
    }) as [Int]).reduce(0) {
        $0 + $1
        })
}


print (sumAny(1,3,"casa",5,6,8,9,3,8))


//produce as output (eg. via print() or println()) the numbers from from to to.

func countFrom(from: Int, to: Int) {
    print(from) // output to the assistant editor
    if from < to {
        countFrom(from + 1, to: to)
    }
}

countFrom(1, to: 5)


//Victor's challenge

var array = [2, 321, -6, 2, -83, 3, -10, 0, 453, 2]
var window = 3

//Function to make bigger product of number of window items
func productArray(array: [Int], window: Int) -> Int {
//    Get a sorted version of the array to use only the bigger items
    var sortArray = array.sort()
    print(sortArray)

    print(sortArray.count)

    var begin = sortArray.count-window
    var product = 1

//    Run through array to mke the product for just the number of items in the window
    for i in begin...sortArray.count-1
    {
        print(sortArray[i])
        product *= sortArray[i]
    }

    print(product)
    return product
}

//Function to sum the number of consecutive items, equal to window
//And see which one is the bigger
func sumArray(array: [Int], window: Int) -> Int {
    print(array)
    var maxSum = 0
    var maxArray : [Int] = []
    var sum = 0
    var at = array.count-window
    
//    Run trough array
    for i in 0...array.count-window
    {
//        Run treough array on window size
        for index in i...i+window-1 {
            sum += array[index]
        }
        
        if (sum > maxSum)
        {
            maxArray.removeAll()
            for index in i...i+window-1 {
                maxArray.append(array[index])
            }
            maxSum = sum
            sum = 0
        }
    }
    
    print(maxSum)
    print(maxArray)
    
    return maxSum
}


print(productArray(array, window: window))
print(sumArray(array, window: window))

