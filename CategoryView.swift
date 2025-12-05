//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 12/3/25.
//

import SwiftUI

struct CategoryView: View {
    
    var plants: [PlantVariety]
    var multiplier: CGFloat {
        let maxQtty = plants.map { $0.qtty }.max() ?? 1
        return 200 / CGFloat(maxQtty)     // tallest bar = 200px tall
    }//looked up
    
    var body: some View {
        
        VStack{
            
            Text("Comparing \(plants[0].category)")
                .font(.largeTitle)
                .padding(30)
            
            
            VStack{
                Text("Varieties:")
                    .font(.headline)
                    .padding(.bottom, 10)
                ForEach(plants) {thing in
                    Text("\(thing.varietyName)")
                }
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(
                        Color(
                            red: 0.95,
                            green: 0.95,
                            blue: 0.95
                        )
                    )
            )
            Spacer()
            
            
            Text("Top Varieties (by quantity produced):")
                .font(.headline)
                HStack{
                    
                    VStack{
                        
                        Rectangle()
                            .frame(width: 100, height: CGFloat(plants[topVarieties(place: 1)].qtty) * multiplier
                            )
                            .foregroundColor(Color.green)
                        Text("\(plants[topVarieties(place:1)].varietyName)")
                        Text("Qtty: \(plants[topVarieties(place:1)].qtty)")
                    }
                    
                    
                    if(topVarieties(place: 2) != -1){
                        VStack{
                            
                            Rectangle()
                                .frame(width: 100, height: CGFloat(plants[topVarieties(place: 2)].qtty) * multiplier
                                )
                                .foregroundColor(Color.green)
                            Text("\(plants[topVarieties(place:2)].varietyName)")
                            Text("Qtty: \(plants[topVarieties(place:2)].qtty)")
                        }
                        
                    }
                    
                    if(topVarieties(place: 3) != -1 && plants.count >= 3){
                        VStack{
                            
                            Rectangle()
                                .frame(width: 100, height: CGFloat(plants[topVarieties(place: 3)].qtty) * multiplier
                                )
                                .foregroundColor(Color.green)
                            Text("\(plants[topVarieties(place:3)].varietyName)")
                            Text("Qtty: \(plants[topVarieties(place:3)].qtty)")
                        }
                        
                    }
                    
                    
                    
                }
            
            
            
        }

    }
    
    func topVarieties(place: Int) -> Int {
        var ind1 = 0
        var ind2 = 0
        var ind3 = 0
        for i in 1 ..< plants.count{
            if plants[i].qtty > plants[ind1].qtty{
                ind3 = ind2
                ind2 = ind1
                ind1 = i
                
            }
        }
        if(place == 1){
            return ind1
        }
        if(place == 2 && ind2 != ind1){
            return ind2
        }
        if(place == 3 && ind2 != ind3){
            return ind3
        }
        
        return -1
    }
    
    
}

#Preview {
    CategoryView(plants: [
        PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 3, datePlanted: .distantPast),
        PlantVariety(varietyName: "Big Boy", category: "Tomatoes", qtty: 4, datePlanted: .distantPast),
        PlantVariety(varietyName: "Early Girl", category: "Tomatoes", qtty: 5, datePlanted: .distantPast)

    ])
}
