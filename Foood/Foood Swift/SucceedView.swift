import SwiftUI

struct SucceedView: View {
    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 190))
                    .foregroundStyle(.orange)
                    .padding(.bottom)
                Text("We have placed your order!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding(.bottom)
                Text("Your food will be cooked with 🧡 and ship 🛵 to your place soon.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 40)
                    .frame(maxWidth: 500)
                
                Spacer()
                
                NavigationLink(destination: AllFoods()) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.orange)
                            .cornerRadius(15)
                            .frame(width: 340, height: 52)
                        Text("Done")
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
    SucceedView()
}
