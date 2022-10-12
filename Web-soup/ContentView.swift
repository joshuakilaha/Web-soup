//
//  ContentView.swift
//  Web-soup
//
//  Created by mroot on 11/10/2022.
//

import SwiftUI
import SwiftSoup

struct ContentView: View {
    
    @ObservedObject var data = ScrapperViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.housePlant, id: \.id) { plant in
                    Text(plant.title)
                }
            }
        }
        .onAppear {
            data.getPlant()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
