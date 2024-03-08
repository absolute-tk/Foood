import SwiftUI
import Drops

struct HamburgerDetails: View {
    @EnvironmentObject var burger_selectedEA: burger_amount
    
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
    
    var body: some View {
        ZStack {
            Color(.black)
            ScrollView(.vertical){
                VStack {
                    
                    VStack {
                        Text("🍔")
                            .font(.system(size: 190))
                    }.frame(width: 350, height: 350)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    
                        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                        )
                        .padding(.top, 80)
                    
                    Text("Hamburger")
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.bottom)
                    
                    Text("Indulge in the timeless perfection of our Classic Cheeseburger Combo! Sink your teeth into a juicy beef patty, nestled between soft, toasted sesame seed buns, layered with melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles. Accompanied by a generous serving of golden, crispy fries and a refreshing fountain drink of your choice, this combo is a feast for all your senses. Whether you’re craving a quick bite or a hearty meal, our Classic Cheeseburger Combo is sure to satisfy your hunger and leave you craving for more. Order now and treat yourself to a classic American favorite, delivered straight to your doorstep!")
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

                        Text("Add to cart    +฿45")
                            .font(.system(size: 18)).fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .onTapGesture {
                        Drops.show(🍔drop)
                        burger_selectedEA.burger_amount += 1
                        burger_selectedEA.objectWillChange.send()
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
    HamburgerDetails()
        .environmentObject(burger_amount())
        .environmentObject(pizza_amount())
}
