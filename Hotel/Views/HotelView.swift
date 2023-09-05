import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = ViewModel()
    @State private var indexPicture = 0
    @State var buttonToRoomViewTag: String?
    
    var body: some View {
        NavigationStack {
            List {
                // Отель
                Section {
                    VStack(alignment: .leading) {
                        // Карусель картинок
                        TabView(selection: $indexPicture) {
                            ForEach((0..<(viewModel.hotel?.image_urls.count ?? 1)), id: \.self) { index in
                                AsyncImage(url: URL(string: viewModel.hotel?.image_urls[index] ?? "")){ image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .cornerRadius(20)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .frame(height: 200)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        // Основные данные про отель
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color("lightYellow"))
                            .frame(width: 170, height: 30)
                            .overlay(
                                HStack {
                                    Image("goldStar")
                                        .resizable()
                                        .frame(width: 14, height: 14)
                                    Text(String(viewModel.hotel?.rating ?? 0))
                                        .foregroundColor(.yellow)
                                    Text(viewModel.hotel?.rating_name ?? "")
                                        .foregroundColor(.yellow)
                                }
                            )
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text(viewModel.hotel?.name ?? "")
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 25))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        
                        Button {
                            print("Button clicked")
                        } label: {
                            Text(viewModel.hotel?.adress ?? "")
                                .multilineTextAlignment(.leading)
                                .lineLimit(3)
                                .font(.system(size: 15))
                        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        HStack (alignment: .bottom) {
                            Text("от " + String(viewModel.hotel?.minimal_price ?? 0) + " ₽")
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 30))
                                .bold()
                            
                            Text(viewModel.hotel?.price_for_it.lowercased() ?? "")
                                .lineLimit(1)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 15))
                                .offset(y: -4)
                        }.padding(EdgeInsets(top: 1, leading: 0, bottom: 15, trailing: 0))
                    }
                    .background(Color(.white))
                    .cornerRadius(10)
                }
                
                // Об отеле
                Section {
                    VStack(alignment: .leading) {
                        Text("Об отеле")
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 25))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0))
                        
                        // peculiarities
                        GenerateChips(items: viewModel.hotel?.about_the_hotel.peculiarities ?? [""])
                        
                        // description
                        Text(viewModel.hotel?.about_the_hotel.description ?? "")
                            .lineLimit(10)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 15))
                            .lineSpacing(5)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        
                        // кнопки с данными
                        VStack {
                            ForEach(0...viewModel.hotelButtonsArray.count - 1, id: \.self) { index in
                                HStack {
                                    Image(viewModel.hotelButtonsArray[index].namePic)
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding()
                                    VStack (alignment: .leading) {
                                        Text(viewModel.hotelButtonsArray[index].title)
                                        Text(viewModel.hotelButtonsArray[index].desc)
                                    }
                                    Spacer()
                                    Image("arrowRight")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding()
                                }.frame(height: 60)
                                if index < viewModel.hotelButtonsArray.count - 1{
                                    Divider().padding(EdgeInsets(top: 0, leading: 65, bottom: 0, trailing: 20))
                                }
                            }
                        }
                        .background(Color("backgroundColor"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    }
                    .background(Color(.white))
                    .cornerRadius(10)
                }
            }
            .padding([.horizontal, .top], -17)
            .background(Color("backgroundColor"))
            .onAppear {
                viewModel.getHotel()
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Text("")
                        Spacer()
                        NavigationLink {
                            ListRoomView(nameHotel: viewModel.hotel?.name ?? "")
                        } label: {
                            Text("К выбору номера")
                        }
                        .foregroundColor(.white)
                        .frame(width: 365, height: 45)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                    }
                }
            }
        }
        .environmentObject(viewModel)
        .edgesIgnoringSafeArea(.vertical)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView()
    }
}
