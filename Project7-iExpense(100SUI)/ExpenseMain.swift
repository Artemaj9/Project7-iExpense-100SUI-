//
//  ExpenseMain.swift
//  Project7-iExpense(100SUI)
//
//  Created by Artem on 05.08.2023.
//

import SwiftUI

//single expense
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

//array of expenses
class Expenses: ObservableObject {
    let color = Color(.green)
    @Published var items = [ExpenseItem] () {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
        init() {
            if let savedItems = UserDefaults.standard.data(forKey: "Items") {
                if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                    items = decodedItems
                    return
                }
            }
            items = []
        }
        
    }

struct ExpenseMain: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: "USD"))
                                        .foregroundColor(item.amount < 10 ? .gray :
                                                            item.amount > 100 ? .green : .purple)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                } header: {
                    Text("Personal")
                }
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: "USD"))
                                        .foregroundColor(item.amount < 10 ? .gray :
                                                            item.amount > 100 ? .green : .purple)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                } header: {
                    Text("Business")
                }
                
            }
            .toolbar{
                Button {
                  showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("iExpense")
            
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ExpenseMain_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseMain()
    }
}
