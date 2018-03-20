//
//  ViewController.swift
//  DashboardFeyzaTopgul
//
//  Created by fyz on 3/17/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textDisplay: UILabel!
    
    @IBAction func controlActivated (control: UIControl) {
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            self.textDisplay.text = appDel.dataFetcher?.nextTitle
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let appDel = UIApplication.shared.delegate as? AppDelegate {
            self.textDisplay.text = appDel.dataFetcher?.currentTitle
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

