//
//  Question.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import Foundation

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(questionText: "Apple",
                 possibleAnswers: [
                    "딸기",
                    "사과",
                    "수박",
                    "체리",
                 ],
                 correctAnswerIndex: 1),
        Question(questionText: "수박",
                 possibleAnswers: [
                    "Apple",
                    "Pear",
                    "Watermelon",
                    "Peach",
                 ],
                 correctAnswerIndex: 2),
        Question(questionText: "빵",
                 possibleAnswers: [
                    "Bread",
                    "Scone.",
                    "Bead",
                    "Cookie",
                 ],
                 correctAnswerIndex: 0),
        Question(questionText: "Coffee",
                 possibleAnswers: [
                    "쥬스",
                    "스무디",
                    "차",
                    "커피",
                 ],
                 correctAnswerIndex: 3),
    ]
}
