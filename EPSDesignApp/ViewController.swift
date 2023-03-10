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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.register(UINib(nibName: "FundTableViewCell", bundle: nil), forCellReuseIdentifier: "FundTableViewCell")
        myTableView.register(UINib(nibName: "BillTableViewCell", bundle: nil), forCellReuseIdentifier: "BillTableViewCell")
        myTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.colors = [UIColor.green, UIColor.red, UIColor.gray, UIColor.yellow, UIColor.blue, UIColor.red, UIColor.gray, UIColor.cyan, UIColor.brown]
            self.banks = ["DBBL", "UCB", "Sonali", "Rupali", "City", "IFIC", "Islami", "Jamuna", "Janata"]
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
//        section == 0 ? 3 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "FundTableViewCell", for: indexPath) as! FundTableViewCell
            cell.config(banks: banks,colors: colors)
//            cell.contentView.backgroundColor = indexPath.section == 0 ? .red : .yellow
            return cell
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "BillTableViewCell", for: indexPath) as! BillTableViewCell
            myTableView.estimatedRowHeight = 44
            myTableView.rowHeight = UITableView.automaticDimension
            cell.setUI(title: secCellTtile)
            return cell
        }
    }
}
