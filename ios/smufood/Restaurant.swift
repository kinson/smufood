//
//  Restaurant.swift
//  smufood
//
//  Created by Samuel Hunter on 10/4/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class Restaurant {

    var restName : String
    var realName : String
    var restOpen : String
    var restClose : String
    var restDate : String
    var restOpenParsed : String
    var restCloseParsed : String
    
    

    init(var name: String, var open: String, var close: String, var date: String)
    {
        self.restName = name
        self.restOpen = open
        self.restClose = close
        self.restDate = date
        self.realName = ""
        
        var restaurants = ["Pizza Hut", "Arnold", "Umph", "Einstein Bagels", "Meadows POD", "Macs Place", "Subway", "Chick Fil A", "Cafe 100", "eS MUcho", "The Market", "Faculty Club" , "SMUothies", "Sushic"]
        
        var restShort = ["pizzahut", "arnold", "umph", "einsteins", "pod", "macs", "subway", "chickfila", "cafe100", "esmucho", "market", "facultyclub", "smuothies", "sushic"]
        
        for i in 0...(restShort.count-1) {
            if (restShort[i] == self.restName) {
                self.realName = restaurants[i]
            }
        }
        
        self.restOpenParsed = TimeHelper.parseTime(restOpen)
        self.restCloseParsed = TimeHelper.parseTime(restClose)
        
    }

    
    func toString() -> String {
        return self.restName + self.restOpen + self.restClose 
    }
    
    
    
}