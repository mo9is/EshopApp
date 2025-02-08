//
//  EshopDetailView.swift
//  EshopApp
//
//  Created by MONIS MANZOOR on 07/02/25.
//

import SwiftUI

struct EshopDetailView : View {
    let products : [Product]
    @State var selectedIndex : Int
    
    var body: some View {
        
        let selectedProduct = products[selectedIndex]
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 10) {
                    HStack() {
                        if selectedIndex > 0 {
                            Button("", systemImage: "arrowtriangle.left.fill") {
                                if selectedIndex > 0 {
                                    selectedIndex -= 1
                                }
                            }
                            .tint(.gray)
                        }
                        Spacer()
                        
                        AsyncImage(url: URL(string: selectedProduct.image)) { image in
                            image.resizable()
                                .scaledToFit()
                                .background(.clear)
                        } placeholder: {
                            ProgressView()
                        }.frame(height : geometry.size.height * 0.5)
                        
                        Spacer()
                        
                        if selectedIndex < products.count - 1 {
                            Button("", systemImage: "arrowtriangle.right.fill") {
                                if selectedIndex < products.count - 1 {
                                    selectedIndex += 1
                                }
                            }.tint(.gray)
                        }
                        
                    }.padding()
                    
                    Text(selectedProduct.title)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.primary)
                    
                    Text(selectedProduct.description)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.secondary)
                    
                    HStack {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text("\(selectedProduct.rating.rate.toString()) Ratings")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        HStack(spacing: 10) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 8, height: 8)
                            
                            Text("4.6k Reviews")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 8, height: 8)
                            
                            Text("4.6k Sold")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .center, spacing: 5) {
                            Text("Total Price")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(UIColor.init(white: 0.4, alpha: 1.0)))
                            
                            Text(selectedProduct.price.currencyFormat())
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.indigo)
                        }
                        Spacer()
                        
                        HStack(spacing : 0) {
                            
                            Image(systemName: "cart.fill.badge.plus")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8.5)
                                .background(.indigo)
                                .foregroundColor(.white)
                            
                            Button {
                                
                            } label: {
                                Text("Buy Now")
                                    .font(.system(size: 15, weight : .bold))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 10)
                                    .background(Color(UIColor.init(white: 0.39, alpha: 1.0)))
                                    .foregroundColor(.white)
                            }
                        }
                        .cornerRadius(10)
                    }
                    .padding(.vertical, 10)
                    .padding()
                    .background(Color(UIColor.init(white: 0.85, alpha: 1.0)))
                    .cornerRadius(10)
                    
                    
                    
                }.padding()
            }
        }
    }
}

#Preview {
    EshopDetailView(products: [Product.dummy, Product.dummy], selectedIndex: 0)
}
