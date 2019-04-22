//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Serhii Haponov on 4/22/19.
//  Copyright © 2019 Sergey Gaponov. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource 

public class RandomQuestionStrategy: QuestionStrategy {
    
    //MARK: - Properties
    public var correctCount = 0
    public var incorrectCount = 0
    private let questionGroup: QuestionGroup
    private var questionIndex = 0
    private let questions: [Question]
    
    //MARK: - Object Lifecycle
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    //MARK: - QuestionStratagy
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
    }

    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }

    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount += 1
    }

    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questions.count)"
    }
}
