//
//  CityCell.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

struct CityCell: View {
    
    private let viewModel: CityCellViewModel
    
    init(viewModel: CityCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("\(viewModel.title), \(viewModel.country)")
            .font(.body)
            .padding(.leading, 8)
    }
}
