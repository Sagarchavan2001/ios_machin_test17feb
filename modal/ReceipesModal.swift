//
//  ReceipesModal.swift
//  machineTest_Ios
//
//  Created by STC on 17/02/24.
//

import Foundation

//Structure of Receipes
struct ReceipsApi: Decodable {
    let recipes: [Recipe]
}


struct Recipe: Decodable {
    let id: Int
    let name: String
    let ingredients, instructions: [String]
    let tags: [String]
    let image: String
    let rating: Double
    let reviewCount: Int
   
}
