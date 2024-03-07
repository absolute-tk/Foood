import SwiftUI
import MapKit

struct Purchase: View {
    
    @State private var selectedEA = 1
    let EAvalue = [1, 2, 3, 4, 5]
    
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
                    
                    HStack {
                        VStack {
                            Text("🍔")
                                .font(.system(size: 60))
                        }.frame(width: 100, height: 100)
                            .background(.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .stroke(Color.orange.opacity(0.2), lineWidth: 2)
                            )
                            .padding(.trailing, 16)
                        VStack (alignment: .leading) {
                            Text("Hamburger")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.primary)
                            Text("฿\(selectedEA*200)")
                                .font(.title3)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        
                        VStack {
                            Picker("Select a number", selection: $selectedEA) {
                                ForEach(EAvalue, id: \.self) { value in
                                    Text("\(value)")
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                    }.padding(.all, 20)
                     .background()
                     .clipShape(RoundedRectangle(cornerRadius: 45, style: .continuous))
                     .frame(maxWidth: 600)
                     .padding(.horizontal)
                     .padding(.top, 120)
                    
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
                        .frame(maxWidth: 600, maxHeight: 350)
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
                        Text("฿\(selectedEA*200)")
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
        .navigationTitle("Your Order")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

#Preview {
    Purchase()
}
