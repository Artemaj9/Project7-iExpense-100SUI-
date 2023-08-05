//
//  ExternlaClass.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI


class Girl: ObservableObject {
    
    @Published var firstName = "Alla"
    var secondName = "Kotova"
}

struct Women: View {
    @ObservedObject var girl = Girl()
    var body: some View {
        Text("Love")
    }
}
