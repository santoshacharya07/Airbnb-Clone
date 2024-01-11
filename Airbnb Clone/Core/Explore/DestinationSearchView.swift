//
//  DestinationSearchView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 09/01/2024.
//

import SwiftUI

enum DestinationSearchOption{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectesOption: DestinationSearchOption = .location
    var body: some View {
        VStack{
            Button{
                withAnimation(.snappy){
                    show.toggle()
                }
            }label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            VStack(alignment:.leading){
                if selectesOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Serch destination", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                }else{
                   CollapsePickerView(title: "Wehre", description: "Add destination")
                }
               
            }     
            .padding()
            .frame(height: selectesOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectesOption = .location
                }           
            }
            
            //date selection view
            VStack{
                if selectesOption == .dates{
                    HStack{
                        Text("Show Expanded View")
                      Spacer()
                    }
                }else{
                    CollapsePickerView(title: "When", description: "Add dates")
                }
            }
            .padding()
            .frame(height: selectesOption == .dates ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectesOption = .dates
                }
            }
          
            //number of guest view
            VStack{
                if selectesOption == .guests{

                    HStack{
                        Text("Show Expanded View")
                      Spacer()
                    }
                }else{
                    CollapsePickerView(title: "Who", description: "Add guests")
                }
            }
            .padding()
            .frame(height: selectesOption == .guests ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectesOption = .guests
                }
            }
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsePickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
