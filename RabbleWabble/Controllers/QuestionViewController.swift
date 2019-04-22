//
//  ViewController.swift
//  RabbleWabble
//
//  Created by Sergey Gaponov on 12/9/18.
//  Copyright © 2018 Sergey Gaponov. All rights reserved.
//

import UIKit

// MARK: - QuestionViewControllerDelegate
protocol QuestionViewControllerDelegate: class {

    func questionViewController(
        _ viewController: QuestionViewController,
        didCancel questionStratagy: QuestionStrategy)
    
    func questionViewController(
        _ viewController: QuestionViewController,
        didComplete questionStratagy: QuestionStrategy)
}

class QuestionViewController: UIViewController {

    // MARK: - Instance Properties
    public var delegate: QuestionViewControllerDelegate?
    
    public var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "",
        style: .plain,
        target: nil,
        action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
        }()
    
    
    public var questionView: QuestionView! {
        guard isViewLoaded else { return nil }
        return (view as! QuestionView)
    }
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        setupCancelButton()
    }
    
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(image: image,
                            landscapeImagePhone: nil,
                            style: .plain,
                            target: self,
                            action: action)
    }
    
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        delegate?.questionViewController(
            self,
            didCancel: questionStrategy)
    }
    
    private func showQuestion() {
        
        let question = questionStrategy.currentQuestion()
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        
        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }

    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden =
            !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden =
            !questionView.hintLabel.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionCorrect(question)
        questionView.correctCountLabel.text = String(questionStrategy.correctCount)
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionIncorrect(question)
        questionView.correctCountLabel.text = String(questionStrategy.incorrectCount)
        showNextQuestion()
    }
    

    private func showNextQuestion() {
        guard questionStrategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self, didComplete: questionStrategy)
            return
        }
        showQuestion()
    }
}

