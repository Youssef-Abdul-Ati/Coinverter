//
//  Currency.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//


import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case copperpenny = 6400
    case silverpenny = 64
    case silverpiece = 16
    case goldpenny = 4
    case goldpiece = 1

    var id: Currency { self }

    var image: ImageResource {
        switch self {
        case .copperpenny: return .copperpenny
        case .silverpenny: return .silverpenny
        case .silverpiece: return .silverpiece
        case .goldpenny: return .goldpenny
        case .goldpiece: return .goldpiece
        }
    }

    var name: String {
        switch self {
        case .copperpenny: return "Copper Penny"
        case .silverpenny: return "Silver Penny"
        case .silverpiece: return "Silver Piece"
        case .goldpenny: return "Gold Penny"
        case .goldpiece: return "Gold Piece"
        }
    }

    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else { return "" }
        let convertAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertAmount)
    }
}


#Preview {
    CurrencyIcon(iconImage: .silverpenny, text: "Silver Penny")
}
