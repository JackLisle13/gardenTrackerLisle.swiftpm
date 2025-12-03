import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Environment(\.modelContext) var context
    
    @Query var cart: [PlantVariety]

    //    Order:
    //        Tomatoes
    //        Peppers
    //        Root Vegetables
    //        Leafy Vegetables
    //        Herbs
    //        Other
    

    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                Text("Garden Tracker")
                    .font(.largeTitle)
                
                
                
                Spacer(minLength: 50)
                
                ScrollView{
                        
                        listCategory(category: "Tomatoes")
                            //.padding(20)
                        listCategory(category: "Peppers")
                            //.padding(20)
                        listCategory(category: "Root Vegetables")
                           // .padding(20)
                        listCategory(category: "Cucumbers")
                           // .padding(20)
                        listCategory(category: "Leafy Vegetables")
                          //  .padding(20)
//                        listCategory(category: "Herbs")
//                            .padding(20)
                        listCategory(category: "Other")
                          //  .padding(20)
                }
                
                
                
                
            }//end main v stack
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: PickAddViewView()) {
                        Image(systemName: "plus.circle")
                            .imageScale(.large)
                    }
                }
            }
            
        }//end nav stack
        
        
    }
    
    
    
    
    func listCategory (category: String)->some View{
        
        VStack{
            Text("\(category)")
                .font(.headline)
            
            // \/\/ looked up, makes it so collumns depends on how much is in there, not fixed number
            LazyVGrid(columns:        [GridItem(.adaptive(minimum: 100))], spacing: 16) {
                
                ForEach(cart) {thing in
                    
                    if(thing.category == category){
                        
                        NavigationLink {
                            PlantView(plant: thing)
                        } label: {
                               
                                Text("\(thing.varietyName)")
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color(red: 0.5, green: 0.7, blue: 0.45))
                                    )
                        }
                    }
                    
                }
                
            }
        }
        .padding(20)
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        
    }
    
    
    
    
}

#Preview {
    ContentView()
        .modelContainer(for: PlantVariety.self, inMemory: true)
}
