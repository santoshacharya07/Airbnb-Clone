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
    @ObservedObject var viewModel: ExploreViewModel
    @State private var selectedOption: DestinationSearchOption = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                        viewModel.updateListingForLocation()
                    }
                }label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if !viewModel.searchLocation.isEmpty{
                    Button("Clear"){
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            VStack(alignment:.leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Serch destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
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
            .frame(height: selectedOption == .location ? 120 : 64)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            //date selection view
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                } else {
                    CollapsePickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapseDestinationViewModifider())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
            
            //number of guest view
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    
                    Text("Who's comming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return } ;                          numGuests -= 1
                        
                    }
                }else{
                    CollapsePickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapseDestinationViewModifider())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }
            Spacer()
            
            
            
            //
            // Number of guest view
            //            VStack(alignment: .leading) {
            //                if selectedOption == .guests {
            //                    Text("Who's coming")
            //                        .font(.title)
            //                        .fontWeight(.semibold)
            //
            //                    HStack(alignment: .center) {
            //                        Button(action: {
            //                            if numGuests > 0 {
            //                                numGuests -= 1
            //                            }
            //                        }) {
            //                            Image(systemName: "minus.circle")
            //                                .imageScale(.large)
            //                        }
            //
            //                        Text("\(numGuests) Adults")
            //
            //                        Button(action: {
            //                            numGuests += 1
            //                        }) {
            //                            Image(systemName: "plus.circle")
            //                                .imageScale(.large)
            //                        }
            //                    }
            //                    .padding(.vertical)
            //                    GeometryReader { geometry in
            //                              Color.white // Replace with your actual content
            //                                  .frame(width: geometry.size.width)
            //                          }
            //                } else {
            //                    CollapsePickerView(title: "Who", description: "Add guests")
            //                }
            //            }
            //            .padding()
            //            .frame(height: selectedOption == .guests ? 180 : 64)
            //            .background(.white)
            //            .clipShape(RoundedRectangle(cornerRadius: 12))
            //            .padding()
            //            .shadow(radius: 10)
            //            .onTapGesture {
            //                withAnimation(.snappy){
            //                    selectedOption = .guests
            //                }
            //            }
            
            
            //
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapseDestinationViewModifider: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
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
