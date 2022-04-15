//
//  GameViewModel.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var game = Game()
    
    var questionText: String {
        game.currentQuestion.questionText
    }
    
    var answerIndices: Range<Int> {
        game.currentQuestion.possibleAnswers.indices
    }
    
    var correctAnswerIndex: Int {
        game.currentQuestion.correctAnswerIndex
    }
    
    // 문제 개수 표시 
    var progressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.questionCount)"
    }
    
    var selectionWasMade: Bool {
        game.selections[game.currentQuestion] != nil
    }
    
    var selectionCount: (Int, Int) {
        game.selectionCount
    }
    
    var gameIsOver: Bool {
        game.gameIsOver
    }
    
    var gameStartTime: Date {
        game.startTime
    }
    
    func answerText(for index: Int) -> String {
        game.currentQuestion.possibleAnswers[index]
    }
    
    func advanceGameState() {
        game.advanceGameState()
    }
    
    func makeSelectionForCurrentQuestion(at index: Int) {
        game.makeSelection(at: index)
    }
    
    // 정답여부
    func colorForButton(at buttonIndex: Int) -> Color {
        guard let selectedIndex = game.selections[game.currentQuestion], selectedIndex == buttonIndex else { return .clear }
        if selectedIndex == correctAnswerIndex {
            return Color.init(hex: "008E00").opacity(0.2)
        } else {
            return Color.init(hex: "D23E2C")
        }
    }
}
