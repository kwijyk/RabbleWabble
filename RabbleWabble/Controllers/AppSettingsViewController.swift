//
//  AppSettingsViewController.swift
//  RabbleWabble
//
//  Created by Serhii Haponov on 4/22/19.
//  Copyright © 2019 Sergey Gaponov. All rights reserved.
//

import UIKit

public class AppSettingsViewController: UITableViewController {

    public let appSettings = AppSettings.shared
    private let cellIdentifier = "basicCell"
    
    //MARK: - Veiw Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(UITableView.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension AppSettingsViewController {

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }

}
