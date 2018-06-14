import Foundation

struct GeoResult: Decodable {
    let total: Int
    let cities: [City]
    
    enum CodingKeys : String, CodingKey {
        case total = "totalResultsCount"
        case cities = "geonames"
    }
}
