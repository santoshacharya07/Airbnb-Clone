//
//  ListingImageCaroselView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ListingImageCaroselView: View {
    var images=[
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4",]
    var body: some View {
        TabView{
            ForEach(images, id:\.self){image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }

        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCaroselView()
}
