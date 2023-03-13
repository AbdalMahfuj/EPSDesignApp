//
//  ViewController.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 3/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    let firstCellTtile = "Fund Transfer"
    let secCellTtile = "Bill Pay"
    var colors = [UIColor]()
    var banks = [String]()
    var utility = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.register(UINib(nibName: "FundTableViewCell", bundle: nil), forCellReuseIdentifier: "FundTableViewCell")
        myTableView.register(UINib(nibName: "BillTableViewCell", bundle: nil), forCellReuseIdentifier: "BillTableViewCell")
        self.myTableView.estimatedRowHeight = 100
        
        DispatchQueue.main.asyncAfter(deadline: .now() ){
            self.colors = [UIColor.green, UIColor.red, UIColor.gray, UIColor.yellow, UIColor.blue, UIColor.red, UIColor.gray, UIColor.cyan, UIColor.brown]
            self.banks = ["DBBL", "UCB", "Sonali", "Rupali", "City", "IFIC", "Islami", "Jamuna", "Janata"]
            self.utility = ["Gas", "Water", "Electricity",
                            "Internet", "Recharge", "Phone",
                            "School", "Others"]
            self.myTableView.reloadData()
        }
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            2
    }
    
    // cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "FundTableViewCell", for: indexPath) as! FundTableViewCell
            cell.config(banks: banks)
            return cell
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "BillTableViewCell", for: indexPath) as! BillTableViewCell
            cell.billCollectionView.reloadData()
            cell.config(utility: utility)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
