//
//  CurrenctTip.swift
//  Coinverter
//
//  Created by yousef abdulati on 05/10/2024.
//


import SwiftUI
import TipKit

struct CurrenctTip: Tip {
    var title = Text("Change Currency")
    var message :Text? = Text("Select a currency to change your current currency")
}
