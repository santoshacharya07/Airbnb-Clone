//
//  DeveloperPreview.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

class DeveloperPreview{
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Santosh Acharya",
            OwnerImageUrl: "male-profile-photo",
            numberOfBedRooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 20000,
            latitude: 23.4567,
            longitude: -80.1234,
            imageUrls: ["listing-4" ,"listing-3", "listing-2", "listing-1"],
            address: "Pokhara, Kaski",
            state: "Gandaki",
            title: "Fistail Villa",
            rating: 4.80,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sesh Ghale",
            OwnerImageUrl: "male-profile-photo",
            numberOfBedRooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 20000,
            latitude: 53,
            longitude: -90.1234,
            imageUrls: ["listing-3" ,"listing-1", "listing-2", "listing-4"],
            address: "Lazimpat, Kathmandu",
            state: "Bagmati",
            title: "Seraton",
            rating: 4.80,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .townHouse
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Soltee Hotel",
            OwnerImageUrl: "male-profile-photo",
            numberOfBedRooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 20000,
            latitude: 43.4567,
            longitude: -70.1234,
            imageUrls: ["listing-2" ,"listing-3", "listing-1", "listing-4"],
            address: "Soltimode, Kathmandu",
            state: "Bagmatiki",
            title: "The Soltee Hotel",
            rating: 4.80,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Everest Hotel Group",
            OwnerImageUrl: "male-profile-photo",
            numberOfBedRooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 2,
            pricePerNight: 20000,
            latitude: 80.4567,
            longitude: -15.1234, 
            imageUrls: ["listing-1" ,"listing-3", "listing-2", "listing-4"],
            address: "Baneshower, Kathmandu",
            state: "Bagmatiki",
            title: "The Everest Hotel",
            rating: 4.80,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .townHouse
        ),
    ]
}
