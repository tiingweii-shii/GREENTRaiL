//
//  TinyMapSlideUpView.swift
//  GREENTRaiL
//
//  Created by Luke Atkins on 10/21/23.
//

import SwiftUI
import MapKit



extension CLLocationCoordinate2D{
    static let trail = CLLocationCoordinate2D(latitude: 10.00000, longitude: 245.00000)
    static let tom = CLLocationCoordinate2D(latitude: 82.00000, longitude: 31.00000)
    static let bob = CLLocationCoordinate2D(latitude: 92.00000, longitude: -1.00000)
    static let rain = CLLocationCoordinate2D(latitude: -42.00000, longitude: 71.00000)
    static let cat = CLLocationCoordinate2D(latitude: 48.00000, longitude: -100.00000)
}

//func get_trail_pointers() -> [trails]{
//    var all_trails: [trails] = []
//    getTrails() { trails in
//        for trail in trails {
//            all_trails.append(trail)
//        }
//    }
//    return all_trails
//}

struct TinyMapSlideUpView: View {
    //    let all_trail: [trails]
    //    init(){
    //        all_trail = get_trail_pointers()
    //    }
    var body: some View {
        Map{
            Marker("hard trail", coordinate: .bob)
            Marker("easy trail", coordinate: .trail)
            Marker("medium trail", coordinate: .rain)
            Marker("do not attempt trail", coordinate: .cat)
            Marker("wild trail", coordinate: .tom)
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
    TinyMapSlideUpView()
}
