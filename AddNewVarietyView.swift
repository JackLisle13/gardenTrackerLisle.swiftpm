//
//  SwiftUIView.swift
//  gardenTrackerLisle
//
//  Created by JACKSON LISLE on 11/6/25.
//

import SwiftUI
import SwiftData

struct AddNewVarietyView: View {

    @State var qtty = 0
    @State var selected = ""
    @State var selectedVariety = ""
    @State var showThing = false
    @State var date = Date()
    
    @State var errorOn = false
    
   // @Environment(\.dismiss) var dismiss //looked up
    
    @Environment(\.modelContext) var context
    
    @Query var cart: [PlantVariety]


    var body: some View {
        
        VStack{
            
            Text("Add Variety")
                .font(.largeTitle)
            
            //Spacer()
            
            //maybe add view of existing plants here? or if that doesnt work an image of a garden
            
            VStack {
                
                //menu hstack
                HStack {
                    Text("Category:  ")
                        .dynamicTypeSize(.xLarge)
                    Menu {
                        
                        Button("Other") {
                            selected = "Other"
                            selectedVariety = ""
                        }
//                        Button("Herbs") {
//                            selected = "Herbs"
//                            selectedVariety = ""
//                        }
                        Button("Leafy Vegetables") {
                            selected = "Leafy Vegetables"
                            selectedVariety = ""
                        }
                        Button("Root Vegetables") {
                            selected = "Root Vegetables"
                            selectedVariety = ""
                        }
                        Button("Cucumbers") {
                            selected = "Cucumbers"
                            selectedVariety = ""
                        }
                        Button("Peppers") {
                            selected = "Peppers"
                            selectedVariety = ""
                        }
                        Button("Tomatoes") {
                            selected = "Tomatoes"
                            selectedVariety = ""
                        }
                        
                    } label: {
                        Label(selected, systemImage: "chevron.down")
                            .padding()
                            .background()
                            .foregroundStyle(.green)
                            .cornerRadius(8)
                    }
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(
                    Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 0.5)
                )  //End Menu for category
                
                HStack {
                    Text("Variety:  ")
                        .dynamicTypeSize(.xLarge)
                    Menu {
                        checkCategory(selected: selected)
                    } label: {
                        Label(selectedVariety, systemImage: "chevron.down")
                            .padding()
                            .background()
                            .foregroundStyle(.green)
                            .cornerRadius(8)
                    }
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(
                    Color(red: 0.6, green: 0.8, blue: 0.7, opacity: 0.5)
                )
                
            }
            .padding(.horizontal, 20)
            
            if showThing == true {
                TextField("Custom Variety Name", text: $selectedVariety)
                    .textFieldStyle(.roundedBorder)
                    .padding(20)
            }
            
            HStack {
                Spacer(minLength: 60)
                DatePicker(
                    "Date Planted",
                    selection: $date,
                    displayedComponents: [.date]
                )
                Spacer(minLength: 60)
            }
            .padding(20)
            
            HStack {
                Spacer(minLength: 80)
                Stepper("Quantity:  \(qtty)", value: $qtty, in: 0...1000)
                    .dynamicTypeSize(.xLarge)
                Spacer(minLength: 80)
            }  //Stepper h stack
            .padding(.bottom, 20)
            
            //add plant button
            Button {
                
                if cart.contains(where: { $0.varietyName == selectedVariety }) { //autocompleted, not sure yet what the $0 does
                    qtty += 1
                }
                else{
                    if ((selected != "") && (selectedVariety != "") && (qtty != 0)){
                        
                        print("Inserting")
                        
                        context.insert(
                            PlantVariety(varietyName: selectedVariety, category: selected, qtty: qtty, datePlanted: date)
                        )
                        do{
                            try context.save()
                            print("saved")
                            print(cart.count)
                        }catch{
                            print("did not save")
                        }
                        
                    }
                    else{
                        errorOn = true
                    }
                }
                
            } label: {
                Text("Add Plant")
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
        .alert("Please Fill Out All Information", isPresented: $errorOn) {
        }
        
    }

    @ViewBuilder  //looked up
    func checkCategory(selected: String) -> some View {
        switch selected {

        case "Tomatoes":
            VStack {
                Button("Other") {
                    selectedVariety = ""
                    showThing = true
                }
                Button("Beefsteak") {
                    selectedVariety = "Beefsteak"
                    showThing = false
                }
                Button("Early Girl") {
                    selectedVariety = "Early Girl"
                    showThing = false
                }
                Button("Roma") {
                    selectedVariety = "Big Boy"
                    showThing = false
                }
                Button("Better Boy") {
                    selectedVariety = "Better Boy"
                    showThing = false
                }
            }

        case "Peppers":
            VStack {
                Button("Other") {
                    selectedVariety = ""
                    showThing = true
                }
                Button("Poblano") {
                    selectedVariety = "Poblano"
                    showThing = false
                }
                Button("Banana Pepper") {
                    selectedVariety = "Banana Pepper"
                    showThing = false
                }
                Button("Bell Pepper") {
                    selectedVariety = "Bell Pepper"
                    showThing = false
                }
                Button("Jalepeno") {
                    selectedVariety = "Jalepeno"
                    showThing = false
                }
            }

        case "Cucumbers":
            VStack {
                Button("Other") {
                    selectedVariety = ""
                    showThing = true
                }
                Button("Pickling") {
                    selectedVariety = "Pickling"
                    showThing = false
                }
                Button("Persian") {
                    selectedVariety = "Persian"
                    showThing = false
                }
                Button("Burpless") {
                    selectedVariety = "Burpless"
                    showThing = false
                }
            }

        case "Root Vegetables":
            VStack {
                Button("Other") {
                    selectedVariety = ""
                    showThing = true
                }
                Button("Potato") {
                    selectedVariety = "Potato"
                    showThing = false
                }
                Button("Radish") {
                    selectedVariety = "Radish"
                    showThing = false
                }
                Button("Carrot") {
                    selectedVariety = "Carrot"
                    showThing = false
                }
            }

        case "Leafy Vegetables":
            VStack {
                Button("Other") {
                    selectedVariety = ""
                    showThing = true
                }
                Button("Spinach") {
                    selectedVariety = "Spinach"
                    showThing = false
                }
                Button("Kale") {
                    selectedVariety = "Kale"
                    showThing = false
                }
                Button("Iceberg Lettuce") {
                    selectedVariety = "Iceberg Lettuce"
                    showThing = false
                }
                Button("Romaine Lettuce") {
                    selectedVariety = "Romaine Lettuce"
                    showThing = false
                }
            }

//        case "Herbs":
//            VStack {
//                Button("Other") {
//                    selectedVariety = ""
//                    showThing = true
//                }
//                Button("Thyme") {
//                    selectedVariety = "Thyme"
//                    showThing = false
//                }
//                Button("Rosemary") {
//                    selectedVariety = "Rosemary"
//                    showThing = false
//                }
//                Button("Dill") {
//                    selectedVariety = "Dill"
//                    showThing = false
//                }
//                Button("Cilantro") {
//                    selectedVariety = "Cilantro"
//                    showThing = false
//                }
//                Button("Basil") {
//                    selectedVariety = "Basil"
//                    showThing = false
//                }
//            }

        default:
            Button("Other") {
                selectedVariety = ""
                showThing = true
            }

        }
    }

}

#Preview {
    AddNewVarietyView()
}
