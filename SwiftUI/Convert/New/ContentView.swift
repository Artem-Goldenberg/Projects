//
//  ContentView.swift
//  New
//
//  Created by Artem Goldenberg on 24.11.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    private let types = ["mm", "cm", "m", "km", "mi", "ft", "in", "yd"]
    private let convert = [0.001, 0.01, 1, 1000, 1609.344, 0.3048, 0.0254, 0.9144]
    
    @State private var input = ""
    @State private var iUnit = 2
    @State private var oUnit = 2
    
    private var answer: Double {
        let meters = (Double(input) ?? 0)*convert[iUnit]
        return meters/convert[oUnit]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter value", text: $input).keyboardType(.decimalPad)
                    Picker("unit", selection: $iUnit){
                        ForEach(0..<types.count){ Text("\(self.types[$0])") }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("Converted value: \(answer, specifier: "%.4f")")
                    Picker("unit",selection: $oUnit){
                        ForEach(0..<types.count) { Text("\(self.types[$0])") }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
