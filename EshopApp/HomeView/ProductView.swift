//
//  ProductView.swift
//  EshopApp
//
//  Created by MONIS MANZOOR on 07/02/25.
//

import SwiftUI

struct ProductView : View {
    let product : Product
    
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(.clear)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.system(size: 18, weight: .medium))
                    .lineLimit(2)
                    .foregroundColor(.black)
                
                HStack {
                    Text(product.category)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color(UIColor.darkGray))
                    Spacer()
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text(product.rating.rate.toString())
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(.yellow)
                    }
                }
                Text(product.description)
                    .font(.system(size: 13, weight: .medium))
                    .lineLimit(3)
                    .foregroundColor(Color(UIColor.lightGray))
                
                HStack {
                    Text(product.price.currencyFormat())
                        .font(.system(size: 13, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(UIColor.lightGray))
                    
                    Spacer()
                    
                    Button("Buy") {
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.indigo)
                    .clipShape(.capsule)
                }
            }
        }.padding()
    }
}

#Preview {
    ProductView(product: Product.dummy)
}
    
