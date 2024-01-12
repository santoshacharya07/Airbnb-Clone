//
//  Listing.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

struct Listing: Identifiable, Codable{
    let id: String
    let ownerUid: String
    let ownerName: String
    let OwnerImageUrl: String
    let numberOfBedRooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let state: String
    let title: String
    var rating: Double
}
