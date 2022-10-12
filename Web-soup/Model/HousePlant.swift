//
//  HousePlant.swift
//  Web-soup
//
//  Created by mroot on 11/10/2022.
//

import Foundation

struct HousePlant: Identifiable, Hashable {
    let id = UUID().uuidString
    var title: String
}
