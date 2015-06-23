# TimeParser
TimeParser is an extension of NSDate designed to simplify the presentation of the length of time between a given date and the current time. 

###What does it do?
Parses a given date and returns a string representation of the amount of time that has passed since said date up until the present time. For example, if today were the 22nd June and the date you parsed was the 21st June you would get back a String of "1 day ago", if the date you were parsing only occured 13 minutes ago then well that's exactly what you'll get back (Much nicer!). If the date you are parsing came from a particular time zone (Due to your server being based in sunny california for example) then you can pass in the relevant time zone. 

###So how do I use it?
It's dead simple to use, simply add the TimeParser swift file anywhere in your current project and you can start tidying up your dates straight away! 
The 'tidy' function is an extension of NSDate which returns a String and so once you have your NSDate object you want to parse you're half way there already. A timeZone object as the only parameter and this is where you can specify where your date has come from. timeZone is a new object type that comes with TimeParser and is also an extension of NSDate so to start parsing simply do something along the lines of the following:

```Swift
let seoulTime = NSDate.timeZone.GMT_plus_9
let tidyDate = yourNSDateObject.tidy(seoulTime) 
```
Or if you're only using your timeZone once:
```Swift
let tidyDate = yourNSDateObject(NSDate.timeZone.GMT_plus_9)
```

And that's all there is to it!

###Time Zones
It's not easy to know which timeZone relates to which country, or even to which area of a country relates to which timeZone so if you're going to be parsing dates from lots of different countries feel free to either refer to or completely replace timeZone with the far more detailed one which you can find here:  
https://shrib.com/Kuim6v2R  

This list is obviously rather large and so enumerating through it multiple times is going to decrease the efficiency of your nice lean code, if you do want to implement it in to your version of timeParser be sure to keep this in mind.


