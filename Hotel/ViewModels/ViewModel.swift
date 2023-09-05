import Foundation
import Combine

class ViewModel: ObservableObject {
    
    private let hotelManager = HotelManager()
    
    @Published var hotel: Hotel?
    @Published var hotelRoom: RoomsArray?
    @Published var booking: Booking?
    
    @Published var fullPrice: Int?
    
    @Published var nameFill = false
    @Published var secNameFill = false
    @Published var birthdayFill = false
    @Published var nationFill = false
    @Published var passportFill = false
    @Published var validityPeriodFill = false
    @Published var countTourist = 1
    @Published var tourists = [true]
    @Published var nameTourist = ["Первый", "Второй", "Третий", "Четвертый", "Пятый"
                                  , "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый"]
    
    @Published var hotelButtonsArray = [
        HotelButton(id: 0, namePic: "smileBox", title: "Что включено", desc: "Самое необходимое"),
        HotelButton(id: 1, namePic: "positiveBox", title: "Что включено", desc: "Самое необходимое"),
        HotelButton(id: 2, namePic: "negativeBox", title: "Что не включено", desc: "Самое необходимое"),
    ]
    
    func getHotel(){
        self.hotel = Hotel(
            id: 0,
            name: "",
            adress: "",
            minimal_price: 0,
            price_for_it: "",
            rating: 0,
            rating_name: "",
            image_urls: [""],
            about_the_hotel: about_the_hotel(
                description: "",
                peculiarities: ["","","",""]
            )
        )
        hotelManager.getHotel(){ data in
            DispatchQueue.main.async {
                self.hotel = data
            }
        }
    }
    
    func getHotelRoom(){
        self.hotelRoom = RoomsArray(
            rooms: [
                HotelRoom(
                    id: 0, name: "", price: 0, price_per: "", peculiarities: [""], image_urls: [""]
                )
            ]
        )
        hotelManager.getHotelRoom(){ data in
            DispatchQueue.main.async {
                self.hotelRoom = data
            }
        }
    }
    
    func getBooking(){
        self.booking = Booking(
            id: 0, hotel_name: "", hotel_adress: "", horating: 0, rating_name: "", departure: "", arrival_country: "", tour_date_start: "", tour_date_stop: "", number_of_nights: 0, room: "", nutrition: "", tour_price: 0, fuel_charge: 0, service_charge: 0
        )
        hotelManager.getBooking(){ data in
            DispatchQueue.main.async {
                self.booking = data
                self.fullPrice = self.booking!.service_charge + self.booking!.fuel_charge + self.booking!.tour_price
            }
        }
        
    }
}
