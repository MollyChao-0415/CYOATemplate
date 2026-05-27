//
//  Reader.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-02.
//


import Foundation

struct Reader: Identifiable, Codable, Equatable {
    
    var id: Int
    var name: String?
    var userId: UUID?
    var prefersDarkMode: Bool
    var lastPageReadId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userId = "user_id"
        case prefersDarkMode = "prefers_dark_mode"
        case lastPageReadId = "last_page_read_id"
    }
}
