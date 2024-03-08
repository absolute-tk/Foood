import SwiftUI

struct Burger: View {
       
    var body: some View {
        VStack {
            Text("🍔")
                .font(.system(size: 60))
            Text("฿ 45")
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.rounded)
        }.frame(width: 160, height: 160)
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        
            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
            )
    }
}

#Preview {
    Burger()
}
