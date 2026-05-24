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
        
        "N2D": StoryNode(id: "N2D", narrativeText: "The group chat becomes chaotic. Mia says she heard Mr. Hale yelling from the stairs. Jason says Mr. Hale just messaged him privately. Tina says the Wi-Fi may be delayed. Owen sends a blurry picture of a person standing near the vending machines. It looks almost like your best friend.", isDanger: false),
        
        "N3A": StoryNode(id: "N3A", narrativeText: "The figure turns. For one moment it has your friend’s face. Then the expression slips, not like a mask falling off, but like someone forgetting what a face is supposed to do. You run back to your room and lock the door.", isDanger: true),

        "N3B": StoryNode(id: "N3B", narrativeText: "The hallway voice says, “I don’t know,” while your phone displays a new message from your friend: “Are you still in your room?” Both could be real. Both could be impossible. You retreat and lock your door.", isDanger: false),

        "N3C": StoryNode(id: "N3C", narrativeText: "The photograph shows your friend clearly: wounded, scared, human. But outside the phone screen, the figure’s shoulders look too narrow, then too wide. You shut the door before you can decide which version to trust.", isDanger: false),

        "N4A": StoryNode(id: "N4A", narrativeText: "Your friend has answered with a real memory, but the memory was emotional and intense. If the thing can read fear, maybe it could know that too. Another message arrives: “I’m not asking you to trust me. Just don’t trust only him.”", isDanger: false),

        "N4B": StoryNode(id: "N4B", narrativeText: "Your friend’s advice is not reckless. They tell you not to come out unless the door begins to fail. That makes them sound more real, not less. Then the first heavy impact hits your door.", isDanger: true),

        "N4C": StoryNode(id: "N4C", narrativeText: "You ignore the messages. The phone goes quiet. Then the typing bubble appears for almost a full minute before a message arrives: “I can wait.”", isDanger: true),

        "N4D": StoryNode(id: "N4D", narrativeText: "The student ID detail makes sense. The school database has that photo. A person would remember it, but so could something that accessed school systems. Your friend sends another message: “Please tell me you’re still inside.”", isDanger: false),

        "N5A": StoryNode(id: "N5A", narrativeText: "You ask the group if anyone has seen Mr. Hale. Mia says she heard him. Jason says he saw someone wearing his jacket. Tina says she saw him before the alarm, not after. Owen says your best friend told him Mr. Hale is dead. Your friend immediately messages: “I never told Owen that.”", isDanger: false),

        "N5B": StoryNode(id: "N5B", narrativeText: "Mr. Hale replies quickly and calmly. “Stay inside. Do not open video files. Do not trust private messages. It separates students by making them choose one voice over another.” His answer sounds responsible. Maybe too responsible.", isDanger: false),
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
        StoryEdge(id: "E1I", fromNode: "N1C", choiceText: "Ask the ≈group chat what happened", toNode: "N2D"),

        StoryEdge(id: "E2A", fromNode: "N2A", choiceText: "Walk closer", toNode: "N3A"),
        StoryEdge(id: "E2B", fromNode: "N2A", choiceText: "Ask from far away", toNode: "N3B"),
        StoryEdge(id: "E2C", fromNode: "N2A", choiceText: "Take a photo", toNode: "N3C"),

        StoryEdge(id: "E2D", fromNode: "N2B", choiceText: "Reply and ask for proof", toNode: "N4A"),
        StoryEdge(id: "E2E", fromNode: "N2B", choiceText: "Ask where they are", toNode: "N4B"),
        StoryEdge(id: "E2F", fromNode: "N2B", choiceText: "Ignore the message", toNode: "N4C"),

        StoryEdge(id: "E2G", fromNode: "N2C", choiceText: "Run back into your room", toNode: "N4C"),
        StoryEdge(id: "E2H", fromNode: "N2C", choiceText: "Keep watching the figure", toNode: "N3A"),

        StoryEdge(id: "E2I", fromNode: "N2D", choiceText: "Ask who has seen Mr. Hale", toNode: "N5A"),

        StoryEdge(id: "E3A", fromNode: "N3A", choiceText: "Check your phone", toNode: "N4A"),
        StoryEdge(id: "E3B", fromNode: "N3A", choiceText: "Message Mr. Hale", toNode: "N5B"),

        StoryEdge(id: "E3C", fromNode: "N3B", choiceText: "Reply to bestie", toNode: "N4B"),
        StoryEdge(id: "E3D", fromNode: "N3B", choiceText: "Reply to group chat", toNode: "N5A"),

        StoryEdge(id: "E3E", fromNode: "N3C", choiceText: "Send the photo to bestie", toNode: "N4D"),
        StoryEdge(id: "E3F", fromNode: "N3C", choiceText: "Send the photo to Mr. Hale", toNode: "N5B"),

        StoryEdge(id: "E4A", fromNode: "N4A", choiceText: "Ask a boring verification question", toNode: "N6A"),
        StoryEdge(id: "E4B", fromNode: "N4A", choiceText: "Ask what to do next", toNode: "N6B"),
        StoryEdge(id: "E4C", fromNode: "N4A", choiceText: "Stop replying", toNode: "N6C"),

        StoryEdge(id: "E4D", fromNode: "N4B", choiceText: "Prepare to leave", toNode: "N6B"),
        StoryEdge(id: "E4E", fromNode: "N4B", choiceText: "Stay exactly where you are", toNode: "N6C"),

        StoryEdge(id: "E4F", fromNode: "N4C", choiceText: "Turn off your phone", toNode: "N6D"),

        StoryEdge(id: "E4G", fromNode: "N4D", choiceText: "Ask Mr. Hale if media can be faked", toNode: "N5B"),
    ]
}
