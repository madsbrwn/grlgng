//
//  Model.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/11/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import Foundation
import GoogleMaps

let sharedModel = Model()

class UserInfo : NSObject
{
    var name : String = "Your Name"
    // speed is represented with floats between 1 and 3 with 3 being fastest speed
    var speed : Float = 2.0
    var hikesCompleted : Int = 0
    var milesHiked : Double = 0
    var minutesSpentHiking : Int = 0
    
    public func getName() -> String
    {
        return name
    }
    
    public func setName(myname : String)
    {
        name = myname
    }
    
    public func getSpeed() -> Float
    {
        return speed
    }
    
    public func setSpeed(myspeed : Float)
    {
        speed = myspeed
    }
}

class Model : NSObject
{
    var hikes : Dictionary = [String : HikeObject]()
    var userInfo : UserInfo = UserInfo()
    
    override init()
    {
        var hike = HikeObject()
        hike.name = "Mt. Timpanogos"
        hike.coords = CLLocationCoordinate2D(latitude: 40.405099, longitude: -111.606239)
        hike.minutesFromBYU = 26
        hike.trailLength = 15
        hike.calculateTotalMinutes()
        hike.description = "Mount Timpanogos offers views year round of spectacularly rugged terrain with outstanding glacial cirques, (the round, circular shaped valleys below the peaks) and moraines (masses of rocks, gravel, and sand deposited by glaciers). During the peak wildflower season which is late July and early August, this popular destination is a beautiful place to hike as a multitude of mountain wildflowers burst into colorful full bloom."
        hike.difficulty = 2
        
        hikes["Mt. Timpanogos"] = hike
        
        hike = HikeObject()
        hike.name = "Bridal Veil Falls"
        hike.coords = CLLocationCoordinate2D(latitude: 40.340581, longitude: -111.603428)
        hike.minutesFromBYU = 13
        hike.trailLength = 1.5
        hike.calculateTotalMinutes()
        hike.description = "Bridal Veil Falls is a beautiful natural waterfall in scenic Provo Canyon. It's easily accessible via a trail that connects to the parking lot. The trail to the falls is open year-round, although accessibility may be limited in the winter months due to snow."
        hike.difficulty = 0
        
        hikes["Bridal Veil Falls"] = hike
        
        hike = HikeObject()
        hike.name = "Y Mountain"
        hike.coords = CLLocationCoordinate2D(latitude: 40.244939, longitude: -111.627315)
        hike.minutesFromBYU = 5
        hike.trailLength = 2.4
        hike.calculateTotalMinutes()
        hike.description = "The \"Y\" Mountain Trail is a 6.3 mile moderately trafficked out and back trail located near Provo, Utah that features beautiful wild flowers and is rated as difficult. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail but must be kept on leash."
        hike.difficulty = 1
        
        hikes["Y Mountain"] = hike
        
        hike = HikeObject()
        hike.name = "Stewart Falls"
        hike.coords = CLLocationCoordinate2D(latitude: 40.404225, longitude: -111.605491)
        hike.minutesFromBYU = 26
        hike.trailLength = 6
        hike.calculateTotalMinutes()
        hike.description = "Stewart Falls is one of the most scenic and photogenic waterfalls in northern Utah. It falls in two tiers and is over 200 feet tall. It is a moderate hike through a beautiful forest on the east side of Mt Timpanogos. The trail is well marked and easy to follow. The descent from the ridge down to the base of the falls is quite steep (youngsters should be held in check at that point) but this is a great family hike. Summer is a good time to make the trek, and fall is even better because colored leaves are magnificent. "
        hike.difficulty = 1
        
        hikes["Stewart Falls"] = hike
    }
    
    public func buildTimeText(time : Int) -> String
    {
        if (time == 0)
        {
            return "any time"
        }
        
        let hrs = time / 60
        let min = time % 60
        
        var str : String = ""
        
        if hrs != 0
        {
            str += String(hrs) + (hrs == 1 ? " hr " : " hrs ")
        }
        
        if min != 0
        {
            str += String(min) + " min"
        }
        
        return str
    }
    
    public func getHikesUnderTime(time : Int) -> [HikeObject]
    {
        if (time == 0)
        {
            return [HikeObject](hikes.values)
        }
        
        var filteredHikes : [HikeObject] = []
        
        for (_, data) in hikes
        {
            if (data.totalMinutes <= time)
            {
                filteredHikes.append(data)
            }
        }
        
        return filteredHikes
    }
    
    public func updateHikeCompleted( name: String, completed : Bool)
    {
        hikes[name]?.completed = true
        
        if completed
        {
            userInfo.hikesCompleted += 1
            userInfo.milesHiked += (hikes[name]?.trailLength)!
            userInfo.minutesSpentHiking += (hikes[name]?.totalMinutes)!
        }
        else
        {
            userInfo.hikesCompleted -= 1
            userInfo.milesHiked -= (hikes[name]?.trailLength)!
            userInfo.minutesSpentHiking -= (hikes[name]?.totalMinutes)!
        }
    }
    
    
    public class HikeObject
    {
        var name : String = ""
        var coords : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.248875, longitude: -111.649278)
        var totalMinutes : Int = 0
        var minutesFromBYU : Int = 0
        var trailLength : Double = 0
        var description : String = ""
        var saved : Bool = false
        var completed : Bool = false
        var difficulty : Int = 1
        let diffFactors = [0.75, 1, 1.5]
        
        func calculateTotalMinutes()
        {
            self.totalMinutes = (2 * minutesFromBYU) + Int((trailLength / ((1 / 20) * diffFactors[difficulty])))
        }
    }
}
