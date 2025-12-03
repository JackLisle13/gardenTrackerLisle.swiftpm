//
//  File.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/5/25.
//

import Foundation
import SwiftData

@Model
class PlantVariety{
    
    var varietyName: String
    var category: String
    var qtty: Int
    var datePlanted: Date
    var numberHarvested = 0
    var lbsHarvested = 0.0
    
    
    init(varietyName: String, category: String, qtty: Int, datePlanted: Date) {
        self.varietyName = varietyName
        self.category = category
        self.qtty = qtty
        self.datePlanted = datePlanted
    }
    
    
    
}


