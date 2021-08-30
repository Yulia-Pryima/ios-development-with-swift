//
//  StoryBrain.swift
//  Destini-iOS13
//

import Foundation

struct StoryBrain {
    let stories = [
        Story(
            title: "You was sent to Japan with a mission to find a sacred treasure of Fox Goddess Inari Okami. Your working strategy is 'Intuition the Best advisor' so you decided to follow the river flow and after arriving to the Airport stop in closest business hotel and if too tired go next morning to Haneda Airport to get some information out of staff, or head to some local Fox Shrine... So you checked in a hotel. What do you do next?",
            choice1: "I am too tired today. Better go sleep now.",
            choice1Destination: 2,
            choice2: "I am full of energy and can't wait for adventure!",
            choice2Destination: 1
        ),
        Story(
            title: "After sun went down you took a 15 minutes walk and reached to local 'Anamori Inari' Shinto Shrine, now standing just in front of Torii",
            choice1: "I need to explore this Shrine!",
            choice1Destination: 2,
            choice2: "Don't know why, but let me go to Kombini first :)",
            choice2Destination: 3
        ),
        Story(
            title: "You woke up at 3:30 am, prepared and went out. As you begin to walk in chosen direction, you met a bicycle rider. He stops next to you and asking if you need any help. Your answer is silence. He gets angrier and angrier by the minute. He asks you reply to his question. Inside youorself you find a bloody anger.",
            choice1: "'Get out of my way!' - you shout.",
            choice1Destination: 5,
            choice2: "Yes, I need your help.",
            choice2Destination: 4
        ),
        Story(
            title: "What? Baka! Did you know that you don't have much time for this and finally someone faster will find a treasure instead of you?",
            choice1: "The",
            choice1Destination: 0,
            choice2: "End",
            choice2Destination: 0
        ),
        Story(
            title: "Brilliant! What do you prefer cofee or maybe vodka-martini? ;)",
            choice1: "The",
            choice1Destination: 0,
            choice2: "End",
            choice2Destination: 0
        ),
        Story(
            title: "The bicycle rider take out his knife and tries to hit you. 'Police! Help!' - you screem but only silent airplains around...",
            choice1: "The",
            choice1Destination: 0,
            choice2: "End",
            choice2Destination: 0
        )
    ]
    
    var storyNumber = 0

    
    mutating func getStoryText() -> String {
        return stories[storyNumber].title
    }
    
    mutating func getChoice1() -> String {
        return stories[storyNumber].choice1
    }
    
    mutating func getChoice2() -> String {
        return stories[storyNumber].choice2
    }

    mutating func nextStory(userChoice: String) {
        if stories[storyNumber].choice1Destination == 0 {
            return
        }
        if userChoice == stories[storyNumber].choice1 {
            storyNumber = stories[storyNumber].choice1Destination
        }
        else {
            storyNumber = stories[storyNumber].choice2Destination
        }
    }
    
}
