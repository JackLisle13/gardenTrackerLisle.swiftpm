//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/6/25.
//

import SwiftUI

struct PickAddViewView: View {

    @State var goToNewVarietyView = false
    @State var goToExistingVarietyView = false

    var body: some View {

        NavigationStack {

            Button {

                goToExistingVarietyView = true

            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            Color(red: 0.7, green: 0.8, blue: 0.5, opacity: 1.0)
                        )
                    Text("Record Harvest")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }

            Button {

                goToNewVarietyView = true

            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 1.0)
                        )
                    Text("Add Plant")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }

        }  //endnavstack
        .navigationDestination(isPresented: $goToNewVarietyView) {
            AddNewVarietyView()
        }
        .navigationDestination(isPresented: $goToExistingVarietyView) {
            AddExistingVarietyView()
        }

    }
}

#Preview {
    PickAddViewView()
}
