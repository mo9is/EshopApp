//
//  EshopViewModel.swift
//  EshopApp
//
//  Created by Monis Manzoor on 06/02/25.
//

import SwiftUI

@MainActor @Observable
class EshopViewModel {
    private let apiManager : APIManager = APIManager()
    var products : [Product] = []
    
    func fetchEshopProducts() async {
        do {
            let response : [Product] = try await self.apiManager.getData(FromServer: "https://fakestoreapi.com/products")
            self.products = response
            print(self.products)
        }
        catch {
            print("error \(error)")
        }
    }
}
