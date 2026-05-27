//
//  StoryViewModel.swift
//  CYOATemplate
//
//  Created by Humphrey Yan on 2026-05-27.
//

import Foundation

@MainActor
final class StoryViewModel: ObservableObject {
    
    @Published var currentPage: Page?
    @Published var choices: [Edge] = []
    @Published var endingType: EndingType?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var previousPages: [Int] = []
    
    var hasChoices: Bool {
        return !choices.isEmpty
    }
    
    var canGoBack: Bool {
        return !previousPages.isEmpty
    }
    
    func loadStartingPage() async {
        previousPages.removeAll()
        await loadPage(id: 1, shouldRecordHistory: false)
    }
    
    func loadPage(id: Int, shouldRecordHistory: Bool = true) async {
        isLoading = true
        errorMessage = nil
        
        do {
            if shouldRecordHistory, let currentPage {
                previousPages.append(currentPage.id)
            }
            
            let page: Page = try await supabase
                .from("page")
                .select()
                .eq("id", value: id)
                .single()
                .execute()
                .value
            
            let edges: [Edge] = try await supabase
                .from("edge")
                .select()
                .eq("from_page", value: id)
                .execute()
                .value
            
            currentPage = page
            choices = edges.sorted { $0.id < $1.id }
            
            if let endingTypeId = page.endingTypeId {
                await loadEndingType(id: endingTypeId)
            } else {
                endingType = nil
            }
            
            print("✅ Loaded page \(page.id)")
            print("✅ Choices count: \(choices.count)")
            
        } catch {
            errorMessage = error.localizedDescription
            print("❌ Failed to load page \(id)")
            print(error)
        }
        
        isLoading = false
    }
    
    func loadEndingType(id: Int) async {
        do {
            let type: EndingType = try await supabase
                .from("ending_type")
                .select()
                .eq("id", value: id)
                .single()
                .execute()
                .value
            
            endingType = type
            
        } catch {
            print("⚠️ Failed to load ending type \(id)")
            print(error)
            endingType = nil
        }
    }
    
    func choose(_ edge: Edge) async {
        guard let nextPage = edge.toPage else {
            errorMessage = "This choice does not have a destination page."
            return
        }
        
        await loadPage(id: nextPage)
    }
    
    func goBack() async {
        guard let previousPageId = previousPages.popLast() else {
            return
        }
        
        await loadPage(id: previousPageId, shouldRecordHistory: false)
    }
    
    func restart() async {
        previousPages.removeAll()
        await loadStartingPage()
    }
}
