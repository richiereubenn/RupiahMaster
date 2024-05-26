
import SwiftUI

struct GameView: View {
    @Binding var level1: Bool
    @Binding var level2: Bool
    @Binding var level3: Bool
    @Binding var difficulty: Bool
    @State var money: [String] = ["100000-depan", "50000-depan", "20000-depan", "10000-depan", "5000-depan", "2000-depan", "1000-depan", "500-depan", "200-depan", "100-depan", "50-depan"]
    @State var moneyQuestion = 0
    @State var totalMoney = 0
    @State var displayMoney: [String] = []
    @State var check = false
    @State var hint = false
    @State var userAnswer: String = ""
    @State var showAlert = false
    @State var alertMessage = ""
    @State var score = 0
    @State var roundsCompleted = 0
    @State var showAlertWithScore = false
    @State var showPlayView = false
    @State var showGameView = false
    @State var hardQuestion = ""
    @State var showLevel = ""
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                VStack{
                    Text("Tap the money!")
                        .font(.system(size: 30))
                        .fontWeight(.regular)
                        .foregroundColor(Color(hex: "#703F12"))
                    ForEach(money.prefix(6), id: \.self) { item in
                        HStack {
                            if hint {
                                Button(action: {
                                    if let intValue = getIntValue(from: item) {
                                        totalMoney += intValue
                                        displayMoney.append(item)
                                    }
                                }) {
                                    Image(item)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 120)
                                        .padding(.bottom, 5)
                                        .padding(.trailing, 5)
                                    if let intValue = getIntValue(from: item) {
                                        Text("Rp. \(intValue)")
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color(hex: "#703F12"))
                                            .padding(.vertical, 20)
                                            .padding(.horizontal, 10)
                                            .background(Color.yellow)
                                            .cornerRadius(10)
                                    }
                                }
                            } else {
                                Button(action: {
                                    if let intValue = getIntValue(from: item) {
                                        displayMoney.append(item)
                                        totalMoney += intValue
                                    }
                                }){
                                    Image(item)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 140)
                                        .padding(.bottom, 5)
                                        .padding(.trailing, 5)
                                } 
                            }
                        }
                    }
                    
                    HStack{
                        ForEach(money.prefix(9).suffix(from:6), id: \.self) { item in
                            VStack {
                                if hint {
                                    Button(action: {
                                        if let intValue = getIntValue(from: item) {
                                            totalMoney += intValue
                                        }
                                    }) {
                                        VStack{
                                            Image(item)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 120)
                                                .padding(.bottom, 5)
                                                .padding(.trailing, 5)
                                            if let intValue = getIntValue(from: item) {
                                                Text("Rp. \(intValue)")
                                                    .font(.system(size: 30))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(Color(hex: "#703F12"))
                                                    .padding(.vertical, 20)
                                                    .padding(.horizontal, 10)
                                                    .background(Color.yellow)
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                } else {
                                    Button(action: {
                                        if let intValue = getIntValue(from: item) {
                                            totalMoney += intValue
                                        }
                                    }){
                                        Image(item)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 140)
                                            .padding(.bottom, 5)
                                            .padding(.trailing, 5)
                                    } 
                                }
                            }
                        }
                    }
                    HStack{
                        ForEach(money.prefix(11).suffix(from:9), id: \.self) { item in
                            VStack {
                                if hint {
                                    Button(action: {
                                        if let intValue = getIntValue(from: item) {
                                            totalMoney += intValue
                                        }
                                    }) {
                                        VStack{
                                            Image(item)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 120)
                                                .padding(.bottom, 5)
                                                .padding(.trailing, 5)
                                            if let intValue = getIntValue(from: item) {
                                                Text("Rp. \(intValue)")
                                                    .font(.system(size: 30))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(Color(hex: "#703F12"))
                                                    .padding(.vertical, 20)
                                                    .padding(.horizontal, 10)
                                                    .background(Color.yellow)
                                                    .cornerRadius(10)
                                            }
                                        }
                                    }
                                } else {
                                    Button(action: {
                                        if let intValue = getIntValue(from: item) {
                                            totalMoney += intValue
                                        }
                                    }){
                                        Image(item)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 140)
                                            .padding(.bottom, 5)
                                            .padding(.trailing, 5)
                                    } 
                                }
                            }
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: geometry.size.width / 4)
                .background(Color(hex: "#EEECE8"))
                VStack {
                    
                    
                    HStack {
                        VStack{
                            Text("Challenge :")
                                .font(.system(size: 40))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#703F12"))
                            if difficulty{
                                Text(hardQuestion)
                                    .font(.system(size: 40, weight: .regular, design: .default)) // Font semibold
                                    .foregroundColor(.white) // Warna teks putih
                                    .font(.custom("Quicksand", size: 40))
                                    .padding(.all, 40)
                                    .background(Color(hex: "#FF9D30"))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .frame(maxWidth: 1100)
                            }else{
                                Text("Give money in the amount of Rp. \(moneyQuestion)")
                                    .font(.system(size: 60, weight: .regular, design: .default)) // Font semibold
                                    .foregroundColor(.white) // Warna teks putih
                                    .font(.custom("Quicksand", size: 60))
                                    .padding(.all, 40)
                                    .background(Color(hex: "#FF9D30"))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .frame(maxWidth: 1100)
                            }
                        }
                        VStack {
                            Text("\(showLevel)")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#703F12"))
                            Text("\(roundsCompleted)/5")
                                .font(.system(size: 80, weight: .regular, design: .default)) // Font semibold
                                .foregroundColor(.white) // Warna teks putih
                                .font(.custom("Quicksand", size: 40))
                                .padding(.all, 40)
                                .background(Color(hex: "#43AD52"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text(difficulty ? "Hard" : "Easy")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#703F12"))
                        }
                        .padding(.leading, 40)
                        
                        VStack {
                            Text("Score")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#703F12"))
                            Text("\(score)")
                                .font(.system(size: 80, weight: .regular, design: .default)) // Font semibold
                                .foregroundColor(.white) // Warna teks putih
                                .font(.custom("Quicksand", size: 40))
                                .padding(.all, 40)
                                .background(Color(hex: "#43AD52"))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Text("jkjk")
                                .font(.system(size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#EEECE8"))
                        }
                        .padding(.leading, 40)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 50)
                    
                    
                    VStack {
                        HStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "#98CC9D"))
                                .frame(maxWidth: 1600, maxHeight: 650)
                                .overlay(
                                    VStack {
                                        Text("Rp. \(totalMoney)")
                                            .font(.system(size: 200))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color(hex: "#703F12"))
                                            .padding(.vertical, 20)
                                            .padding(.horizontal, 10)
                                            .background(Color.yellow)
                                            .cornerRadius(10)
                                    }
                                )
                            Spacer()
                        }
                    }
                    
                    
                    HStack{
                        Button(action: checkAnswer) {
                            HStack {
                                Text("Check")
                                    .font(.custom("Quicksand-Regular", size: 60))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: 300, maxHeight: 80)
                            .padding([.horizontal, .vertical], 20)
                            .background(Color(hex: "#23A136"))
                            .cornerRadius(30)
                        }
                        .padding(.horizontal, 30)
                        Button(action: resetTotalMoney) {
                            HStack {
                                Text("Reset")
                                    .font(.custom("Quicksand-Regular", size: 60))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: 300, maxHeight: 80)
                            .padding([.horizontal, .vertical], 20)
                            .background(Color(hex: "#23A136"))
                            .cornerRadius(30)
                        }
                        .padding(.trailing,450)
                        VStack{
                            Text("HINT")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hex: "#703F12"))
                                .fontWeight(.bold)
                                .padding(.bottom,30)
                            HStack{
                                Text("Off")
                                    .font(.custom("Quicksand-Bold", size: 40))
                                    .foregroundColor(Color(hex: "#703F12"))
                                    .fontWeight(.semibold)
                                Toggle("", isOn: $hint)
                                    .toggleStyle(RedToggleStyle())
                                    .padding(.horizontal,150)
                                Text("On")
                                    .font(.custom("Quicksand-Bold", size: 40))
                                    .foregroundColor(Color(hex: "#703F12"))
                                    .fontWeight(.semibold)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top,30)
                    .padding(.horizontal,50)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(width: geometry.size.width / 3 * 4)
                .background(Color(hex: "#EEECE8"))
            }
            .edgesIgnoringSafeArea(.all)
        }
        .alert(isPresented: $showAlert) {
            if roundsCompleted == 5 {
                let predicate: String
                if score == 100 {
                    predicate = "Excellent!"
                } else if score >= 60 {
                    predicate = "Good Job!"
                } else {
                    predicate = "Nice Try!"
                }
                
                return Alert(
                    title: Text("\(predicate)"),
                    message: Text("Your Score : \(score)"),
                    primaryButton: .default(Text("Play Again")) {
                        showGameView = true
                    },
                    secondaryButton: .default(Text("Back to Home")) {
                        showPlayView = true
                    }
                )
            }else{
                return Alert(title: Text("Result"), message: Text(alertMessage), dismissButton: .default(Text("Next Challenge")))
            }
            
        }
        .fullScreenCover(isPresented: $showPlayView) {
            HomeView()
        }
        .fullScreenCover(isPresented: $showGameView) {
            GameView(level1: $level1, level2: $level2, level3: $level3, difficulty: $difficulty)
        }
        .onAppear{
            generateRandomQuestion()
        }
        
    }
    
    func generateRandomQuestion() {
        if difficulty {
            var maxRange = 0
            let items1 = ["carrot", "broccoli", "cucumber", "spinach", "lettuce", "tomato", "potato", "beans", "onion", "garlic"]
            let items2 = ["beef", "chicken", "pork", "lamb", "duck", "turkey", "fish", "scallop", "shrimp", "salmon"]
            let objects = ["Anne", "Michelle", "Derend", "Richie", "Dave", "Mark", "Jason", "Jacob", "Sam", "Jessica"]
            var object = ""
            var item1 = ""
            var item2 = ""
            switch true {
            case level1:
                maxRange = 5
                showLevel = "Level 1"
            case level2:
                maxRange = 50
                showLevel = "Level 2"
            case level3:
                maxRange = 5000
                showLevel = "Level 3"
            default:
                moneyQuestion = 1000
                hardQuestion = "Abu membeli apel, manga, dan jeruk. Berapa yang harus dibayarkan oleh ibu?"
                return
            }
            
            let randomIndex1 = Int.random(in: 0..<items1.count)
            item1 = items1[randomIndex1]
            let randomIndex2 = Int.random(in: 0..<items2.count)
            item2 = items2[randomIndex2]
            let randomObject = Int.random(in: 0..<objects.count)
            object = objects[randomObject]
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let value1 = Int.random(in: 1...maxRange) * 100
            let value2 = Int.random(in: 1...maxRange) * 100
            
            let formattedValue1 = formatter.string(from: NSNumber(value: value1)) ?? "\(value1)"
            let formattedValue2 = formatter.string(from: NSNumber(value: value2)) ?? "\(value2)"
            
            moneyQuestion = value1 + value2
            hardQuestion = "\(object) bought some \(item1) for Rp. \(formattedValue1), and some \(item2) for Rp. \(formattedValue2). How many rupiah does \(object) have to pay?"
            

        } else {
            let maxRange: ClosedRange<Int>
            
            switch true {
            case level1:
                maxRange = 1...10
                showLevel = "Level 1"
            case level2:
                maxRange = 10...100
                showLevel = "Level 2"
            case level3:
                maxRange = 100...10000
                showLevel = "Level 3"
            default:
                moneyQuestion = 1000
                return
            }
            
            let randomValue = Int.random(in: maxRange) * 100
            moneyQuestion = randomValue
        }
    }

    
    func checkAnswer() {
        let userValue = totalMoney
        let correctValue = Int(moneyQuestion) ?? 0
        
        if userValue == correctValue {
            alertMessage = "Great, your answer is correct!"
            score += 20
        } else if userValue > correctValue  {
            alertMessage = "Unfortunately, your answers are too much."
        } else if userValue < correctValue  {
            alertMessage = "Unfortunately, your answer is too few."
        }
        roundsCompleted += 1
        showAlert = true
        generateRandomQuestion()
        resetTotalMoney()
        if roundsCompleted == 5 {
            showAlertWithScore = true
        }
    }
    
    func resetTotalMoney(){
        totalMoney = 0
    }
    
}

func getIntValue(from string: String) -> Int? {
    let intValueString = string.replacingOccurrences(of: "-depan", with: "")
    return Int(intValueString)
}
