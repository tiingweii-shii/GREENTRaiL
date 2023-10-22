//
//  TinyMapSlideUpView.swift
//  GREENTRaiL
//
//  Created by Luke Atkins on 10/21/23.
//

import SwiftUI
import MapKit



extension CLLocationCoordinate2D{
    
    static let trail = CLLocationCoordinate2D(latitude: 38.04771931544412, longitude: -122.66606389871552)
    static let tom = CLLocationCoordinate2D(latitude: 37.9681886024788, longitude: -122.78073370253512)
    static let bob = CLLocationCoordinate2D(latitude: 37.886403993495904, longitude: -122.57268011267833)
    static let rain = CLLocationCoordinate2D(latitude: 37.954654387796396, longitude: -122.14146673004936)
    static let cat = CLLocationCoordinate2D(latitude: 38.12926506556985, longitude: -121.97737553970704)
}

// Create the annotation class
class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image: UIImage?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, image: UIImage?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}

// Create the custom view
struct CustomAnnotationView: View {
    var annotation: CustomAnnotation
    
    var body: some View {
        ZStack {
            Image(uiImage: annotation.image!)
            Text(annotation.title!)
                .font(.headline)
            Text(annotation.subtitle!)
                .font(.subheadline)
        }
    }
}

struct TinyMapSlideUpView: View {
    //    let all_trail: [trails]
    //    init(){
    //        all_trail = get_trail_pointers()
    //    }
    var body: some View {
        Map{
            
            Annotation("do not attempt", coordinate: .rain){
                ZStack{
                    Image("pins")
                }
            }
            Annotation("easy walk", coordinate: .tom){
                ZStack{
                    Image("pins")
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
    TinyMapSlideUpView()
}
