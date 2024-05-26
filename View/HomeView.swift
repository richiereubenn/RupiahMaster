import SwiftUI

struct HomeView: View {
    @State var onNavToLearnView = false
    @State var onNavToPlayView = false
    var body: some View {
            VStack {
                    Text("RupiahMa$ter")
                        .font(.system(size: 200))
                        .foregroundColor(Color(hex: "#23A136"))
                        .fontWeight(.bold)
                        .padding(.top, 100)
                    
                    Text("Learning about Indonesian money and practicing counting money")
                        .font(.custom("Quicksand-Bold", size: 50))
                        .foregroundColor(Color(hex: "#703F12"))
                        .padding(.top, -100)
                    
                    Spacer()
                    
                    HStack(spacing: 60) {
                        Button(action: {
                            self.onNavToLearnView = true
                        }) {
                            VStack {
                                Image(systemName: "book.fill")
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 4)
                                Text("Learn")
                                    .font(.custom("Quicksand-Regular", size: 25))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: 150, maxHeight: 150)
                            .padding([.horizontal, .vertical], 20)
                            .background(Color(hex: "#23A136"))
                            .cornerRadius(30)
                            .fullScreenCover(isPresented: $onNavToLearnView, content: {
                                LearningView()
                            })
                        }
                        Button(action: {
                            self.onNavToPlayView = true
                        }) {
                            VStack {
                                Image(systemName: "play.fill")
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 4)
                                Text("Play")
                                    .font(.custom("Quicksand-Regular", size: 25))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: 150, maxHeight: 150)
                            .padding([.horizontal, .vertical], 20)
                            .background(Color(hex: "#23A136"))
                            .cornerRadius(30)
                            .fullScreenCover(isPresented: $onNavToPlayView, content: {
                                PlayView()
                            })
                        }
                    }
                    .padding(.bottom, 50)
                    
                    Image("Group 2")
                        .resizable()
                        .frame(height: UIScreen.main.bounds.height / 2)
                        .padding(0)
            }
            .background(Color(hex: "#EEECE8"))
            
    }
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct HomeView_Previews:PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
