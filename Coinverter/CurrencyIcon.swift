//
//  CurrencyIcon.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//


import SwiftUI

struct CurrencyIcon: View {
    let iconImage: ImageResource
    let text: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(iconImage)
                .resizable()
                .scaledToFit()

            Text(text)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(iconImage: .goldpiece, text: "Gold Piece")
}

