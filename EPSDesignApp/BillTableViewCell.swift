//
//  BillTableViewCell.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 3/7/23.
//

import UIKit

class BillTableViewCell: UITableViewCell {
//jhj
    @IBOutlet weak var billTitleLabel: UILabel!
    @IBOutlet weak var billCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        billCollectionView.register(UINib(nibName: "UtilityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UtilityCollectionViewCell")
        billCollectionView.delegate = self
        billCollectionView.dataSource = self
        billCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(title: String) {
        billTitleLabel.text = title
    }
    
}

extension BillTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = billCollectionView.dequeueReusableCell(withReuseIdentifier: "UtilityCollectionViewCell", for: indexPath) as! UtilityCollectionViewCell
        cell.setUI(utility: "Gas")
        return cell
    }
    
    
}
