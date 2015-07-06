//
//  File.swift
//  FoodForMort
//
//  Created by Ryan Cosans on 06/07/2015.
//  Copyright (c) 2015 Peinto. All rights reserved.
//

import Foundation
//TimeParser

import Foundation

extension NSDate {
    
    //GMT plus and minus enum
    enum timeZone: Int {
        case GMT_minus_14 = -14
        case GMT_minus_13 = -13
        case GMT_minus_12 = -12
        case GMT_minus_11 = -11
        case GMT_minus_10 = -10
        case GMT_minus_9 = -9
        case GMT_minus_8 = -8
        case GMT_minus_7 = -7
        case GMT_minus_6 = -6
        case GMT_minus_5 = -5
        case GMT_minus_4 = -4
        case GMT_minus_3 = -3
        case GMT_minus_2 = -2
        case GMT_minus_1 = -1
        case GMT = 0
        case GMT_plus_1 = 1
        case GMT_plus_2 = 2
        case GMT_plus_3 = 3
        case GMT_plus_4 = 4
        case GMT_plus_5 = 5
        case GMT_plus_6 = 6
        case GMT_plus_7 = 7
        case GMT_plus_8 = 8
        case GMT_plus_9 = 9
        case GMT_plus_10 = 10
        case GMT_plus_11 = 11
        case GMT_plus_12 = 12
    }
    
    /**
    Returns a tidied string such as "4 minutes ago" from an NSDate object. Required parameter is the
    time zone of origin of the date you want to tidy, a convenience enum has been built in as a child of NSDate. It can be used as
    
    • **tidy(NSDate.timeZone.GMT_plus_3)**
    • **tidy(NSDate.timeZone.GMT_minus_7)**
    
    
    :param: timeZone Convenience child object of NSDate.
    
    :returns: Returns a tidied date as a String.
    */
    func tidy (timeZoneOfDate: timeZone) -> String {
        
        let localTimeSince1970 = NSDate().timeIntervalSinceDate(self)
        
        let timeSince1970 = localTimeSince1970 - Double((NSTimeZone.localTimeZone().secondsFromGMTForDate(NSDate()) - (3600 * timeZoneOfDate.rawValue)))
        
        let dateIntervalToParse = Int(round(NSTimeInterval(timeSince1970)))
        
        func selectPrettyDate(dateIntervalToParse: Int) -> (String, Int) {
            switch dateIntervalToParse {
            case 0...60:
                return ("\(dateIntervalToParse) second", dateIntervalToParse)
            case 61...3600:
                return ("\(Int(dateIntervalToParse / 60)) minute", Int(dateIntervalToParse / 60))
            case 361...86400:
                return ("\(Int(dateIntervalToParse / 3600)) hour", Int(dateIntervalToParse / 3600))
            case 86401...604800:
                return ("\(Int(dateIntervalToParse / 86400)) day", Int(dateIntervalToParse / 86400))
            case 604801...2419200:
                return ("\(Int(dateIntervalToParse / 604800)) week", Int(dateIntervalToParse / 604800))
            case 2419201...29030400:
                return ("\(Int(dateIntervalToParse / 2419200)) month", Int(dateIntervalToParse / 2419200))
            case 29030401...290304000:
                return ("\(Int(dateIntervalToParse / 29030400)) year", Int(dateIntervalToParse / 29030400))
            default:
                return ("Just now", 0)
            }
        }
        
        var prettyDateInfo = selectPrettyDate(dateIntervalToParse)
        
        if(prettyDateInfo.1 == 0) {return prettyDateInfo.0}
        
        if(prettyDateInfo.1 != 1 && prettyDateInfo.1 != -1) {
            prettyDateInfo.0 += "s"
        }
        
        prettyDateInfo.0 += " ago"
        
        return prettyDateInfo.0
    }
    
}


//--------------End of line\
