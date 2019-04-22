//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Sergey on 2/15/19.
//  Copyright © 2019 Sergey Gaponov. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
    var title: String { get }
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    func currentQuestion() -> Question
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    func questionIndexTitle() -> String
}
