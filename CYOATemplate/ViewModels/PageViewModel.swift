//
//  PageViewModel.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2024-06-03.
//

import SwiftUI
import Foundation

class PageViewModel: ObservableObject {
    
    // Details of the current page being read
    @Published var page: Page?
    let book: BookStore
    
    init(book: BookStore) {
        
        self.book = book
        
        // Load the details of the current page from the database
        Task {
            self.page = try await book.getCurrentPage()
        }
    }
    
}
