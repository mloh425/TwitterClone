//Week 1 Coding Challenges by (Matthew) Sau Chung Loh

import UIKit

//Monday Challenge - Write a method that reverses an Array.

var array0 : [AnyObject] = []
var array1 : [AnyObject] = [1]
var array2 : [AnyObject] = [1, 2]
var array3 : [AnyObject] = [1, 2, 3]
var array4 : [AnyObject] = ["r", "e", "z", "a", "L", " ", "r", "o", "j", "a", "M"]
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
      if temp == "hi" {
        counter++
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

var xPhrase0 = "ct"
var xPhrase1 = "cat"
var xPhrase2 = "cxt"
var xPhrase3 = "xtx"
var xPhrase4 = "xAlexxx"
var xPhrase5 = "xxxxxFx"

//Removes all lowercase 'x' characters from the middle of a string that is passed in
//Does not remove 'x' characters if they are at the beginning or end of the string
func removeX (word : String) -> String {
  var stringLength = count(word)
  var wordToReturn = word
  
  if count(word) > 2 {
    let range = advance(wordToReturn.endIndex, -(stringLength - 1))..<advance(wordToReturn.endIndex, -1)
    wordToReturn.removeRange(range)
    var wordToRemoveXFrom = word.substringWithRange(Range<String.Index>(start: advance(word.startIndex, 1), end: advance(word.endIndex, -1)))
    for var index = 0; index <= count(wordToRemoveXFrom) - 1; ++index { //Did not use for - in style because of the need to decrement index
      var character = wordToRemoveXFrom.substringWithRange(Range<String.Index>(start: advance(wordToRemoveXFrom.startIndex, index), end: advance(wordToRemoveXFrom.startIndex, index + 1)))
      if character == "x" {
        wordToRemoveXFrom.removeAtIndex(advance(wordToRemoveXFrom.startIndex, index))
        index--
      }
    }
    wordToReturn.splice(wordToRemoveXFrom, atIndex: wordToReturn.startIndex.successor())
    return wordToReturn
  }
  return word
}

println(removeX(xPhrase0))
println(removeX(xPhrase1))
println(removeX(xPhrase2))
println(removeX(xPhrase3))
println(removeX(xPhrase4))
println(removeX(xPhrase5))

