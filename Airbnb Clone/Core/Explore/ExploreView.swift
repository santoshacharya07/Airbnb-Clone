//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Santosh Acharya on 19/12/2023.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                SearchAndFilterBar()
                LazyVStack(spacing: 32){
                    ForEach(0 ... 10, id:\.self){listing in
                       ListingItemView()
                            .frame(height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
