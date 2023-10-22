import SwiftUI

struct TrailInfoView: View {
    var body: some View {
        
        ZStack{
            
            Image("APP BRAND WHITE")
                .frame(width: 42, height: 35.46667)
                .offset(CGSize(width:25, height: -270))
            
            Image("Vector 3")
                .offset(CGSize(width:0, height: 200))
            
            Image("Vector 12")
                .offset(CGSize(width:20, height: 153))
            ZStack{
                
                Rectangle()
                .foregroundColor(.clear)
                .frame(width: 390, height: 364)
                .background(Color(red: 1, green: 0.71, blue: 0.07))

                .cornerRadius(33)
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Text("Route: ")
                        .font(
                        Font.custom("Fredoka", size: 32)
                        .weight(.bold)
                        )
                        .foregroundColor(.white)
                        
                        Text("Royal Arch Trail")
                        .font(
                        Font.custom("Fredoka", size: 32)
                        .weight(.medium)
                        )
                        .foregroundColor(.white)
                    }
                    
                    HStack{
                        Text("difficulty: ")
                        .font(Font.custom("Fredoka", size: 20))
                        .foregroundColor(.white)
                        Text("hard")
                          .font(
                            Font.custom("Fredoka", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.74, green: 0.39, blue: 0.22))
                    }
                    HStack{
                        Text("time: ")
                        .font(Font.custom("Fredoka", size: 20))
                        .foregroundColor(.white)
                        
                        Text("3:20:01")
                          .font(
                            Font.custom("Fredoka", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.13, green: 0.32, blue: 0.41))
                    }
                    Text("Recommendations: ")
                      .font(
                        Font.custom("Fredoka", size: 32)
                          .weight(.bold)
                      )
                      .foregroundColor(.white)
                    
                    HStack{
                        Text("trail average heart rate:")
                          .font(Font.custom("Fredoka", size: 20))
                          .foregroundColor(.white)
                        Text("90 BPM")
                          .font(
                            Font.custom("Fredoka", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.13, green: 0.32, blue: 0.41))
                    }
                    
                    HStack{
                        Text("your average heart rate:")
                          .font(Font.custom("Fredoka", size: 20))
                          .foregroundColor(.white)
                        Text("100 BPM")
                          .font(
                            Font.custom("Fredoka", size: 20)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.74, green: 0.39, blue: 0.22))
                    }
                }
                
            }
            .offset(CGSize(width:0, height: 140))
          

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

struct TrailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TrailInfoView()
    }
}
