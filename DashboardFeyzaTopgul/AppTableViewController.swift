//
//  AppTableViewController.swift
//  DashboardFeyzaTopgul
//
//  Created by fyz on 3/21/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import UIKit

class AppTableViewController: UITableViewController {
    var rankedApps: [String]!=nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            rankedApps = appDel.dataFetcher?.appTitles
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if rankedApps == nil {
            return 0
        }
        else {
            return rankedApps.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell", for: indexPath)
        let currentItem: String = rankedApps[indexPath.row]
        let rankedApp = currentItem
        cell.textLabel?.text = rankedApp
        cell.detailTextLabel?.text = "Rating: \(randomRank())"
        return cell
    }
    func randomRank () -> String {
        let randRank = drand48() * 5
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumIntegerDigits = 1
        let randRankForm = formatter.string(from: NSNumber (value: randRank))
        return randRankForm!
    }
}
