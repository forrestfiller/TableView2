//: Playground - noun: a place where people can play

import UIKit


self.show.cast = ["Frank", "Bob", "Biff"]
var reduceCast : String = self.show.cast.reduce("", combine: { $0 == "" ? $1 : $0 + "," + $1 })
print("reduceCast: ")

