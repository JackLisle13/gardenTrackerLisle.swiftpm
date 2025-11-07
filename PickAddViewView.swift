//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/6/25.
//

import SwiftUI

struct PickAddViewView: View {
    
    
    var body: some View {
        
        Button {
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.7, green: 0.8, blue: 0.5, opacity: 1.0))
                Text("Add Plant of Existing Variety")
                    .font(.title)
                    .foregroundStyle(.white)
            }
        }
        
        Button {
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 1.0))
                Text("Add Plant of New Variety")
                    .font(.title)
                    .foregroundStyle(.white)
            }
        }

        
        
        


    }
}

#Preview {
    PickAddViewView()
}
