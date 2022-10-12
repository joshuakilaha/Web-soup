//
//  ScrapperViewModel.swift
//  Web-soup
//
//  Created by mroot on 11/10/2022.
//

import Foundation
import SwiftSoup

@MainActor
class ScrapperViewModel: ObservableObject {
    
    @Published var housePlant = [HousePlant]()
    let baseURL = URL(string: "https://en.wikipedia.org/wiki/Houseplant")
    
    func getPlant() {
        housePlant.removeAll()
        if let plantsURL = baseURL {
            do {
                let websiteString = try String(contentsOf: plantsURL)
                let document = try SwiftSoup.parse(websiteString)
                let plantList = try document.getElementsByClass("mw-body-content mw-content-ltr").select("li").select("i").select("a")
                
                for plant in plantList {
                    let title = try plant.attr("title")
                    print("Title: \(title)")
                    let post = HousePlant(title: title)
                    self.housePlant.append(post)
                }
            } catch let error {
                print(error)
            }
        }
    }
}
