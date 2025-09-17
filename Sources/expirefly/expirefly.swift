import SwiftUI

#if os(Android)
func main() {
    skipRunApp(ContentView())
}
#else
@main
struct ExpireflyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
#endif

struct ContentView: View {
    @State var items: [String] = ["Milk", "Eggs", "Cheese"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Expirefly Template")
                .font(.title)
                .padding()

            if items.isEmpty {
                Text("No items added yet 🪄")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(items.indices, id: \.self) { index in
                            HStack {
                                Text(items[index])
                                Spacer()
                                Text("Expires soon")
                                    .foregroundColor(.red)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            // simple cross-platform delete: tap the item
                            .onTapGesture(count: 2) {
                                deleteItem(at: index)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }

            Button(action: addItem) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Add Item")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.85))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .shadow(radius: 3)
            }
        }
        .padding()
    }

    // Functions
    func addItem() {
        items.append("New Item")
    }

    func deleteItem(at index: Int) {
        items.remove(at: index)
    }
}