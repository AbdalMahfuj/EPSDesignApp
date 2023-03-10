//
//  BankCollectionViewCell.swift
//  EPSDesignApp
//
//  Created by MANHA on 7/3/23.
//

import UIKit

class BankCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(name: String, color: UIColor) {
        bankLabel.text = name
        self.backgroundColor = color
    }
}
