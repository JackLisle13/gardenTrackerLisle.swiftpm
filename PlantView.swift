//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/17/25.
//

import SwiftUI


struct PlantView: View {
    
    var plant: PlantVariety
    
    var body: some View {
        
        Text("\(plant.varietyName)")
            .font(.largeTitle)
        
        Spacer()
        
        
        
        
        
    }
}

#Preview {
    PlantView(plant: PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 1, datePlanted: .now))
}
