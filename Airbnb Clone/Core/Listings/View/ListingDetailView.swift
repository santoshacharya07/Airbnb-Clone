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
    
    var body: some View {
        ScrollView{
            ZStack(alignment:.topLeading) {
                
                ListingImageCaroselView()
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
                    
                }
            }
            .padding()
            
            Divider()
            
            //bedroom view
            VStack(alignment:.leading,spacing:16){
                Text("Where you' will Enjoy")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:16){
                        ForEach(1 ..< 5){bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text("Beedroom\(bedroom)")
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
                ForEach(0 ..< 5){feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
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
                        Text("$500")
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
    ListingDetailView()
}
