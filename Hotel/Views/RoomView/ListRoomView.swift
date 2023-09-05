import SwiftUI

struct ListRoomView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var fakeRoom = HotelRoom(id: 0, name: "", price: 0, price_per: "", peculiarities: [""], image_urls: [""])
    var nameHotel: String
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.hotelRoom?.rooms ?? [fakeRoom]) { hotelRoom in
                CellRoomView(hotelRoom: hotelRoom)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            .cornerRadius(10)
        }
        .navigationTitle(nameHotel)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("backgroundColor"))
        .onAppear {
            viewModel.getHotelRoom()
        }
        .environmentObject(viewModel)
    }
}

struct HotelRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ListRoomView(nameHotel: "Самый лучший отель в мире")
            .environmentObject(ViewModel())
    }
}
