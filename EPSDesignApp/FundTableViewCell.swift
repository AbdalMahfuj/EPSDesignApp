//
//  FundTableViewCell.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 3/7/23.
//

import UIKit

class FundTableViewCell: UITableViewCell {

    @IBOutlet weak var fundtitleLabel: UILabel!
    @IBOutlet weak var fundCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fundCollectionView.register(UINib(nibName: "BankCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BankCollectionViewCell")
        fundCollectionView.delegate = self
        fundCollectionView.dataSource = self
        fundCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(title: String) {
        fundtitleLabel.text = title
    }
}

extension FundTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fundCollectionView.dequeueReusableCell(withReuseIdentifier: "BankCollectionViewCell", for: indexPath) as! BankCollectionViewCell
        cell.setUI(name: "DBBL")
        return cell
    }
    
    
}
