//
//  OndeleteBootcamp.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI

struct OndeleteBootcamp: View {
    @State private var numbers = [Int] ()
    @State private var  currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct OndeleteBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OndeleteBootcamp()
    }
}
