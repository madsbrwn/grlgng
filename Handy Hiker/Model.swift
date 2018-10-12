//
//  Model.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/11/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import Foundation

let sharedModel = Model()

class Model : NSObject
{
    var hikes : Dictionary = [String : HikeObject]()
    var userInfo : Dictionary = ["Name":"", "Speed":""]
    
    override init()
    {
        var hike = HikeObject()
        hike.name = "Mt. Timpanogos"
        hike.baseTime = 720
        hike.milesFromBYU = 26
        hike.hikeDistance = 12
        hike.description = "Mount Timpanogos offers views year round of spectacularly rugged terrain with outstanding glacial cirques, (the round, circular shaped valleys below the peaks) and moraines (masses of rocks, gravel, and sand deposited by glaciers). During the peak wildflower season which is late July and early August, this popular destination is a beautiful place to hike as a multitude of mountain wildflowers burst into colorful full bloom."
        hike.saved = false
        
        hikes["Mt. Timpanogos"] = hike
        
        hike = HikeObject()
        hike.name = "Bridal Veil Falls"
        hike.baseTime = 60
        hike.milesFromBYU = 8
        hike.hikeDistance = 2
        hike.description = "Bridal Veil Falls is a beautiful natural waterfall in scenic Provo Canyon. It's easily accessible via a trail that connects to the parking lot. The trail to the falls is open year-round, although accessibility may be limited in the winter months due to snow."
        hike.saved = false
        
        hikes["Bridal Veil Falls"] = hike
        
        hike = HikeObject()
        hike.name = "Y Mountain"
        hike.baseTime = 0
        hike.milesFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
        hike.saved = false
        
        hikes["Y Mountain"] = hike
        
        hike = HikeObject()
        hike.name = "Stewart Falls"
        hike.baseTime = 120
        hike.milesFromBYU = 16
        hike.hikeDistance = 6
        hike.description = "Stewart Falls is one of the most scenic and photogenic waterfalls in northern Utah. It falls in two tiers and is over 200 feet tall. It is a moderate hike through a beautiful forest on the east side of Mt Timpanogos. The trail is well marked and easy to follow. The descent from the ridge down to the base of the falls is quite steep (youngsters should be held in check at that point) but this is a great family hike. Summer is a good time to make the trek, and fall is even better because colored leaves are magnificent. "
        hike.saved = false
        
        hikes["Stewart Falls"] = hike
    }
    
    func getHikesUnderTime(time : Int) -> Dictionary<String,HikeObject>
    {
        var filteredHikes : Dictionary = [String : HikeObject]()
        
        for (hike, data) in hikes
        {
            if (data.baseTime < time)
            {
                filteredHikes[hike] = data
            }
        }
        
        return filteredHikes
    }
    
    class HikeObject
    {
        var name : String = ""
        var baseTime : Int = 0
        var milesFromBYU : Int = 0
        var hikeDistance : Int = 0
        var description : String = ""
        var saved : Bool = false
    }
}
