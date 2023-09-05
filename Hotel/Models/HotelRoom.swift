import Foundation

struct RoomsArray : Codable {
    let rooms: [HotelRoom]
}

struct HotelRoom : Identifiable, Codable {
    var id : Int
    var name: String
    var price: Int
    var price_per: String
    var peculiarities: [String]
    var image_urls: [String]
}
