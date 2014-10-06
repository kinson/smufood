//
//  TimeHelper.swift
//  smufood
//
//  Created by Samuel Hunter on 10/5/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class TimeHelper {

    class func getCurrentTime() ->String {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        var stringValue = formatter.stringFromDate(date)
        
        return stringValue
    }
    
    class func getCurrentDate() -> String {
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        var stringValue = formatter.stringFromDate(date)
        
        return stringValue
        
    }
    
    class func parseTime(var timeIn : String) -> String {
        
        timeIn = timeIn.lowercaseString
        
        let colon : Character = ":"
        let pm : Character = "p"
        let am: Character = "a"
        
        var foundColon = false
        var isPM = false
        
        var hoursString : String = ""
        var minutesString : String = ""
        var finalString : String = ""
        
        
        for character in timeIn {
            if (character == colon)
            {
                foundColon = true
            }
            else if (character == am || character == pm)
            {
                if (character == pm)
                {
                    isPM = true
                }
                break
            }
            else if (character != " ")
            {
                if (foundColon == true)
                {
                    minutesString.append(character)
                }
                else
                {
                    hoursString.append(character)
                }
            }
        }
        
        if (hoursString.toInt() == 12 && !isPM)
        {
            return "24:00"
        }
        
        if (isPM)
        {
            hoursString = String(hoursString.toInt()! + 12)
        }
        
        if (minutesString.isEmpty)
        {
            minutesString = "00"
        }
        
        if (countElements(hoursString) == 1)
        {
            var tempString: String = "0"
            hoursString = tempString + hoursString
        }
        
        
        finalString = hoursString + ":" + minutesString
        
        return finalString
    }
    
    //implement close time and open time parsing
    class func isOpen(var timeOpen: String, var timeClose: String) -> Bool {
    
        //var currentTime = parseTime(getCurrentTime())
        //test value
        var currentTime = parseTime("4:45 PM")
        var foundColon = false
        
        var hourStringOpen : String = ""
        var minuteStringOpen : String = ""
        
        var hourStringClose : String = ""
        var minuteStringClose : String = ""
        
        var parsedTimeOpen = parseTime(timeOpen)
        var parsedTimeClose = parseTime(timeClose)
        
        for character in parsedTimeOpen {
            if (character == ":")
            {
                foundColon = true
            }
            else
            {
                if (foundColon == true)
                {
                   minuteStringOpen.append(character)
                }
                else
                {
                    hourStringOpen.append(character)
                }
            }
        }
        foundColon = false
        
        for character in parsedTimeClose {
            if (character == ":")
            {
                foundColon = true
            }
            else
            {
                if (foundColon == true)
                {
                    minuteStringClose.append(character)
                }
                else
                {
                    hourStringClose.append(character)
                }
            }
        }
        
        foundColon = false
        var hourStringNow : String = ""
        var minuteStringNow : String = ""
        
        for character in currentTime {
            if (character == ":")
            {
                foundColon = true
            }
            else
            {
                if (foundColon == true)
                {
                    minuteStringNow.append(character)
                }
                else
                {
                    hourStringNow.append(character)
                }
            }
        }
        
        if (hourStringNow.toInt() > hourStringOpen.toInt() && hourStringNow.toInt() < hourStringClose.toInt())
        {
            return true
        }
        else if(hourStringNow == hourStringOpen)
        {
            if (minuteStringOpen < minuteStringNow)
            {
                return true
            }
        }
        else if(hourStringNow == hourStringClose)
        {
            if (minuteStringClose > minuteStringNow)
            {
                return true
            }
        }
        
        return false
    }
    
}