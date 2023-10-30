import SwiftUI

struct MapHomeView: View {
    var body: some View {
        
            ZStack{
                
                Image("APP BRAND WHITE")
                    .frame(width: 42, height: 35.46667)
                    .offset(CGSize(width:25, height: -270))
                
                Image("background_vector_white")
                    .offset(CGSize(width:0, height: 200))
                
                Image("Vector 12")
                    .offset(CGSize(width:20, height: 153))
                VStack{
                    
                    NavigationLink (destination: TinyMapSlideUpViewRecomended(), label: {
                        Text("Recommend Route")                              .foregroundColor(Color.white)
                            .font(Font.custom("Fredoka-Bold", size: 32))
                            .frame(width: 350, height: 98)
                            .background(Color(red: 1, green: 0.71, blue: 0.07))
                            .cornerRadius(56)
                        })
                  
                    NavigationLink(destination: TinyMapSlideUpView(), label: {
                        Text("Seach Map")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Fredoka-Bold", size: 32))
                            .frame(width: 350, height: 98)
                            .background(Color(red: 0.93, green: 0.6, blue: 0.45))
                            .cornerRadius(56)
                    })
                        
                    
                }
                .offset(CGSize(width:0, height: 200))
              

                VStack{
                    Text("greentr       l ")
                    .font(
                    Font.custom("Fredoka", size: 30)
                    .weight(.semibold)
                    )
                    .foregroundColor(.white)

                    .frame(width: 200, height: 26, alignment: .topLeading)
                    .offset(CGSize(width:0, height: -240))
                    
                    Image("Ellipse 2")
                        .offset(CGSize(width:0, height: -90))

                }
                
            }
            .frame(width: 390, height: 844)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1).opacity(0), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0.27),
                    endPoint: UnitPoint(x: 0.5, y: 0.75)
                )
            )
            
            }
        
}

struct MapHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MapHomeView()
    }
}
