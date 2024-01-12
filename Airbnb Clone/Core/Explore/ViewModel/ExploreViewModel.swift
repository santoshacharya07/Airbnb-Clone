//
//  ExploreViewModel.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    private let service: ExploreService
    
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService){
        self.service = service
        
        Task{
            await ferchListing()
        }
    }
    
    func ferchListing()async{
        do{
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        }catch{
            print("DEGUG: Failed to fetch listing with error:\(error.localizedDescription)")
        }
    }
    func updateListingForLocation(){
        let filteredListings = listings.filter({
            $0.address.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
