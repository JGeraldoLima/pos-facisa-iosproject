import Foundation

struct City : Decodable {
    var name : String
    var population : Int
    var lat: String
    var lng: String
    
    enum CodingKeys : String, CodingKey {
        case name
        case population
        case lat
        case lng
    }
}
