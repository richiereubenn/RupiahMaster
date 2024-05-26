import SwiftUI

struct PlayView: View {
    @State var onNavHomeView = false
    @State var difficulty = false
    @State var level1 = true 
    @State var level2 = false
    @State var level3 = false 
    
    @State private var game = false
    var body: some View {
        VStack {
            Button(action: {
                self.onNavHomeView = true
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .padding(.bottom, 4)
                    Text("Home")
                        .font(.custom("Quicksand-Regular", size: 15))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 70, maxHeight: 70)
                .padding([.horizontal, .vertical], 20)
                .background(Color(hex: "#23A136"))
                .cornerRadius(20)
                .fullScreenCover(isPresented: $onNavHomeView, content: {
                    HomeView()
                })
            }
            .padding(.leading,2000)
            .padding(.top,40)
            Text("Select Your Level and Difficulty!")
                .font(.system(size: 100))
                .foregroundColor(Color(hex: "#23A136"))
                .fontWeight(.bold)
                .padding(.top, -35)
            
            HStack(spacing: 30) {
                VStack{
                    Text("Level 1")
                        .font(.custom("Quicksand-Bold", size: 50))
                        .foregroundColor(Color(hex: "#703F12"))
                        .fontWeight(.semibold)
                    Button(action: {
                        level1 = true
                        if level1 {
                            level2 = false
                            level3 = false
                        }
                    }) {
                        if level1{
                            Image("1000-on 1")
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        } else {
                            Image("1000-off 1") 
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        }
                    }
                }
                
                VStack{
                    Text("Level 2")
                        .font(.custom("Quicksand-Bold", size: 50))
                        .foregroundColor(Color(hex: "#703F12"))
                        .fontWeight(.semibold)
                    Button(action: {
                       level2 = true
                        if level2 {
                            level1 = false
                            level3 = false
                        }
                    }) {
                        if level2 {
                            Image("10000-on 1") 
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        } else {
                            Image("10000-off 1") 
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        }
                    }
                }
                VStack{
                    Text("Level 3")
                        .font(.custom("Quicksand-Bold", size: 50))
                        .foregroundColor(Color(hex: "#703F12"))
                        .fontWeight(.semibold)
                    Button(action: {
                        level3 = true
                        if level3 {
                            level1 = false
                            level2 = false
                        }
                    }) {
                        if level3 {
                            Image("1000000-on 1")
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        } else {
                            Image("1000000-off 1")
                                .resizable()
                                .frame(width: 600, height: 400)
                                .cornerRadius(70)
                        }
                    }
                }
                
            }
            .padding(.top,50)
            .padding(.bottom,50)
            HStack{
                Text("Easy")
                    .font(.custom("Quicksand-Bold", size: 50))
                    .foregroundColor(Color(hex: "#703F12"))
                    .fontWeight(.semibold)
                Toggle("", isOn: $difficulty)
                    .toggleStyle(RedToggleStyle())
                    .padding(.horizontal,150)
                Text("Hard")
                    .font(.custom("Quicksand-Bold", size: 50))
                    .foregroundColor(Color(hex: "#703F12"))
                    .fontWeight(.semibold)
            }
            .padding(.bottom,150)
            
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#703F12"))
            
            Button(action: {
                  game = true
            }) {
                HStack {
                    Image(systemName: "play.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                    Text("Play")
                        .font(.custom("Quicksand-Regular", size: 60))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 300, maxHeight: 80)
                .padding([.horizontal, .vertical], 20)
                .background(Color(hex: "#23A136"))
                .fullScreenCover(isPresented: $game, content: {
                    GameView(level1: $level1, level2: $level2, level3: $level3, difficulty: $difficulty)
                })
                .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
            .background(Color(hex: "#703F12"))
            
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "#703F12"))
        }
        .background(Color(hex: "#EEECE8"))
    }
}


struct RedToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Toggle(configuration)
            .toggleStyle(SwitchToggleStyle())
            .padding()
            .background(Color(hex: "#885F3B"))
            .cornerRadius(8)
            .scaleEffect(2.5)
            .frame(width: 0, height: 100) 
    }
}

struct Play_Previews:PreviewProvider{
    static var previews: some View{
        PlayView()
    }
}
