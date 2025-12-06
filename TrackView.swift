//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/20/25.
//

import SwiftUI
import SwiftData

struct TrackView: View {
    
    @State var errorOn = false
    var selected: [PlantVariety]
    @State var qttyBindings = [""]
    @State var lbsBindings = [""]
    @Environment(\.modelContext) var context
    
    init(selected: [PlantVariety]) {
            self.selected = selected
            _qttyBindings = State(initialValue: Array(repeating: "", count: selected.count))
            _lbsBindings = State(initialValue: Array(repeating: "", count: selected.count))
        } //I got this on Chat, it makes empty arrays when the view is created
    
    
    
    var body: some View {
        
        
        VStack{
            
            ForEach(0..<selected.count, id: \.self){i in
                
                
                TrackViewPiece(qttyTemp: $qttyBindings[i], pounds: $lbsBindings[i], plantVarietyName: selected[i].varietyName)
                
                
            }
            
            Button {
                
                for i in 0 ..< selected.count {
                    if let amt = Int(qttyBindings[i]){
                        if amt > 0{
                            selected[i].numberHarvested += amt
                            if let pounds = Double(lbsBindings[i]){
                                
                                if selected[i].dateOfFirstHarvest != nil{
                                    selected[i].dateOfFirstHarvest = .now
                                }
                                if pounds > 0{
                                    selected[i].lbsHarvested += pounds
                                    selected[i].numWLbs += 1
                                }
                            }
                            try? context.save()
                        }
                            else{
                                errorOn = true
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
        .alert("Please Enter Valid Inputs", isPresented: $errorOn) {
        }
        
        
    }
    
}

#Preview {
    TrackView(selected: [PlantVariety(varietyName: "Better Boy", category: "Tomatoes", qtty: 2, datePlanted: .now)])
}
