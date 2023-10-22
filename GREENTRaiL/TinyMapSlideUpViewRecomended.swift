//
//  TinyMapSlideUpView.swift
//  GREENTRaiL
//
//  Created by Luke Atkins on 10/21/23.
//

import SwiftUI
import MapKit








struct TinyMapSlideUpViewRecomended: View {
    //    let all_trail: [trails]
    //    init(){
    //        all_trail = get_trail_pointers()
    //    }
    var body: some View {
        Map{
            
            Annotation("do not attempt", coordinate: .rain){
                ZStack{
                    Image("pins_green")
                }
            }
            Annotation("easy walk", coordinate: .tom){
                ZStack{
                    Image("pins_green")
                }
            }
            Annotation("tough trail", coordinate: .cat){
                ZStack{
                    Image("pins")
                }
            }
            Annotation("just right", coordinate: .bob){
                ZStack{
                    Image("pins")
                }
            }
            Annotation("too eas trail", coordinate: .trail){
                ZStack{
                    Image("pins")
                }
            }
        }
        
        // take in the locatoins of all of the hiking trails
        // have custom annotations to go allong with them
        // place them all on the map
        // center them inside the bar
        
    }
    /*struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }*/
}

#Preview {
    TinyMapSlideUpViewRecomended()
}
