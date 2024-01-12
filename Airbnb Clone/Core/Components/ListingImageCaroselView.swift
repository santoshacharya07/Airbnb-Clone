//
//  ListingImageCaroselView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ListingImageCaroselView: View {
    let listing: Listing
    var body: some View {
        TabView{
            ForEach(listing.imageUrls, id:\.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }

        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCaroselView(listing: DeveloperPreview.shared.listings[0])
}
