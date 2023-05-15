//
//  main.swift
//  Leap Year Calc
//
//  Created by courtney M on 8/27/22.
//

import Foundation

var year = 2000

repeat{
    
    if year % 4 != 0{
        print( " \(year) is not a leap year")
    }
    else if year % 4 == 0 && year % 100 != 0 {
        print( " \(year) is a leap year")
    }
    else if year % 400 == 0{
        print( " \(year) is a leap year")
    }
    
    else {
        print( " \(year) is not a leap year")
    }
    year += 1
    
}while year <= 2500
