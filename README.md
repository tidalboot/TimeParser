# TimeParser

###What does it do?
Makes your ugly dates look pretty!

###So how do I use it?

```Swift
//given todays date is the 2015-10-22
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
var uglyDate: NSDate = dateFormatter.dateFromString("2015-10-21")!

let tidyDate: String = uglyDate.tidy(timeZoneOfDate: NSDate.timeZone.GMT)
//this returns "1 day ago"
```

And that's all there is to it!
