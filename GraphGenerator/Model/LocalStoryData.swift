//
//  LocalStoryData.swift
//  CYOATemplate
//
//  Created by Yuk Tung Chao on 2026-05-24.
//
import Foundation

struct StoryNode {
    let id: String
    let narrativeText: String
    let isDanger: Bool
    let isEnding: Bool
    let endingTitle: String?
}

struct StoryEdge {
    let id: String
    let fromNode: String
    let choiceText: String
    let toNode: String
}

struct LocalStoryDatabase {
    
    static let nodes: [String: StoryNode] = [
        
        "N0": StoryNode(
            id: "N0",
            narrativeText: "It is 10:47 p.m. You are alone in your dorm room when the emergency alarm begins to scream through the hallway. Your phone vibrates. In the dorm group chat, Mr. Hale writes: “Everyone stay in your rooms. Lock your doors. Do not open for anyone. This is not a drill.” A second message follows: “Do not trust voices outside your door.” Then someone knocks. Three soft knocks. Then your best friend’s voice: “Please. It’s me. Let me in.”",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N1A": StoryNode(
            id: "N1A",
            narrativeText: "The empty hallway feels worse than if someone had been there. You shut the door quickly, but before the latch clicks, you hear a scream from the far end of the corridor. Your phone explodes with messages from the dorm group chat.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N1B": StoryNode(
            id: "N1B",
            narrativeText: "You keep the door locked. The voice outside becomes softer, almost calm. “Please don’t leave me out here.” Then, from somewhere down the hallway, a scream cuts through the alarm. The knocking stops.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N1C": StoryNode(
            id: "N1C",
            narrativeText: "You wait for another answer, but none comes. Then the hallway erupts in a scream. It is short, sharp, and suddenly cut off. Your phone lights up with messages from other students.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N2A": StoryNode(
            id: "N2A",
            narrativeText: "Your best friend stands in the hallway with their back turned. They look injured, but they are not asking for help. They are not moving at all. The alarm continues, but for a moment the hallway itself seems to hold its breath.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N2B": StoryNode(
            id: "N2B",
            narrativeText: "You are back inside your room. Then a private message arrives from your best friend: “Don’t open the door again. If you saw me outside, it wasn’t me. I’m near the stairwell. I think something is using our voices.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N2C": StoryNode(
            id: "N2C",
            narrativeText: "Your phone screen glows. The message says: “Don’t say my name out loud.” You stare at the figure in the hallway. It still has not turned around. Then another message arrives: “If you can see me, that is not me.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N2D": StoryNode(
            id: "N2D",
            narrativeText: "The group chat becomes chaotic. Mia says she heard Mr. Hale yelling from the stairs. Jason says Mr. Hale just messaged him privately. Tina says the Wi-Fi may be delayed. Owen sends a blurry picture of a person standing near the vending machines. It looks almost like your best friend.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N3A": StoryNode(
            id: "N3A",
            narrativeText: "The figure turns. For one moment it has your friend’s face. Then the expression slips, not like a mask falling off, but like someone forgetting what a face is supposed to do. You run back to your room and lock the door.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N3B": StoryNode(
            id: "N3B",
            narrativeText: "The hallway voice says, “I don’t know,” while your phone displays a new message from your friend: “Are you still in your room?” Both could be real. Both could be impossible. You retreat and lock your door.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N3C": StoryNode(
            id: "N3C",
            narrativeText: "The photograph shows your friend clearly: wounded, scared, human. But outside the phone screen, the figure’s shoulders look too narrow, then too wide. You shut the door before you can decide which version to trust.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N4A": StoryNode(
            id: "N4A",
            narrativeText: "Your friend has answered with a real memory, but the memory was emotional and intense. If the thing can read fear, maybe it could know that too. Another message arrives: “I’m not asking you to trust me. Just don’t trust only him.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N4B": StoryNode(
            id: "N4B",
            narrativeText: "Your friend’s advice is not reckless. They tell you not to come out unless the door begins to fail. That makes them sound more real, not less. Then the first heavy impact hits your door.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N4C": StoryNode(
            id: "N4C",
            narrativeText: "You ignore the messages. The phone goes quiet. Then the typing bubble appears for almost a full minute before a message arrives: “I can wait.”",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N4D": StoryNode(
            id: "N4D",
            narrativeText: "The student ID detail makes sense. The school database has that photo. A person would remember it, but so could something that accessed school systems. Your friend sends another message: “Please tell me you’re still inside.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N5A": StoryNode(
            id: "N5A",
            narrativeText: "You ask the group if anyone has seen Mr. Hale. Mia says she heard him. Jason says he saw someone wearing his jacket. Tina says she saw him before the alarm, not after. Owen says your best friend told him Mr. Hale is dead. Your friend immediately messages: “I never told Owen that.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N5B": StoryNode(
            id: "N5B",
            narrativeText: "Mr. Hale replies quickly and calmly. “Stay inside. Do not open video files. Do not trust private messages. It separates students by making them choose one voice over another.” His answer sounds responsible. Maybe too responsible.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N6A": StoryNode(
            id: "N6A",
            narrativeText: "You ask a boring verification question: “What did we eat for lunch last Tuesday?” The reply takes longer than before. Finally, your friend answers: “Pasta. You complained it tasted like wet cardboard.” That is true. Too true. Then another message arrives from an unknown number: “That answer was copied.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N6B": StoryNode(
            id: "N6B",
            narrativeText: "You ask what to do next. Your friend sends a map of the dorm. One route goes through the stairwell. Another goes past the vending machines. The map looks normal until you notice the hallway outside your room is labeled twice: once as HALLWAY, and once as MOUTH.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N6C": StoryNode(
            id: "N6C",
            narrativeText: "You stop replying. The room feels smaller. The knocking begins again, but now it is not coming from the door. It comes from your closet. Three soft knocks. Then your own voice whispers from inside: “Please. It’s me.”",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N6D": StoryNode(
            id: "N6D",
            narrativeText: "You turn off your phone. The room becomes silent except for the alarm. For a few seconds, that feels safer. Then your dark phone screen lights up by itself, showing one message without a sender: “Isolation makes you easier to copy.”",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N6E": StoryNode(
            id: "N6E",
            narrativeText: "You compare messages in the group chat. The pattern becomes clear: the thing repeats fear, urgency, and emotional memories. But it struggles with boring details. It is excellent at sounding human. It is terrible at being normal.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N7A": StoryNode(
            id: "N7A",
            narrativeText: "You decide to test everyone with ordinary facts: locker combinations, breakfast orders, the exact color of Mr. Hale’s coffee mug. The real students answer unevenly, with typos and confusion. The fake answers are perfect. Perfect becomes suspicious.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N7B": StoryNode(
            id: "N7B",
            narrativeText: "You crawl under your desk and push it against the door. The wood shakes under another impact. Your friend texts: “If you leave, don’t follow any voice. Follow light.” At the end of the hall, under the door gap, something red flickers like an exit sign.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N7C": StoryNode(
            id: "N7C",
            narrativeText: "You message Mr. Hale and ask something only he should know: “What did you confiscate from Owen last week?” He replies: “A speaker.” That is wrong. It was a laser pointer. Before you can type, Mr. Hale’s account sends another message: “Do not question staff instructions.”",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N7D": StoryNode(
            id: "N7D",
            narrativeText: "You refuse to answer anything. The thing stops pretending. The alarm cuts out, and the hallway becomes impossibly quiet. Then every door on the floor knocks at once. Three soft knocks, repeating like a school bell.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N8A": StoryNode(
            id: "N8A",
            narrativeText: "You send the boring-fact test to the group chat. Real students start marking suspicious replies. For the first time, the group becomes calmer. Not safe, but organized. You realize the thing wanted everyone alone because together, people remember better.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N8B": StoryNode(
            id: "N8B",
            narrativeText: "You decide to leave only when the red exit light steadies. You open the door a crack. The hallway is longer than before. Doors repeat. Names repeat. But the red light stays at the far end, blinking slowly like a heartbeat.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N8C": StoryNode(
            id: "N8C",
            narrativeText: "You follow the staff account’s instructions for a moment, then stop. The account is too clean, too calm, too certain. Real adults under pressure do not sound like emergency posters. You ask the group to stop trusting titles and start trusting evidence.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N8D": StoryNode(
            id: "N8D",
            narrativeText: "You stay silent for too long. The room begins to imitate you: your breathing from the vent, your footsteps from the ceiling, your nervous tapping from inside the wall. It is learning without needing you to speak.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N9A": StoryNode(
            id: "N9A",
            narrativeText: "Together, the students create a rule: no one is trusted because of their voice, face, or title. Everyone must answer boring, shared, verifiable details. The thing floods the chat with panic, but panic no longer works as well.",
            isDanger: false,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N9B": StoryNode(
            id: "N9B",
            narrativeText: "You step into the hallway and move toward the red light. The thing whispers from every room in voices you love. Some beg. Some accuse. Some forgive you. You keep walking because none of them mention the boring facts.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N9C": StoryNode(
            id: "N9C",
            narrativeText: "You hesitate outside the stairwell. Your friend appears at the bottom, crying. Their face is right. Their voice is right. But they call you by a nickname they never use. The red light flickers behind them.",
            isDanger: true,
            isEnding: false,
            endingTitle: nil
        ),
        
        "N10A": StoryNode(
            id: "N10A",
            narrativeText: "You answer the voice in the closet. That is all it needs. By morning, someone wearing your face sits in class and tells everyone you were rescued. The real you keeps knocking from somewhere no one can find.",
            isDanger: false,
            isEnding: true,
            endingTitle: "Bad Ending — Copied"
        ),
        
        "N10B": StoryNode(
            id: "N10B",
            narrativeText: "You follow the wrong voice into the hallway. The red light disappears behind you. The dorm doors stretch into darkness, and every knock now sounds like your heartbeat. The story ends with you still walking.",
            isDanger: false,
            isEnding: true,
            endingTitle: "Bad Ending — The Endless Hall"
        ),
        
        "N10C": StoryNode(
            id: "N10C",
            narrativeText: "You survive until morning, but you never learn who was real. Some students return. Some return almost right. For the rest of the year, no one on your floor answers a knock without asking three boring questions first.",
            isDanger: false,
            isEnding: true,
            endingTitle: "Neutral Ending — Almost Safe"
        ),
        
        "N10D": StoryNode(
            id: "N10D",
            narrativeText: "You reach the stairwell with the real students. The thing keeps calling from behind you, wearing familiar voices like borrowed clothes. But the group keeps testing, remembering, and moving together. At dawn, the alarm finally stops.",
            isDanger: false,
            isEnding: true,
            endingTitle: "Good Ending — Remember Together"
        )
    ]
    
    static let edges: [StoryEdge] = [
        
        StoryEdge(id: "E0A", fromNode: "N0", choiceText: "Open the door", toNode: "N1A"),
        StoryEdge(id: "E0B", fromNode: "N0", choiceText: "Keep the door locked", toNode: "N1B"),
        StoryEdge(id: "E0C", fromNode: "N0", choiceText: "Ask who is outside", toNode: "N1C"),
        
        StoryEdge(id: "E1A", fromNode: "N1A", choiceText: "Look through the doorway", toNode: "N2A"),
        StoryEdge(id: "E1B", fromNode: "N1A", choiceText: "Lock the door and stay inside", toNode: "N2B"),
        StoryEdge(id: "E1C", fromNode: "N1A", choiceText: "Call out their name", toNode: "N2C"),
        
        StoryEdge(id: "E1D", fromNode: "N1B", choiceText: "Look through the peephole", toNode: "N2A"),
        StoryEdge(id: "E1E", fromNode: "N1B", choiceText: "Stay completely silent", toNode: "N2B"),
        StoryEdge(id: "E1F", fromNode: "N1B", choiceText: "Text the group chat", toNode: "N2D"),
        
        StoryEdge(id: "E1G", fromNode: "N1C", choiceText: "Open the door slightly", toNode: "N2A"),
        StoryEdge(id: "E1H", fromNode: "N1C", choiceText: "Do not open the door", toNode: "N2B"),
        StoryEdge(id: "E1I", fromNode: "N1C", choiceText: "Ask the group chat what happened", toNode: "N2D"),
        
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
        
        StoryEdge(id: "E3C", fromNode: "N3B", choiceText: "Reply to best friend", toNode: "N4B"),
        StoryEdge(id: "E3D", fromNode: "N3B", choiceText: "Reply to group chat", toNode: "N5A"),
        
        StoryEdge(id: "E3E", fromNode: "N3C", choiceText: "Send the photo to best friend", toNode: "N4D"),
        StoryEdge(id: "E3F", fromNode: "N3C", choiceText: "Send the photo to Mr. Hale", toNode: "N5B"),
        
        StoryEdge(id: "E4A", fromNode: "N4A", choiceText: "Ask a boring verification question", toNode: "N6A"),
        StoryEdge(id: "E4B", fromNode: "N4A", choiceText: "Ask what to do next", toNode: "N6B"),
        StoryEdge(id: "E4C", fromNode: "N4A", choiceText: "Stop replying", toNode: "N6C"),
        
        StoryEdge(id: "E4D", fromNode: "N4B", choiceText: "Prepare to leave", toNode: "N6B"),
        StoryEdge(id: "E4E", fromNode: "N4B", choiceText: "Stay exactly where you are", toNode: "N6C"),
        
        StoryEdge(id: "E4F", fromNode: "N4C", choiceText: "Turn off your phone", toNode: "N6D"),
        
        StoryEdge(id: "E4G", fromNode: "N4D", choiceText: "Ask Mr. Hale if media can be faked", toNode: "N5B"),
        StoryEdge(id: "E4H", fromNode: "N4D", choiceText: "Ask another ordinary detail", toNode: "N6A"),
        
        StoryEdge(id: "E5A", fromNode: "N5A", choiceText: "Look for patterns in the messages", toNode: "N6E"),
        StoryEdge(id: "E5B", fromNode: "N5A", choiceText: "Trust your best friend's warning", toNode: "N6B"),
        
        StoryEdge(id: "E5C", fromNode: "N5B", choiceText: "Follow Mr. Hale's instructions", toNode: "N6C"),
        StoryEdge(id: "E5D", fromNode: "N5B", choiceText: "Test Mr. Hale with a detail", toNode: "N6E"),
        
        StoryEdge(id: "E6A", fromNode: "N6A", choiceText: "Use boring facts to test everyone", toNode: "N7A"),
        StoryEdge(id: "E6B", fromNode: "N6A", choiceText: "Trust the emotional answer", toNode: "N7B"),
        
        StoryEdge(id: "E6C", fromNode: "N6B", choiceText: "Follow the red light", toNode: "N7B"),
        StoryEdge(id: "E6D", fromNode: "N6B", choiceText: "Follow the map exactly", toNode: "N7C"),
        
        StoryEdge(id: "E6E", fromNode: "N6C", choiceText: "Block the closet and stay silent", toNode: "N7D"),
        StoryEdge(id: "E6F", fromNode: "N6C", choiceText: "Run toward the red exit light", toNode: "N7B"),
        
        StoryEdge(id: "E6G", fromNode: "N6D", choiceText: "Turn the phone back on", toNode: "N8D"),
        StoryEdge(id: "E6H", fromNode: "N6D", choiceText: "Stay silent no matter what", toNode: "N7D"),
        
        StoryEdge(id: "E6I", fromNode: "N6E", choiceText: "Share the pattern with the group", toNode: "N7A"),
        StoryEdge(id: "E6J", fromNode: "N6E", choiceText: "Test Mr. Hale's account", toNode: "N7C"),
        
        StoryEdge(id: "E7A", fromNode: "N7A", choiceText: "Organize the group chat", toNode: "N8A"),
        StoryEdge(id: "E7B", fromNode: "N7A", choiceText: "Leave alone while others argue", toNode: "N8B"),
        
        StoryEdge(id: "E7C", fromNode: "N7B", choiceText: "Wait for the red light to steady", toNode: "N8B"),
        StoryEdge(id: "E7D", fromNode: "N7B", choiceText: "Open the door immediately", toNode: "N8C"),
        
        StoryEdge(id: "E7E", fromNode: "N7C", choiceText: "Challenge the staff account", toNode: "N8C"),
        StoryEdge(id: "E7F", fromNode: "N7C", choiceText: "Obey the staff account anyway", toNode: "N8D"),
        
        StoryEdge(id: "E7G", fromNode: "N7D", choiceText: "Speak to the nearest voice", toNode: "N8D"),
        StoryEdge(id: "E7H", fromNode: "N7D", choiceText: "Follow the red light", toNode: "N8B"),
        
        StoryEdge(id: "E8A", fromNode: "N8A", choiceText: "Move as a group", toNode: "N9A"),
        StoryEdge(id: "E8B", fromNode: "N8A", choiceText: "Go ahead alone", toNode: "N9B"),
        
        StoryEdge(id: "E8C", fromNode: "N8B", choiceText: "Ignore the voices and keep walking", toNode: "N9B"),
        StoryEdge(id: "E8D", fromNode: "N8B", choiceText: "Answer the voice that sounds hurt", toNode: "N9C"),
        
        StoryEdge(id: "E8E", fromNode: "N8C", choiceText: "Trust evidence over authority", toNode: "N9C"),
        StoryEdge(id: "E8F", fromNode: "N8C", choiceText: "Return to your room", toNode: "N10B"),
        
        StoryEdge(id: "E8G", fromNode: "N8D", choiceText: "Answer your own voice", toNode: "N10A"),
        StoryEdge(id: "E8H", fromNode: "N8D", choiceText: "Run without checking", toNode: "N10C"),
        
        StoryEdge(id: "E9A", fromNode: "N9A", choiceText: "Keep testing and move together", toNode: "N10D"),
        StoryEdge(id: "E9B", fromNode: "N9A", choiceText: "Break from the group", toNode: "N10B"),
        
        StoryEdge(id: "E9C", fromNode: "N9B", choiceText: "Keep following the red light", toNode: "N10B"),
        StoryEdge(id: "E9D", fromNode: "N9B", choiceText: "Stop and test the voice", toNode: "N10C"),
        
        StoryEdge(id: "E9E", fromNode: "N9C", choiceText: "Trust the nickname mistake", toNode: "N10C"),
        StoryEdge(id: "E9F", fromNode: "N9C", choiceText: "Choose the group over the voice", toNode: "N10D")
    ]
}
