//
//  ContentView.swift
//  LernMultiptication
//
//  Created by Artem Goldenberg on 15.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameState = 0
    @State private var number = 10
    @State private var numberOfQuestionsIndex = 0
    @State private var answer = ""
    @State private var correct = 0
    @State private var currentQuestionNumber = 0
    @State private var a = 1
    @State private var b = 1
    
    @State private var variants_a = [1]
    @State private var variants_b = [1]
    @State private var numberOfQuestions = ["5","10","15","20","all"]
    
    var questions: Int {
        if numberOfQuestionsIndex != 4 {
            return Int(numberOfQuestions[numberOfQuestionsIndex])!
        }
        return 0
    }
   
    var body: some View {
        Group {
            VStack(spacing: 20) {
                if gameState == 0 {
                    Section(header: Text("Select the table").font(.headline)) {
                        Stepper(value: $number, in: 2...12, step: 1) {
                            Text("\(number)")
                        }
                    }
                    Section(header: Text("How manu questions do you want?").font(.headline)) {
                        Picker("select", selection: $numberOfQuestionsIndex) {
                            ForEach(0..<5) {
                                Text("\(self.numberOfQuestions[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Button(action: game) {
                        Text("Start the game!")
    //                        .font(.title).bold().foregroundColor(.white)
    //                        .padding().background(Color.red).clipShape(Capsule())
                    }
                } else if gameState == 1 {
                    Section(header: Text("What is \(a) * \(b)")) {
                        TextField("type here", text: $answer, onCommit: next).keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                } else {
                    Text("This is the end of the game, your score is \(correct)")
                    Button(action: playAgain) {
                        Text("Play again")
                    }
                }
                Spacer()
            }
        }
    }
    func game() {
        gameState = 1
        variants_a.removeAll()
        variants_b.removeAll()
        if numberOfQuestionsIndex == 4 {
            for i in 2...number {
                for j in i...number {
                    variants_a.append(i)
                    variants_b.append(j)
                }
            }
        } else {
            for _ in 1...Int(numberOfQuestions[numberOfQuestionsIndex])! {
                variants_a.append(Int.random(in: 2...number))
                variants_b.append(Int.random(in: 2...number))
            }
        }
        a = variants_a[0]
        b = variants_b[0]
    }
    func next() {
        if Int(answer) ?? 0 == a*b {
            correct += 1
        }
        answer = ""
        currentQuestionNumber += 1
        if currentQuestionNumber >= variants_a.count {
            endGame()
        } else {
            a = variants_a[currentQuestionNumber]
            b = variants_b[currentQuestionNumber]
        }
    }
    func endGame() {
        gameState = 2
    }
    func playAgain() {
        gameState = 0
        correct = 0
        currentQuestionNumber = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
