//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/21/25.
//

import SwiftUI

struct TrackViewPiece: View {
    
    @Binding var qttyTemp: String
    @Binding var pounds: String
    var plantVarietyName: String
    
    var body: some View {

        VStack{
            
            Text(plantVarietyName)
                .font(.headline)
            TextField("Quantity", text: $qttyTemp)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
                .keyboardType(.numberPad)
            TextField("Weight In Pounds (optional)", text: $pounds)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
                .keyboardType(.decimalPad)
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
            Color(red: 0.93, green: 0.99, blue: 0.93)
            )
        )
        
        


    }
}

#Preview {
//    TrackViewPiece(plantVarietyName: "Better Boy", qttyTemp: .constant("hello"), pounds: .constant("five"))
}
