//
//  Listing.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
   // let description: String
    let ownerImageUrl: String
    let numberOfBedRooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageUrls: [String]
    let address: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingTypes
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    case selfCheckIn
    case superHost
    
    var imageName: String{
        switch self{
        case.selfCheckIn: return "doo.left.hand.open"
        case.superHost: return "medal"
        }
    }
    
    var title: String{
        switch self{
        case.selfCheckIn: return "Self check-in"
        case.superHost: return "Superhost"
        }
    }
    
    var subtitle: String{
        switch self{
        case.selfCheckIn: return "Check yourself with the keypad."
        case.superHost: return "Superhost are exprienced, highly rated hosts who are commited to providing greate stars guests."
        }
    }
    
    var id: Int { return self.rawValue}
}
enum ListingAmenities: Int, Codable, Identifiable, Hashable{
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String{
        switch self{
        case.pool: return "Pool"
        case.kitchen: return "Kitchen"
        case.wifi: return "Wifi"
        case.laundry: return "Laundry"
        case.tv: return "TV"
        case.alarmSystem: return "Alarm System"
        case.office: return "Office"
        case.balcony: return "Balcony"
        }
    }
    
    var imageName: String{
        switch self{
        case.pool: return "figure.pool.swim"
        case.kitchen: return "fork.knife"
        case.wifi: return "wifi"
        case.laundry: return "washer"
        case.tv: return "tv"
        case.alarmSystem: return "shield.checkered"
        case.office: return "pencil.and.ruler.fill"
        case.balcony: return "building"
        }
    }
    
    var id: Int { return self.rawValue}

}



enum ListingTypes: Int, Codable, Identifiable, Hashable{
    case apartment
    case house
    case townHouse
    case villa
    
    var descriptiom: String{
        switch self{
        case.apartment: return "Apartment"
        case.house: return "House"
        case.townHouse: return "Town House"
        case.villa: return "Villa"
        }
    }
    var id: Int{return self.rawValue}
}
