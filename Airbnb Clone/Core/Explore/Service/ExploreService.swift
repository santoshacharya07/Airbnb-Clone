//
//  ExploreService.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

class ExploreService{
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
