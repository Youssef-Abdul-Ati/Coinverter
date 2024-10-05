//
//  SellectCurrency.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//
import SwiftUI

struct SellectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var buttonCurrency: Currency

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)

                IconGrid(currency: $topCurrency)

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)

                IconGrid(currency: $buttonCurrency)

                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SellectCurrency(topCurrency: .constant(.copperpenny), buttonCurrency: .constant(.silverpenny))
}


