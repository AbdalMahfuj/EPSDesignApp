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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(title: String) {
        fundtitleLabel.text = title
    }
}
