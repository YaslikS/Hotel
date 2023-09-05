import Foundation

struct Hotel: Codable {
    var id: Int
    var name: String
    var adress: String
    var minimal_price: Int
    var price_for_it: String
    var rating: Int
    var rating_name: String
    var image_urls: [String]
    var about_the_hotel: about_the_hotel
}

struct about_the_hotel: Codable {
    var description: String
    var peculiarities: [String]
}
