//
//  UserDefaultsBootcamp.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI

struct UserDefaultsBootcamp: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1

            //Save tapCount to the UserDefaults
        }
    }
}

struct UserDefaultsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsBootcamp()
    }
}
