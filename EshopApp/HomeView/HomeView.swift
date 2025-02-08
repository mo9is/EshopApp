//
//  ContentView.swift
//  EshopApp
//
//  Created by Monis Manzoor on 06/02/25.
//

import SwiftUI

struct HomeView : View {
    @State var viewModel = EshopViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.products.enumerated()), id: \.element.id) { (index, product) in
                    NavigationLink(destination: EshopDetailView(products: self.viewModel.products, selectedIndex: index)) {
                        ProductView(product: product)

                    }.listRowBackground(Color.clear)
                }
            }   .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.large)
            }.listStyle(.plain)

        .task {
            await self.viewModel.fetchEshopProducts()
        }
    }
}

#Preview {
    HomeView()
}
