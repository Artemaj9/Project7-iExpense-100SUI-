//
//  CodableBootcamp.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI


struct Player: Codable {
    let firstName: String
    let lastName: String
}
struct CodableBootcamp: View {
    @State private var player = Player(firstName: "John", lastName: "Mayer")
    
    var body: some View {
        Button("Save player") {
            
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(player) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
