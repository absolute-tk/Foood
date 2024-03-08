import SwiftUI
import Drops

struct PizzaDetails: View {
    @EnvironmentObject var pizza_selectedEA: pizza_amount
    
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
    
    var body: some View {
        ZStack {
            Color(.black)
            ScrollView(.vertical){
                VStack {
                    
                    VStack {
                        Text("🍕")
                            .font(.system(size: 190))
                    }.frame(width: 350, height: 350)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                        )
                        .padding(.top, 80)
                    
                    Text("Pizza")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.bottom)
                    
                    Text("Indulge in a culinary delight with our exquisite pizzas crafted to perfection. Each pizza is a masterpiece of flavor and texture, starting with a hand-tossed crust that is crispy on the outside and light and airy on the inside. Our commitment to quality shines through in every bite, as we use only the finest tomatoes for our robust sauce, topped with a premium blend of mozzarella and parmesan cheeses.")
                        .font(.headline)
                        .fontDesign(.default)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 24)
                        .frame(maxWidth: 600)
                    Rectangle()
                        .frame(height: 200)
                        .opacity(0)
                }
            }
            
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundStyle(.orange)
                        .cornerRadius(15)
                        .frame(width: 340, height: 52)
                    
                    Text("Add to cart    +฿400")
                        .font(.system(size: 18)).fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    Drops.show(🍕drop)
                    pizza_selectedEA.pizza_amount += 1
                    pizza_selectedEA.objectWillChange.send()
                }
                .padding(16)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.bottom)
            }
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    PizzaDetails()
        .environmentObject(burger_amount())
        .environmentObject(pizza_amount())
}
