import SwiftUI

struct MoneyDetailView: View {
    let coin : Coin
    @State var onNavHomeView = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Money Details")
                    .font(.custom("Quicksand-Bold", size: 50))
                    .foregroundColor(Color(hex: "#23A136"))
                    .padding(.top, 5)
                    .padding(.bottom,45)
                Spacer()
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
            }
            
            HStack {
                VStack{
                    Image(coin.frontImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 350) 
                        .padding(.bottom,25)
                    Text("Front Side")
                        .font(.custom("Quicksand-Bold", size: 30))
                        .foregroundColor(Color(hex: "#703F12"))
                }
                VStack{
                    Image(coin.backImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 350)    
                        .padding(.bottom,25)
                    Text("Back Side")
                        .font(.custom("Quicksand-Bold", size: 30))
                        .foregroundColor(Color(hex: "#703F12"))
                }
            }
            .padding(.bottom,50)
            Divider()
            VStack(alignment: .center){
                Text("History of Rp." + coin.rupiah)
                    .font(.custom("Quicksand-Bold", size: 50))
                    .foregroundColor(Color(hex: "#23A136"))
                    .font(.headline)
                    .padding(.bottom, 5)
                    .padding(.top, 50)
                
                Text("Front Side")
                    .font(.custom("Quicksand-Bold", size: 30))
                    .foregroundColor(Color(hex: "#2D2D2D"))
                    .padding(.top, 25)
                Text(coin.frontExp)
                    .font(.custom("Quicksand-Bold", size: 25))
                    .foregroundColor(Color(hex: "#2D2D2D"))
                    .padding(.top, 5)
                Text("Back Side")
                    .font(.custom("Quicksand-Bold", size: 30))
                    .foregroundColor(Color(hex: "#2D2D2D"))
                    .padding(.top, 25)
                Text(coin.backExp)
                    .font(.custom("Quicksand-Bold", size: 25))
                    .foregroundColor(Color(hex: "#2D2D2D"))
                    .padding(.top, 5)
            }
            VStack(alignment: .leading){
                Spacer()
                Divider()
                Text("Resource : Indonesia, B. (n.d.). History of Indonesian Money. https://www.bi.go.id/id/rupiah/gambar-uang/default.aspx")
                    .font(.custom("Quicksand-Bold", size: 20))
                    .foregroundColor(Color(hex: "#2D2D2D"))
                    .padding(.vertical, 10)
            }
            Spacer() 
        }
        .padding(.horizontal, 50)
        .background(Color(hex: "#EEECE8"))
    }
}


struct MoneyDetail_Previews:PreviewProvider{
    static var previews: some View{
        MoneyDetailView(coin: Coin(rupiah: "50", frontImg: "50-depan", backImg: "50-belakang", frontExp: "hlo", backExp: "kjahsdlkjf"))
    }
}
