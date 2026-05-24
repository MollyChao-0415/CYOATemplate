////
////  EdgesViewModel.swift
////  CYOATemplate
////
////  Created by Russell Gordon on 2024-06-03.
////
//
//import SwiftUI
//import Foundation
//
//class EdgesViewModel: ObservableObject {
//    
//    // Details of the current page being read
//    @Published var edges: [Edge]?
//    let book: BookStore
//    
//    init(book: BookStore) {
//        self.book = book
//        
//        // Load the edges for this page
//        Task {
//            edges = try await book.getEdgesForCurrentPage()
//        }
//        
//    }
//    
//}
