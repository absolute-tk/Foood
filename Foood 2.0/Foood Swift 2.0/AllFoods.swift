import SwiftUI
import Drops

struct AllFoods: View {
    @EnvironmentObject var burger_selectedEA: burger_amount
    @EnvironmentObject var pizza_selectedEA: pizza_amount
    let columnCount: Int = 2
    let gridSpacing: CGFloat = -16
    let gridSpacinggg: CGFloat = 20
    
    let 🍔drop = Drop(
        title: "Added to Cart",
        subtitle: "+฿45 🍔",
        icon: UIImage(systemName: "cart.fill"),
        action: .init {
            print("Drop tapped")
            Drops.hideCurrent()
        },
        position: .top,
        duration: 2.0,
        accessibility: "Alert: Title, Subtitle"
    )
    
    let 🍕drop = Drop(
        title: "Added to Cart",
        subtitle: "+฿400 🍕",
        icon: UIImage(systemName: "cart.fill"),
        action: .init {
            print("Drop tapped")
            Drops.hideCurrent()
        },
        position: .top,
        duration: 2.0,
        accessibility: "Alert: Title, Subtitle"
    )
    
    init() {
        // Large Navigation Title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        // Inline Navigation Title
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    
                    LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 160), spacing: gridSpacing), count: columnCount), spacing: gridSpacinggg){
                        
                        Burger()
                            .environmentObject(burger_selectedEA)
                            .onTapGesture {
                                Drops.show(🍔drop)
                                burger_selectedEA.burger_amount += 1
                                burger_selectedEA.objectWillChange.send()
                            }
                            .contextMenu {
                                NavigationLink(destination: HamburgerDetails()) {
                                    Label("View Details", systemImage: "info.circle")
                                }
                            }
                        
                        
                        Pizza()
                            .environmentObject(pizza_selectedEA)
                            .onTapGesture {
                                Drops.show(🍕drop)
                                pizza_selectedEA.pizza_amount += 1
                                pizza_selectedEA.objectWillChange.send()
                            }
                            .contextMenu {
                                NavigationLink(destination: PizzaDetails()) {
                                    Label("View Details", systemImage: "info.circle")
                                }
                            }
                        
                        Hotdog()
                        
                        Bacon()
                        
                        Sushi()
                        
                        Ramen()
                        
                        Cookie()
                        
                        Bento()
                        
                    }.padding(.top)
                    
                }.environmentObject(burger_selectedEA)
                .environmentObject(pizza_selectedEA)
                //
                VStack {
                    Spacer()
                    HStack {
                        Text("🍔 : \(burger_selectedEA.burger_amount )").padding(.trailing, 30)
                        Text("🍕 : \(pizza_selectedEA.pizza_amount )")  
                    }
                    NavigationLink(destination : Purchase()) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.orange)
                                .cornerRadius(15)
                                .frame(width: 340, height: 52)
                            
                            Text("Checkout")
                                .font(.system(size: 18)).fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding(16)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .padding(.bottom)
                }
                
            }.navigationTitle("Foood")
        }.navigationBarBackButtonHidden(true)
        
    }

}

#Preview {
    AllFoods()
        .environmentObject(burger_amount())
        .environmentObject(pizza_amount())
}
