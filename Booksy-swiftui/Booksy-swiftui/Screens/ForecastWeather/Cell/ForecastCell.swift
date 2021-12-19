//
//  ForecastCell.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 19/12/2021.
//

import SwiftUI

struct ForecastCell: View {
    
    private let viewModel: ForecastCellViewModel
    
    init(viewModel: ForecastCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("\(viewModel.dateText)")
            .padding(.leading, 8)
        
        Text("\( String(format: "%.1f", viewModel.temperature)) °C")
     //       .padding(.trailing, 8)
    }
}
