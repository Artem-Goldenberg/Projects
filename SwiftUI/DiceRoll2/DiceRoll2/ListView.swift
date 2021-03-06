//
//  ListView.swift
//  DiceRoll2
//
//  Created by Artem Goldenberg on 09.02.2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var numbers: Numbers
    
    var body: some View {
        NavigationView {
            List(numbers.array) { item in
                Text("\(item.value)")
            }
            .navigationTitle("Total Rolls: \(numbers.array.count)")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(Numbers())
    }
}
