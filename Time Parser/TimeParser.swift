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
        
        let dateIntervalToParse = round(NSTimeInterval(timeSince1970))
        var parsedDate = ""
        switch dateIntervalToParse {
        case 0...60:
            parsedDate = "\(Int(dateIntervalToParse)) second ago"
        case 61...3600:
            parsedDate = "\(Int(dateIntervalToParse / 60)) minute ago"
        case 361...86400:
            parsedDate = "\(Int(dateIntervalToParse / 3600)) hour ago"
        case 86401...604800:
            parsedDate = "\(Int(dateIntervalToParse / 86400)) day ago"
        case 604801...2419200:
            parsedDate = "\(Int(dateIntervalToParse / 604800)) week ago"
        case 2419201...29030400:
            parsedDate = "\(Int(dateIntervalToParse / 2419200)) month ago"
        case 29030401...290304000:
            parsedDate = "\(Int(dateIntervalToParse / 29030400)) year ago"
        case 290304001...2903040000:
            parsedDate = "\(Int(dateIntervalToParse / 290304000)) decade ago"
        case 2903040001...29030400000:
            parsedDate = "Over a century ago"
        default:
            return "Just now"
        }
        
        //Adds an 's' to the end of the tidied string if a plural is needed
        let whiteSpace = NSCharacterSet.whitespaceCharacterSet()
        let charactersUntilEndOfInts = parsedDate.rangeOfCharacterFromSet(whiteSpace)?.endIndex.predecessor()
        let numberOfMeasurements = parsedDate.substringToIndex(charactersUntilEndOfInts!).toInt()
        
        if numberOfMeasurements != 1 {
            let newParsed: NSMutableString = NSMutableString(string: parsedDate)
            let fooplace = newParsed.length - 4
            newParsed.insertString("s", atIndex: fooplace)
            parsedDate = newParsed as String
        }
        return parsedDate
    }
}


//--------------End of line
