//
//  ExchangeRate.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//


import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource

    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 20)

            Text(text)
                .font(.headline)
                .foregroundColor(.black)

            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
        }
        .padding()
        .background(.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
