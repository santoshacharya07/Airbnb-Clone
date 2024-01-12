//
//  ExploreViewModel.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 12/01/2024.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        Task{
            await ferchListing()
        }
    }
    
    func ferchListing()async{
        do{
            self.listings = try await service.fetchListings()
        }catch{
            print("DEGUG: Failed to fetch listing with error:\(error.localizedDescription)")
        }
    }
}
