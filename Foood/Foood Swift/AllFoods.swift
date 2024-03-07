import SwiftUI

struct AllFoods: View {
    let columnCount: Int = 2
    let gridSpacing: CGFloat = -16
    let gridSpacinggg: CGFloat = 20
    
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
                        
                        NavigationLink (destination: HamburgerDetails()) {
                            VStack {
                                Text("🍔")
                                    .font(.system(size: 60))
                                Text("฿ 200")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                    .foregroundStyle(.white)
                            }.frame(width: 160, height: 160)
                                .background(.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                                .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                                )
                        }
                        
                        VStack {
                            Text("🍕")
                                .font(.system(size: 60))
                            Text("฿ 400")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        VStack {
                            Text("🌭")
                                .font(.system(size: 60))
                            Text("฿ 80")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        VStack {
                            Text("🥓")
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
                        VStack {
                            Text("🍣")
                                .font(.system(size: 60))
                            Text("฿ 60")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        VStack {
                            Text("🍜")
                                .font(.system(size: 60))
                            Text("฿ 160")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        VStack {
                            Text("🍪")
                                .font(.system(size: 60))
                            Text("฿ 20")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        VStack {
                            Text("🍱")
                                .font(.system(size: 60))
                            Text("฿ 450")
                                .font(.title2)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                        }.frame(width: 160, height: 160)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                        
                    }.padding(.top)
                    
                }
                
            }.navigationTitle("Foood")
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AllFoods()
}
