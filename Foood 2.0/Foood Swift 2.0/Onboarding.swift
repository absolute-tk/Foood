import SwiftUI

struct Onboarding: View {
    @State private var isShowing = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    VStack (alignment: .leading) {
                        
                        Image("Foood").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                        Text("Welcome to")
                            .font(.system(size: 48)).fontWeight(.heavy)
                            .foregroundStyle(.white)
                        //                    .border(.red)
                        Text("Foood")
                            .font(.system(size: 48)).fontWeight(.heavy)
                            .foregroundStyle(.orange)
                            .padding(.bottom)
                        //                    .border(.red)
                            .padding(.bottom, 20)
                        
                        VStack (alignment: .leading) {
                            
                                HStack {
                                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                        .padding(.trailing, 10)
                                    VStack (alignment: .leading, spacing: -5) {
                                        Text("Order")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.primary)
                                        Text("Pizza, Hamburger & etc")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }.padding(.bottom, 10)
                                .opacity(isShowing ? 1 : 0)
                                .animation(.easeInOut(duration: 1.6).delay(0.8), value: isShowing)
                                
                                HStack {
                                    Image(systemName: "banknote.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                        .padding(.trailing, 10)
                                    VStack (alignment: .leading, spacing: -5) {
                                        Text("Pay")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.primary)
                                        Text("Apple Pay Supported")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }.padding(.bottom, 10)
                                .opacity(isShowing ? 1 : 0)
                                .animation(.easeInOut(duration: 1.6).delay(1.2), value: isShowing)
                                
                                HStack {
                                    Image(systemName: "truck.box.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(.accentColor)
                                        .padding(.trailing, 5)
                                    VStack (alignment: .leading, spacing: -5) {
                                        Text("Ship")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.primary)
                                        Text("Delivery to your place")
                                            .font(.subheadline)
                                            .foregroundStyle(.secondary)
                                    }
                                }.padding(.bottom, 10)
                                .opacity(isShowing ? 1 : 0)
                                .animation(.easeInOut(duration: 1.6).delay(1.6), value: isShowing)
                            
                        }
                        .frame(height: isShowing ? 200 : 0)
                        .animation(Animation.snappy(duration: 5), value: isShowing)
                        
                    }
                    .frame(width: 300, alignment: .leading)
//                                        .border(.blue)
                    .animation(Animation.snappy(duration: 2), value: isShowing)
                    
                    Spacer()
                    
                    NavigationLink(destination: AllFoods()) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.orange)
                                .cornerRadius(15)
                                .frame(width: 340, height: 52)
                            Text("Continue")
                                .font(.system(size: 18)).fontWeight(.semibold)
                                .foregroundStyle(.white)
                        } 
                    }
                    .padding(.bottom)
                    .padding(.bottom)
                    
                }
                
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                self.isShowing.toggle()
            }
        }
    }
}

#Preview {
    Onboarding()
}
