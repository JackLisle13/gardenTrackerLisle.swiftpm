//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/20/25.
//

import SwiftUI

struct TrackView: View {
    
    var selected: [PlantVariety]
    @State var qttyBindings = [""]
    @State var lbsBindings = [""]
    
    init(selected: [PlantVariety]) {
            self.selected = selected
            _qttyBindings = State(initialValue: Array(repeating: "", count: selected.count))
            _lbsBindings = State(initialValue: Array(repeating: "", count: selected.count))
        }
    
    
    
    var body: some View {
        
        
        VStack{
            
            ForEach(0..<selected.count, id: \.self){i in
                
                
                TrackViewPiece(qttyTemp: $qttyBindings[i], pounds: $lbsBindings[i], plantVarietyName: selected[i].varietyName)
                
                
            }
            
            Button {
                
                for i in 0 ..< selected.count {
                    if let amt = Int(qttyBindings[i]){
                        if let pounds = Double(lbsBindings[i]){
                            
                            selected[i].qtty += amt
                            selected[i].lbsHarvested += pounds
                            
                        }
                    }
                   // selected[i].qtty =
                    
                }
                
            } label: {
                Text("Submit")
                    .padding(20)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 1)
                            .fill(
                                Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 1)
                            )
                    )
            }
        
        
            
            
        }
        
        
    }
    
}

#Preview {
    TrackView(selected: [PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 2, datePlanted: .now)])
}
