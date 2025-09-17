import SwiftUI

@main
struct ExpireflyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var items: [String] = ["Milk", "Eggs", "Cheese"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) { // added spacing for cleaner layout
                if items.isEmpty {
                    Text("No items added yet 🪄")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(items, id: \.self) { item in
                            HStack {
                                Text(item)
                                Spacer()
                                Text("Expires soon")
                                    .foregroundColor(.red)
                                    .font(.caption)
                            }
                        }
                        .onDelete(perform: deleteItem)
                    }
                    .listStyle(.insetGrouped) // nicer list style
                }
                
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus.circle.fill") // adds icon
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .shadow(radius: 3)
                }
            }
            .navigationTitle("Expirefly Template")
        }
    }
    
    // Functions
    func addItem() {
        items.append("New Item")
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}