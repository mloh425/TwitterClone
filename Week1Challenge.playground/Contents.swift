//Week 1 Coding Challenges!

import UIKit

//Monday Challenge - Write a method that reverses an Array.

var array0 : [AnyObject] = []
var array1 : [AnyObject] = [1]
var array2 : [AnyObject] = [1, 2]
var array3 : [AnyObject] = [1, 2, 3]
var array4 : [AnyObject] = ["a", "b", "c", "d"]
var array5 : [AnyObject] = [1, 2, 3, 4, 5]

func reverseArray(array: [AnyObject]) -> [AnyObject] {
  var myArray = array
  if !myArray.isEmpty {
    var length = array.count
    if length > 1 {
      for index in 0..<myArray.count / 2 {
        var current = myArray[index]
        myArray[index] = myArray[length - 1 - index]
        myArray[length - 1 - index] = current
      }
    }
  }
  return myArray
}

array0 = reverseArray(array0)
array1 = reverseArray(array1)
array2 = reverseArray(array2)
array3 = reverseArray(array3)
array4 = reverseArray(array4)
array5 = reverseArray(array5)

//Tuesday Challenge - FizzBuzz!

for index in 1...100 {
  if index % 3 == 0 && index % 5 == 0 {
    println("FizzBuzz")
  } else if index % 3 == 0 {
    println("Fizz")
  } else if index % 5 == 0 {
    println("Buzz")
  } else {
    println(index)
  }
}

//Wednesday Challenge - Return the number of times that the string "hi" appears anywhere in the given string.

var phrase0 = "hikittymeowhi"
var phrase1 = "hi"
var phrase2 = "124h324hi324hi342 hi 234"
func countHi (word : String) -> Int {
  var counter = 0
  var newWord = word
  var length = count(newWord)
  if length > 1 {
    for index in 0...length - 2 {
      var temp = newWord.substringWithRange(Range<String.Index>(start: advance(newWord.startIndex, index), end: advance(newWord.startIndex, index + 2)))
//      println(temp)
      if temp == "hi" {
        counter++
//      println(counter)
      }
    }
  }
  return counter
}

var count1 = countHi(phrase0)
var count2 = countHi(phrase1)
var count3 = countHi(phrase2)
println(count1) //There should be 2 instances of 'hi'
println(count2) //There should be 1 instance of 'hi'
println(count3) //There should be 3 instances of 'hi'

//Thursday Challenge - Given a string, return a version where all the "x" have been removed. Except an "x" at the very start or end should not be removed. 

//Substring it to go from 2nd to 2nd to last index? Then just remove everything? What about edge cases.. etc 

func removeX (word : String) -> String {
  
}
