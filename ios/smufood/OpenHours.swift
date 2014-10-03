//
//  OpenHours.swift
//  smufood
//
//  Created by Samuel Hunter on 9/28/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class OpenHours {
    
    var dateForHours : String
    var mealPlaceName : String
    var openTime1 : String
    var closeTime1 : String
    var openTime2: String
    var closeTime2: String
    var openTime3: String
    var closeTime3 : String
    
    
    init(var dateForHours: String, var mealPlaceName : String, var openTime1 : String, var closeTime1 : String, var openTime2 : String, closeTime2 : String, var openTime3 : String, var closeTime3 : String)
    {
        
        self.dateForHours = dateForHours
        self.mealPlaceName = mealPlaceName
        self.openTime1 = openTime1
        self.closeTime1 = closeTime1
        self.openTime2 = openTime2
        self.closeTime2 = closeTime2
        self.openTime3 = openTime3
        self.closeTime3 = closeTime3
        
    }
    init()
    {
        self.dateForHours = ""
        self.mealPlaceName = ""
        self.openTime1 = ""
        self.closeTime1 = ""
        self.openTime2 = ""
        self.closeTime2 = ""
        self.openTime3 = ""
        self.closeTime3 = ""
    
    }
}