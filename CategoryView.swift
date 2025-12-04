//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 12/3/25.
//

import SwiftUI

struct CategoryView: View {
    
    var plants: [PlantVariety]
    @State var ind1 = 0
    @State var ind2 = 0
    @State var ind3 = 0
    
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
//                ForEach(0..
//                     
//                }
                
                VStack{
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.green)
                    
                }
                
                
                
            }
            
            
            
        }

    }
}

#Preview {
    CategoryView(plants: [
        PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 3, datePlanted: .distantPast),
        PlantVariety(varietyName: "Big Boy", category: "Tomatoes", qtty: 4, datePlanted: .distantPast),
        PlantVariety(varietyName: "Early Girl", category: "Tomatoes", qtty: 5, datePlanted: .distantPast)

    ])
}
