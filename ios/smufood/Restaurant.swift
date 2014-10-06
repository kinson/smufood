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
    var restOpen : String
    var restClose : String
    var restDate : String
    

    init(var name: String, var open: String, var close: String, var date: String)
    {
        self.restName = name
        self.restOpen = open
        self.restClose = close
        self.restDate = date
        
        self.restOpen = TimeHelper.parseTime(restOpen)
        self.restClose = TimeHelper.parseTime(restClose)
        
    }

    
    func toString() -> String {
        return self.restName + self.restOpen + self.restClose 
    }
    
    
    
}