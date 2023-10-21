import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
            
            Image("APP BRAND WHITE")
                .frame(width: 42, height: 35.46667)
                .offset(CGSize(width:25, height: -270))
            
            Image("Vector 3")
                .offset(CGSize(width:0, height: 200))
            
            Image("Vector 12")
                .offset(CGSize(width:20, height: 103))
            
            VStack{
                Text("greentr       l ")
                .font(
                Font.custom("Fredoka", size: 30)
                .weight(.semibold)
                )
                .foregroundColor(.white)

                .frame(width: 200, height: 26, alignment: .topLeading)
                .offset(CGSize(width:0, height: -103))
                
                Image("Ellipse 2")
                
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 390, height: 125)
                        .background(Color(red: 0.13, green: 0.32, blue: 0.41))
                        .cornerRadius(33)
                 
                    VStack(){
                        HStack(spacing: 40){
                            Button {
                                    
                            } label: {
                                Image("Vector 11")

                            }
                            Button {
                                    
                            } label: {
                                Image("Vector 2")

                            }
                            Button {
                                    
                            } label: {
                                Image("profileicon")

                            }
                        }
                        
                        HStack(spacing: 50){
                            Text("activity")
                            Text("map")
                            Text("profile")
                        }
                        .font(Font.custom("Fredoka", size: 20)
                        .weight(.bold))
                        .foregroundColor(.white)
                    }
                }
                .padding([.top], 400)
            }
            .offset(CGSize(width: 0, height: 125))
           
            
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
        
        

            
            
            //.padding([.top], 720)
   
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
