//
//  ContentView.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI

class User2: ObservableObject {
   @Published var firstName = "Andy"
   @Published var secondName = "Dandy"
}


struct User {
    var firstName = "Bilbo"
    var secondName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    @StateObject var user2 = User2()
  //  @StateObject var girl = Girl()
    
    var body: some View {
        VStack {
      
            Text("Your name is: \(user.firstName) \(user.secondName)")
                .font(.title2)
            
            TextField("First name", text: $user.firstName)
                .padding()
                .background(.gray)
            TextField("Second name", text: $user.secondName)
                .padding()
                .background(.gray)
                .padding(.bottom, 50)
            
            Text("Your name is: \(user2.firstName) \(user2.secondName)")
                .font(.title2)
            
            TextField("First name", text: $user2.firstName)
                .padding()
                .background(.gray)
            TextField("Second name", text: $user2.secondName)
                .padding()
                .background(.gray)
                .padding(.bottom, 50)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}
