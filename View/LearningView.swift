import SwiftUI


struct LearningView: View {
    @StateObject private var coinMoney = CoinMoney()
    var body: some View {
        VStack {
            NavigationSplitView {
                List {
                    Section(header: Text("Indonesia Money").font(.custom("Quicksand-Bold", size: 30)).foregroundColor(Color(hex: "#23A136"))) {
                    }
                    
                    Section(header: Text("Paper Money").font(.custom("Quicksand-Bold", size: 20)).foregroundColor(Color(hex: "#E98A21"))) {
                        ForEach(coinMoney.coins.prefix(6).reversed()) { coin in 
                            NavigationLink {
                                MoneyDetailView(coin: coin)
                            } label: {
                                Text("Rp. " + coin.rupiah)
                                     .font(.system(size: 25))
                            }
                        }
                    }
                    Section(header: Text("Coin").font(.custom("Quicksand-Bold", size: 20)).foregroundColor(Color(hex: "#E98A21"))) {
                        ForEach(coinMoney.coins.dropFirst(6).reversed()) { coin in 
                            NavigationLink {
                                MoneyDetailView(coin: coin)
                            } label: {
                                Text("Rp. " + coin.rupiah)
                                .font(.system(size: 25))
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle()) 
            } detail: {
                MoneyDetailView(coin:Coin(rupiah: "100000", frontImg: "100000-depan", backImg: "100000-belakang", frontExp: "The front side features the Proclamation Figures of Indonesian Independence, Dr. (H.C.) Ir. Soekarno and Dr. (H.C.) Drs Mohammad Hatta, as the main image. It includes the national emblem of Garuda Pancasila, images of the Indonesian archipelago, the Moon Orchid flower, and several typical Indonesian motifs.", backExp: "The back side showcases the Betawi Mask Dance juxtaposed with the natural beauty of Raja Ampat, combined with the elegance of the Moon Orchid flower known as the Puspa Pesona. The design of the Rp100,000 banknote back side is embellished with typical Indonesian motifs."))
            }
        }
    }
}

struct Learning_Previews:PreviewProvider{
    static var previews: some View{
        LearningView()
    }
}
