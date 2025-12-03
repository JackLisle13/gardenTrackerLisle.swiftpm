//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/6/25.
//

import SwiftData
import SwiftUI

struct AddExistingVarietyView: View {

    @Environment(\.modelContext) var context

    @Query var cart: [PlantVariety]

    @State var selected: [PlantVariety] = []

    var body: some View {

        Text("Track Harvest")
            .font(.largeTitle)

        Spacer()

        ScrollView {

            listCategory2(category: "Tomatoes")
                .padding(20)
            listCategory2(category: "Peppers")
                .padding(20)
            listCategory2(category: "Root Vegetables")
                .padding(20)
            listCategory2(category: "Cucumbers")
                .padding(20)
            listCategory2(category: "Leafy Vegetables")
                .padding(20)
//            listCategory2(category: "Herbs")
//                .padding(20)
            listCategory2(category: "Other")
                .padding(20)
        }
        
        NavigationLink {
            TrackView(selected: selected)
        } label: {
            Text("Track Harvest")
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
    func listCategory2(category: String) -> some View {

        VStack {
            Text("\(category)")
                .font(.headline)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 16)
            {

                ForEach(cart) { thing in

                    if thing.category == category {

                        Button {

                            if selected.contains(thing) {
                                selected.removeAll { $0.id == thing.id }//looked up
                            } else {
                                selected.append(thing)

                            }

                        } label: {

                            Text("\(thing.varietyName)")
                                .foregroundStyle(.white)
                                .padding(5)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(
                                            Color(
                                                red: 0.5,
                                                green: 0.7,
                                                blue: 0.45,
                                                opacity: selected.contains(
                                                    thing
                                                ) ? 0.5 : 1.0
                                            )
                                        )
                                )
                        }
                    }

                }

            }
        }  //end listCategory function

    }

}

#Preview {
    AddExistingVarietyView()
}
