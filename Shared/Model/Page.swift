//
//  Page.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import Foundation

struct Page: Identifiable, Codable, Equatable {
    
    var id: Int
    var narrative: String
    var image: String?
    var endingContext: String?
    var endingTypeId: Int?
    var isDanger: Bool?
    var timeoutPageId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case narrative
        case image
        case endingContext = "ending_context"
        case endingTypeId = "ending_type_id"
        case isDanger = "is_danger"
        case timeoutPageId = "timeout_page_id"
    }
    
    var isAnEndingOfTheStory: Bool {
        return endingTypeId != nil
    }
}
