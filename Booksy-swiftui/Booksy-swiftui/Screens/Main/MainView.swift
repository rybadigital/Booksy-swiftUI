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
                    citiesSection
                }
            }            
            .navigationTitle(Text("Main"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("Search city...", text: $viewModel.searchCity)
        }
    }
    
    var citiesSection: some View {
        Section {
            ForEach(viewModel.dataSource) { viewModel in
                NavigationLink(destination: self.viewModel.goToScreenCurrentWeather(currentWeather: viewModel.currentWeather)) {
                    CityCell(viewModel: viewModel)
                }
            }
        }
    }
}
