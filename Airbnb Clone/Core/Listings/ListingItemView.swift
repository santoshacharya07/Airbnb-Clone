//
//  ListingItemView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ListingItemView: View {
    var images=[
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4",]
    var body: some View {
        VStack(spacing:8){
            //images
            ListingImageCaroselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //Listing Details
            HStack(alignment:.top){
                //details
                VStack(alignment:.leading) {
                    Text("Kathmandu, Bagmati")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 km Away")
                        .foregroundStyle(.gray)
                    Text("Nov 3-2022")
                        .foregroundStyle(.gray)
                    HStack(spacing:4){
                        Text("Rs.10000")
                            .fontWeight(.semibold)
                        Text("night")
                    }
             .foregroundStyle(.black)
                }
                Spacer()
                //rating
                HStack(spacing:2){
                    Image(systemName: "star.fill")
                    Text("4.56")
                }
                .foregroundStyle(.black)
               
                
            }
            .font(.footnote)
            
        }
        .padding()

    }
}

#Preview {
    ListingItemView()
}
