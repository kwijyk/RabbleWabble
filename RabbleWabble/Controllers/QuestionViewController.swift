//
//  ViewController.swift
//  RabbleWabble
//
//  Created by Sergey Gaponov on 12/9/18.
//  Copyright © 2018 Sergey Gaponov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    // MARK: - Instance Properties
    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
