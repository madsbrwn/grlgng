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
        hike.baseTime = 200
        hike.milesFromBYU = 26
        hike.hikeDistance = 15
        hike.description = "Mount Timpanogos offers views year round of spectacularly rugged terrain with outstanding glacial cirques, (the round, circular shaped valleys below the peaks) and moraines (masses of rocks, gravel, and sand deposited by glaciers). During the peak wildflower season which is late July and early August, this popular destination is a beautiful place to hike as a multitude of mountain wildflowers burst into colorful full bloom."
        hike.saved = false
        
        hikes["Mt. Timpanogos"] = hike
        
        hike = HikeObject()
        hike.name = "Bridal Veil Falls"
        hike.baseTime = 0
        hike.milesFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
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
        hike.baseTime = 0
        hike.milesFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
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
