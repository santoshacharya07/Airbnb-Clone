//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing:8){
            //images
            ListingImageCaroselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //Listing Details
            HStack(alignment:.top){
                //details
                VStack(alignment: .leading) {
                    Text("\(listing.address), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 km Away")
                        .foregroundStyle(.gray)
                    Text("Nov 3-2022")
                        .foregroundStyle(.gray)
                    HStack(spacing:4){
                        Text("Rs.\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
             .foregroundStyle(.black)
                }
                Spacer()
                //rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
