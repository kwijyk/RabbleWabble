//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Serhii Haponov on 4/22/19.
//  Copyright © 2019 Sergey Gaponov. All rights reserved.
//

import Foundation

public class AppSettings {
    //MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    //MARK: - Static Properties
    public static let shared = AppSettings()
    
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        
        set {
            userDefaults.set(questionStrategyType.rawValue, forKey: Keys.questionStrategy)
        }
    }
    
    private let userDefaults = UserDefaults.standard
    
    //MARK: - Object Lifecycle
    private init() { }
}

//MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int {
    public static let allCases: [QuestionStrategyType] = [.random, .sequntial]
    
    case random
    case sequntial
    
    //MARK: - Instance Methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequntial:
            return "Sequntial"
        }
    }
    
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroup: questionGroup)
        case .sequntial:
            return SequentialQuestionStrategy(questionGroup: questionGroup)
        }
        
    }
}


