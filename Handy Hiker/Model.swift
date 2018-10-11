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
        hike.time = 0
        hike.distanceFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
        hike.saved = false
        
        hikes["Mt. Timpanogos"] = hike
        
        hike = HikeObject()
        hike.name = "Bridal Veil Falls"
        hike.time = 0
        hike.distanceFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
        hike.saved = false
        
        hikes["Bridal Veil Falls"] = hike
        
        hike = HikeObject()
        hike.name = "Y Mountain"
        hike.time = 0
        hike.distanceFromBYU = 0
        hike.hikeDistance = 0
        hike.description = "fun"
        hike.saved = false
        
        hikes["Y Mountain"] = hike
        
        hike = HikeObject()
        hike.name = "Stewart Falls"
        hike.time = 0
        hike.distanceFromBYU = 0
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
            if (data.time < time)
            {
                filteredHikes[hike] = data
            }
        }
        
        return filteredHikes
    }
    
    class HikeObject
    {
        var name : String = ""
        var time : Int = 0
        var distanceFromBYU : Int = 0
        var hikeDistance : Int = 0
        var description : String = ""
        var saved : Bool = false
    }
}
