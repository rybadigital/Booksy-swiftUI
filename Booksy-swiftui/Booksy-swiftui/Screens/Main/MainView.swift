//
//  MainView.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                
                if !viewModel.dataSource.isEmpty {
                    citySection
                }
            }
            .navigationBarTitle("Main")
        }
    }
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("Search city...", text: $viewModel.searchCity)
        }
    }
    
    var citySection: some View {
        Section {
            ForEach(viewModel.dataSource) { viewModel in
                CityCell(viewModel: viewModel)
            }
        }
    }
}
