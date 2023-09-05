import Foundation

class HotelManager {
    
    func getHotel(_ completion:@escaping (Hotel) -> ()) {
        Bundle.main.fetchData(urlHotel, model: Hotel.self) { data in
            completion(data)
            print(data)
            
        } failure: { error in
            print(error)
        }
    }
    
    func getHotelRoom(_ completion:@escaping (RoomsArray) -> ()) {
        Bundle.main.fetchData(urlHotelRoom, model: RoomsArray.self) { data in
            completion(data)
            print(data)
            
        } failure: { error in
            print(error)
        }
    }
    
    func getBooking(_ completion:@escaping (Booking) -> ()) {
        Bundle.main.fetchData(urlBooking, model: Booking.self) { data in
            completion(data)
            print(data)
            
        } failure: { error in
            print(error)
        }
    }
}
