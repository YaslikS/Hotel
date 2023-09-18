import SwiftUI

struct CellRoomView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var indexPicture = 0
    let hotelRoom: HotelRoom
    
    var body: some View {
        VStack(alignment: .leading) {
            // Карусель картинок
            TabView(selection: $indexPicture) {
                ForEach((0..<(hotelRoom.image_urls.count)), id: \.self) { index in
                    AsyncImage(url: URL(string: hotelRoom.image_urls[index])){ image in
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
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            Text(hotelRoom.name)
                .lineLimit(3)
                .foregroundColor(Color("blackWhiteText"))
                .multilineTextAlignment(.leading)
                .font(.system(size: 25))
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            // peculiarities
            GenerateChips(items: hotelRoom.peculiarities)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            RoundedRectangle(cornerRadius: 5)
                .fill(Color("lightBlue"))
                .frame(width: 220, height: 30)
                .overlay(
                    HStack {
                        Text("Подробнее о номере")
                            .foregroundColor(.blue)
                        Image("arrowBlue")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                )
                .padding(EdgeInsets(top: 1, leading: 10, bottom: 0, trailing: 0))
            
            HStack (alignment: .bottom) {
                Text("от " + String(hotelRoom.price) + " ₽")
                    .lineLimit(3)
                    .foregroundColor(Color("blackWhiteText"))
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 30))
                    .bold()
                Text(hotelRoom.price_per.lowercased())
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 15))
                    .offset(y: -4)
            }.padding(EdgeInsets(top: 1, leading: 10, bottom: 15, trailing: 10))
            
            HStack{
                Spacer()
                NavigationLink {
                    BookingView()
                } label: {
                    Text("Выбрать номер")
                }
                .foregroundColor(.white)
                .frame(width: 365, height: 45)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
        .background(Color("blackWhite"))
        .cornerRadius(10)
    }
}

struct CellRoomView_Previews: PreviewProvider {
    static var previews: some View {
        CellRoomView(hotelRoom: HotelRoom(id: 0, name: "", price: 0, price_per: "", peculiarities: [""], image_urls: [""]))
            .environmentObject(ViewModel())
    }
}
