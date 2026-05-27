//
//  Edge.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//


import Foundation

struct Edge: Identifiable, Codable, Equatable {
    
    var id: Int
    var prompt: String?
    var toPage: Int?
    var fromPage: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case prompt
        case toPage = "to_page"
        case fromPage = "from_page"
    }
}
