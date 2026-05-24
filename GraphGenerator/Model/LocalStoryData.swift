//
//  LocalStoryData.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//

import Foundation

// Structs representing your spreadsheet column layout
struct StoryNode {
    let id: String
    let narrativeText: String
    let isDanger: Bool // Custom flag to trigger your Panic Timer
}

struct StoryEdge {
    let id: String
    let fromNode: String
    let choiceText: String
    let toNode: String
}

struct LocalStoryDatabase {
    static let nodes: [String: StoryNode] = [
        "N0": StoryNode(id: "N0", narrativeText: "It is 10:47 p.m. You are alone in your dorm room when the emergency alarm begins to scream through the hallway. Your phone vibrates. In the dorm group chat, Mr. Hale writes: “Everyone stay in your rooms. Lock your doors. Do not open for anyone. This is not a drill.” A second message follows: “Do not trust voices outside your door.” Then someone knocks. Three soft knocks. Then your best friend’s voice: “Please. It’s me. Let me in.”", isDanger: true),
        
        "N1A": StoryNode(id: "N1A", narrativeText: "The empty hallway feels worse than if someone had been there. You shut the door quickly, but before the latch clicks, you hear a scream from the far end of the corridor. Your phone explodes with messages from the dorm group chat.", isDanger: false),
        
        "N1B": StoryNode(id: "N1B", narrativeText: "You keep the door locked. The voice outside becomes softer, almost calm. “Please don’t leave me out here.” Then, from somewhere down the hallway, a scream cuts through the alarm. The knocking stops.", isDanger: false),
        
        "N1C": StoryNode(id: "N1C", narrativeText: "You wait for another answer, but none comes. Then the hallway erupts in a scream. It is short, sharp, and suddenly cut off. Your phone lights up with messages from other students.", isDanger: false),
        
        "N2A": StoryNode(id: "N2A", narrativeText: "Your best friend stands in the hallway with their back turned. They look injured, but they are not asking for help. They are not moving at all. The alarm continues, but for a moment the hallway itself seems to hold its breath.", isDanger: false),
        
        "N2B": StoryNode(id: "N2B", narrativeText: "You are back inside your room. Then a private Google Message arrives from your best friend: “Don’t open the door again. If you saw me outside, it wasn’t me. I’m near the stairwell. I think something is using our voices.”", isDanger: false),
        
        "N2C": StoryNode(id: "N2C", narrativeText: "Your phone screen glows. The message says: “Don’t say my name out loud.” You stare at the figure in the hallway. It still has not turned around. Then another message arrives: “If you can see me, that is not me.”", isDanger: false),
        
        "N2D": StoryNode(id: "N2D", narrativeText: "The group chat becomes chaotic. Mia says she heard Mr. Hale yelling from the stairs. Jason says Mr. Hale just messaged him privately. Tina says the Wi-Fi may be delayed. Owen sends a blurry picture of a person standing near the vending machines. It looks almost like your best friend.", isDanger: false)
    ]
    
    static let edges: [StoryEdge] = [
        // Choices branch from N0
        StoryEdge(id: "E0A", fromNode: "N0", choiceText: "Open the door", toNode: "N1A"),
        StoryEdge(id: "E0B", fromNode: "N0", choiceText: "Keep the door locked", toNode: "N1B"),
        StoryEdge(id: "E0C", fromNode: "N0", choiceText: "Ask who is outside", toNode: "N1C"),
        
        // Choices branch from N1A
        StoryEdge(id: "E1A", fromNode: "N1A", choiceText: "Look through the doorway", toNode: "N2A"),
        StoryEdge(id: "E1B", fromNode: "N1A", choiceText: "Lock the door and stay inside", toNode: "N2B"),
        StoryEdge(id: "E1C", fromNode: "N1A", choiceText: "Call out their name", toNode: "N2C"),
        
        // Choices branch from N1B
        StoryEdge(id: "E1D", fromNode: "N1B", choiceText: "Look through the peephole", toNode: "N2A"),
        StoryEdge(id: "E1E", fromNode: "N1B", choiceText: "Stay completely silent", toNode: "N2B"),
        StoryEdge(id: "E1F", fromNode: "N1B", choiceText: "Text the group chat", toNode: "N2D"),
        
        // Choices branch from N1C
        StoryEdge(id: "E1G", fromNode: "N1C", choiceText: "Open the door slightly", toNode: "N2A"),
        StoryEdge(id: "E1H", fromNode: "N1C", choiceText: "Do not open the door", toNode: "N2B"),
        StoryEdge(id: "E1I", fromNode: "N1C", choiceText: "Ask the group chat what happened", toNode: "N2D")
    ]
}
