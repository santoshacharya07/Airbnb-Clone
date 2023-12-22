//
//  ListingDetailView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ListingDetailView: View {
    var images=[
    "listing-1",
    "listing-2",
    "listing-3",
    "listing-4",]
    var body: some View {
        ScrollView{
            ListingImageCaroselView()
                .frame(height: 320)
            
            VStack(alignment:.leading, spacing: 8)
            {
                Text("Soaltee Hotel")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                
                VStack(alignment:.leading){
                    HStack(spacing:2){
                        Image(systemName: "star.fill")
                        Text("4.56")
                        Text(" - ")
                        Text("30 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    
                    .foregroundStyle(.black)
                    Text("Kathmandu, Bagmati")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            
            Divider()
            
            //host info view
            HStack{
                VStack(alignment:.leading,spacing: 4){
                    Text("One of the best Hotel in Nepal")
                        .font(.headline)
                     .frame(width: 250, alignment: .leading)
                    HStack(spacing:2){
                        Text("4 guest - ")
                        Text("4 beadrooms - ")
                        Text("4 beds - ")
                        Text("4 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300,alignment: .leading)
                Spacer()
                Image("soltihotel-profile-photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            Divider()
            
            //listing features
            VStack(alignment:.leading,spacing: 16){
                ForEach(0 ..< 2){feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        VStack(alignment:.leading){
                            Text("Best Hotel")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("A landmark in the city of Kathmandu with a rich heritage, the hotel is the proud recipient of several prestigious awards and accolades over the years.")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    Spacer()
                    
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ListingDetailView()
}
