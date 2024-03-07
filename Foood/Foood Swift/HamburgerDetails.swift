import SwiftUI

struct HamburgerDetails: View {
    var body: some View {
        ZStack {
            Color(.black)
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
                
                Spacer()
                
                NavigationLink(destination: Purchase()) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.orange)
                            .cornerRadius(15)
                            .frame(width: 340, height: 52)
                        Text("฿200")
                            .font(.system(size: 18)).fontWeight(.semibold)
                            .foregroundStyle(.white)
                    } 
                }
                .padding(.bottom)
                .padding(.bottom)
                
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    HamburgerDetails()
}
