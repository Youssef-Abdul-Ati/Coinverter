//
//  ContentView.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//


import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSellectCurrency = false
    @FocusState var isTextFieldFocused
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency = Currency.silverpenny
    @State var rightCurrency = Currency.silverpenny
    @FocusState var leftTyping
    @FocusState var rightTyping

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.title)
                    .foregroundColor(.white)

                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .onTapGesture { showSellectCurrency.toggle() }
                        .popoverTip(CurrenctTip(),arrowEdge: .bottom)

                        TextField("AMOUNT", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .focused($isTextFieldFocused)
                            .keyboardType(.decimalPad)
                    }
                    Spacer()

                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()

                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture { showSellectCurrency.toggle() }

                        TextField("AMOUNT", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .focused($isTextFieldFocused)
                            .keyboardType(.decimalPad)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .clipShape(Capsule())
                .onSubmit { isTextFieldFocused = false }
                .onTapGesture { isTextFieldFocused = false }

                Spacer()

                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                    .task { try? Tips.configure() }
                    .onChange(of: leftAmount) { if leftTyping { rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency) } }
                    .onChange(of: rightAmount) { if rightTyping { leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency) } }
                    .onChange(of: leftCurrency) { leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency) }
                    .onChange(of: rightCurrency) { rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency) }
                    .sheet(isPresented: $showExchangeInfo, content: { ExchangeView() })
                    .sheet(isPresented: $showSellectCurrency, content: { SellectCurrency(topCurrency: $leftCurrency, buttonCurrency: $rightCurrency) })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
