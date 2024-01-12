//
//  ListingDetailView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) 
    var dismiss
    let listing: Listing
    
    var body: some View {
        ScrollView{
            ZStack(alignment:.topLeading) {
                
                ListingImageCaroselView(listing: listing)
                    .frame(height: 320)

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }

            }
            
            VStack(alignment:.leading, spacing: 8)
            {
                Text("\(listing.title)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment:.leading){
                    HStack(spacing:2){
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        Text(" - ")
                        Text("30 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    .foregroundStyle(.black)
                    Text("\(listing.address), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            Divider()
            
            //host info view
            HStack{
                VStack(alignment:.leading,spacing: 4){
                    Text("Entire \(listing.type.descriptiom) in Nepal hosted by \(listing.ownerName)")
                        .font(.headline)
                     .frame(width: 250, alignment: .leading)
                    HStack(spacing:2){
                        Text("\(listing.numberOfGuests) guest - ")
                        Text("\(listing.numberOfBedRooms) beadrooms - ")
                        Text("\(listing.numberOfBeds) beds - ")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300,alignment: .leading)
               Spacer()
                Image("\(listing.ownerImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            Divider()
            
            //listing features
            VStack(alignment:.leading,spacing: 16){
                ForEach(listing.features){feature in
                    HStack(spacing:12){
                        Image(systemName: feature.imageName)
                        VStack(alignment:.leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                }
            }
            .padding()
            
            Divider()
            
            //bedroom view
            VStack(alignment:.leading,spacing:16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:16){
                        ForEach(1 ... listing.numberOfBedRooms, id: \.self){ bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Beedroom \(bedroom)")
                            }
                            .frame(width: 132,height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            Divider()
            
            //listing amenities
            VStack(alignment:.leading,spacing:16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(listing.amenities){amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            Divider()
            VStack(alignment:.leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map().frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom,64)
        .overlay(alignment:.bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack{
                        Text("Rs. \(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Dec-23-23")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    Button{}label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal,32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView( listing: DeveloperPreview.shared.listings[3])
}
