//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/17/25.
//

import SwiftUI
import SwiftData


struct PlantView: View {
    
    var plant: PlantVariety
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Query var cart: [PlantVariety]

    
    var body: some View {
        
            VStack{
                
                Text("")
                
                Text("\(plant.varietyName)")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(40)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 1))
                
                Spacer()
                
                VStack{
                    Text("Information:")
                        .font(.headline)
                        .padding(10)
                    Text("Quantity of Plants: \(plant.qtty)")
                    if let day = plant.dateOfFirstHarvest{
                        Text("Days to Maturity: \(day.timeIntervalSince(plant.datePlanted))")
                    }
                    Text("Total Produce Harvested: \(plant.numberHarvested)")
                    if plant.numWLbs > 0{
                        Text("Average Weight: \(plant.lbsHarvested/Double(plant.numWLbs))")
                    }
                }
                .padding(40)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(red: 0.95, green: 0.95, blue: 0.95))
                    
                )
                .padding(.bottom, 40)
                
                
                Button{
                    plant.qtty += 1
                    if plant.qtty > 0{
                        context.insert(plant)
                    }
                }label:{
                    Text("Increase Quantity")
                        .padding(20)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(
                                    Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 1)
                                )
                        )
                }
                .padding(.bottom)
                
                
                
                HStack{
                    Button{
                        if (plant.qtty == 0){
                            context.delete(plant)
                            dismiss()
                        }
                        else{
                            plant.qtty -= 1
                        }
                        try? context.save()
                    }label:{
                        Text("Decrease Quantity")
                            .padding(20)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(
                                        Color(red: 0.8, green: 0.6, blue: 0.5, opacity: 1)
                                    )
                            )
                    }
                    
                    
                    Button{
                        context.delete(plant)
                        try? context.save()
                        dismiss()
                    }label:{
                        Text("Remove Variety")
                            .padding(20)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(
                                        Color(red: 0.8, green: 0.6, blue: 0.5, opacity: 1)
                                    )
                            )
                    }
                }
                
                Spacer()
                
            }//end main v stack
            
        
            
    }
    

}

#Preview {
    PlantView(plant: PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 1, datePlanted: .now))
}
