//
//  SelectQuestioinGroupViewController.swift
//  RabbleWabble
//
//  Created by Sergey on 1/9/19.
//  Copyright © 2019 Sergey Gaponov. All rights reserved.
//

import UIKit

class SelectQuestioinGroupViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - Properties
    public let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup: QuestionGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    public override func prepare(for segue: UIStoryboardSegue,
                                 sender: Any?) {
        guard let viewController = segue.destination
            as? QuestionViewController else { return }
        viewController.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
        viewController.delegate = self
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension SelectQuestioinGroupViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        return cell
    }
    
    public func tableView(_ tableView: UITableView,
                          willSelectRowAt indexPath: IndexPath)
        -> IndexPath? {
            selectedQuestionGroup = questionGroups[indexPath.row]
            return indexPath
    }
    
    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//     @IBAction func back(_ segue: UIStoryboardSegue) {
//        print("Back")
//    }
    
}

extension SelectQuestioinGroupViewController: QuestionViewControllerDelegate {
    
    func questionViewController(
        _ viewController: QuestionViewController,
        didCancel quastionStrategy: QuestionStrategy) {
        
        navigationController?.popToViewController(self,
                                                  animated: true)
    }
    
    func questionViewController(
        _ viewController: QuestionViewController,
        didComplete quastionStrategy: QuestionStrategy) {
        
        navigationController?.popToViewController(self,
                                                  animated: true)
    }
}
