//
//  SearchAndFilterBar.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            VStack(alignment:.leading,spacing: 2){
                Text("Where to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Anywhere - Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.4), radius: 2)
        }
        .padding()
        
    }
}

#Preview {
    SearchAndFilterBar()
}
