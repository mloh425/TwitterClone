//
//  ViewController.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/3/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

//MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource {
  
}