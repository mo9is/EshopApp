//
//  Untitled.swift
//  EshopApp
//
//  Created by MONIS MANZOOR on 07/02/25.
//

import SwiftUI

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
