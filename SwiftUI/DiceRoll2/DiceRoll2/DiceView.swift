//
//  DiceView.swift
//  DiceRoll2
//
//  Created by Artem Goldenberg on 09.02.2021.
//

import SwiftUI

struct DiceView: View {
    @EnvironmentObject var numbers: Numbers
    
    @State private var textRange = "6"
    @State private var amount = 0
    @State private var rolledNumbers = [Int]()
    
    var range: Int {
        Int(textRange) ?? 2
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Number of sides", text: $textRange).keyboardType(.numberPad)
                    Picker("How many dice", selection: $amount) {
                        ForEach(1..<11) {
                            Text("\($0) dice")
                        }
                    }
                    
                }
                .frame(maxHeight: 130)
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<10) { number in
                        ZStack {
                            Rectangle()
                                .strokeBorder(Color.black, lineWidth: 3)
                                .background(Rectangle().fill(Color.white))
                                .frame(width: 200, height: 200)
                            
                            Text("\(rolledNumbers.count > 0 && number <= amount ? rolledNumbers[number] : 4)")
                                .font(.system(size: 200))
                                .fontWeight(.thin)
                                .scaledToFill()
                        }
                        .foregroundColor(number > amount ? Color.gray : Color.primary)
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: roll) {
                Text("Roll Dice")
                    .bold()
            })
            .navigationTitle("Roll!")
        }
    }
    
    func roll() {
        print(amount)
        rolledNumbers = Array(repeating: 4, count: amount + 1)
        var sum = 0
        
        for i in 0..<amount + 1 {
            rolledNumbers[i] = Int.random(in: 1...range)
            sum += rolledNumbers[i]
        }
        
        numbers.add(value: sum)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
