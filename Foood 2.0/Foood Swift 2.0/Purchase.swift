import SwiftUI
import MapKit

struct Purchase: View {
    @EnvironmentObject var burger_selectedEA: burger_amount
    @EnvironmentObject var pizza_selectedEA: pizza_amount
    @State private var selectedEA = 1
    let EAvalue = [0, 1, 2, 3, 4, 5]
    
    var body: some View {
        
        NavigationStack {
            ZStack (alignment: .bottom) {
                Color.black
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .foregroundStyle(.ultraThinMaterial)
                    .frame(maxWidth: 600, maxHeight: 165)
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .padding(.bottom)
                    .padding(.horizontal)
                
                VStack {
                    ScrollView (.vertical) {
                        HStack {
                            VStack {
                                Text("🍔")
                                    .font(.system(size: 30))
                            }.frame(width: 70, height: 70)
                                .background(.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                                )
                                .padding(.trailing, 16)
                            VStack (alignment: .leading, spacing: 5) {
                                Text("Hamburger")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                                Text("฿\(burger_selectedEA.burger_amount * 45)")
                                    .environmentObject(burger_amount())
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            
                            HStack (alignment: .center, spacing: 10) {
                                Image(systemName: "minus")
                                    .foregroundStyle(.orange).opacity(0.3)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(height: 25)
                                    .onTapGesture {
                                        if burger_selectedEA.burger_amount > 0 {
                                            burger_selectedEA.burger_amount -= 1
                                            burger_selectedEA.objectWillChange.send()
                                        }
                                    }
                                    .gesture(
                                        LongPressGesture(minimumDuration: 1.0)
                                            .onChanged { _ in
                                                if burger_selectedEA.burger_amount > 0 {
                                                    let timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                                                        if burger_selectedEA.burger_amount > 0 {
                                                            burger_selectedEA.burger_amount -= 1
                                                            burger_selectedEA.objectWillChange.send()
                                                        } else {
                                                            timer.invalidate()
                                                        }
                                                    }
                                                    // Store the timer in a variable accessible to onEnded
                                                    RunLoop.current.add(timer, forMode: .common)
                                                }
                                            }
                                            .onEnded { _ in
                                                // Stop the timer when long press ends
                                                // No need to invalidate timer here since it's already invalidated in onChanged when value becomes 0
                                            }
                                    )
                                Text("\(burger_selectedEA.burger_amount)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orange)
                                    .onReceive(burger_selectedEA.objectWillChange) { _ in
                                        print("Object will change")
                                    }
                                
                                Image(systemName: "plus")
                                    .foregroundStyle(.orange).opacity(0.3)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(height: 25)
                                    .onTapGesture {
                                        if burger_selectedEA.burger_amount >= 0 {
                                            burger_selectedEA.burger_amount += 1
                                            burger_selectedEA.objectWillChange.send()
                                        }
                                    }
                                
                                //                            Picker("Select a number", selection: $selectedEA) {
                                //                                ForEach(EAvalue, id: \.self) { value in
                                //                                    Text("\(value)")
                                //                                }
                                //                            }
                                //                            .pickerStyle(MenuPickerStyle())  
                            }.padding(.trailing, 8)
                            
                        }.padding(.all, 20)
                            .background()
                            .clipShape(RoundedRectangle(cornerRadius: 41, style: .continuous))
                            .frame(maxWidth: 600)
                            .padding(.horizontal)
                            .padding(.top, 120)
                        
                        HStack {
                            VStack {
                                Text("🍕")
                                    .font(.system(size: 30))
                            }.frame(width: 70, height: 70)
                                .background(.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                                )
                                .padding(.trailing, 16)
                            VStack (alignment: .leading, spacing: 5) {
                                Text("Pizza")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                                Text("฿\(pizza_selectedEA.pizza_amount * 400)")
                                    .environmentObject(pizza_amount())
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            
                            HStack (alignment: .center, spacing: 10) {
                                Image(systemName: "minus")
                                    .foregroundStyle(.orange).opacity(0.3)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(height: 25)
                                    .onTapGesture {
                                        if pizza_selectedEA.pizza_amount > 0 {
                                            pizza_selectedEA.pizza_amount -= 1
                                            pizza_selectedEA.objectWillChange.send()
                                        }
                                    }
                                    .gesture(
                                        LongPressGesture(minimumDuration: 1.0)
                                            .onChanged { _ in
                                                if pizza_selectedEA.pizza_amount > 0 {
                                                    let timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
                                                        if pizza_selectedEA.pizza_amount > 0 {
                                                            pizza_selectedEA.pizza_amount -= 1
                                                            pizza_selectedEA.objectWillChange.send()
                                                        } else {
                                                            timer.invalidate()
                                                        }
                                                    }
                                                    // Store the timer in a variable accessible to onEnded
                                                    RunLoop.current.add(timer, forMode: .common)
                                                }
                                            }
                                            .onEnded { _ in
                                                // Stop the timer when long press ends
                                                // No need to invalidate timer here since it's already invalidated in onChanged when value becomes 0
                                            }
                                    )
                                Text("\(pizza_selectedEA.pizza_amount)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orange)
                                    .onReceive(pizza_selectedEA.objectWillChange) { _ in
                                        print("Object will change")
                                    }
                                
                                Image(systemName: "plus")
                                    .foregroundStyle(.orange).opacity(0.3)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(height: 25)
                                    .onTapGesture {
                                        if pizza_selectedEA.pizza_amount >= 0 {
                                            pizza_selectedEA.pizza_amount += 1
                                            pizza_selectedEA.objectWillChange.send()
                                        }
                                    }
                                
                                //                            Picker("Select a number", selection: $selectedEA) {
                                //                                ForEach(EAvalue, id: \.self) { value in
                                //                                    Text("\(value)")
                                //                                }
                                //                            }
                                //                            .pickerStyle(MenuPickerStyle())  
                            }.padding(.trailing, 8)
                            
                        }.padding(.all, 20)
                            .background()
                            .clipShape(RoundedRectangle(cornerRadius: 41, style: .continuous))
                            .frame(maxWidth: 600)
                            .padding(.horizontal)
                    }
                    Spacer()
                    
                    HStack {
                        Text("Delivery Location")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.orange)
                    }.padding(.horizontal, 34)
                        .frame(maxWidth: 580)
                        .padding(.bottom)
                    
                    DeliveryLocation()
                        .frame(maxWidth: 600, maxHeight: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(.ultraThinMaterial, lineWidth: 5)
                            .stroke(Color.orange.opacity(0.2), lineWidth: 5)
                        )
                        .padding(.bottom)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Total price")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Text("฿\(burger_selectedEA.burger_amount * 45 + pizza_selectedEA.pizza_amount * 400)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(.orange)
                    }.padding(.horizontal, 34)
                    .frame(maxWidth: 580)
                    .padding(.bottom)
                    
                    NavigationLink(destination: SucceedView()) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.white)
                                .cornerRadius(15)
                                .frame(maxWidth: 540, maxHeight: 52)
                            Image("ApplePay")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 24)
                        }
                    }
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.bottom)
                    .padding(.horizontal,34)
                    
                }
                
            }.ignoresSafeArea()
        }
        .environmentObject(burger_selectedEA)
        .environmentObject(pizza_selectedEA)
        .navigationTitle("Your Order")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    Purchase()
        .environmentObject(burger_amount())
        .environmentObject(pizza_amount())
}
