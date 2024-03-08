import SwiftUI

class burger_amount: ObservableObject {
    @Published var burger_amount = 0
}
class pizza_amount: ObservableObject {
    @Published var pizza_amount = 0
}

@main
struct MyApp: App {
    @State private var isAnimated = false
    @StateObject var burger_selectedEA = burger_amount()
    @StateObject var pizza_selectedEA = pizza_amount()
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black
                Onboarding()
                    .frame(width: .infinity, height: .infinity)
                    .scaleEffect(isAnimated ? 1 : 0.5)
                    .animation(Animation.snappy(duration: 3), value: isAnimated)
                    .opacity(isAnimated ? 1 : 0)
                    .animation(Animation.snappy(duration: 3), value: isAnimated)
                    .blur(radius: isAnimated ? 0 : 60)
                    .animation(Animation.snappy(duration: 3), value: isAnimated)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            self.isAnimated.toggle()
                        }
                    }
            }.ignoresSafeArea()
                .environmentObject(burger_selectedEA)
                .environmentObject(pizza_selectedEA)
        }
    }
}

