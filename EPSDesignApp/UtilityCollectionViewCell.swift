//
//  UtilityCollectionViewCell.swift
//  EPSDesignApp
//
//  Created by MANHA on 7/3/23.
//

import UIKit

class UtilityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var utilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUI(utility: String) {
        utilityLabel.text = utility
    }
}
