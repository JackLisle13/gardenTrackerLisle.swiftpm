import SwiftUI

struct ContentView: View {
    
    @State var plants: [[PlantVariety]] = []
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                Text("Garden Tracker")
                    .font(.largeTitle)
                
                
                
                Spacer()
                
                List{ //maybe a list of categories, and then the categories are lists of plants? or just loop through and put pictures
                    
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
}
