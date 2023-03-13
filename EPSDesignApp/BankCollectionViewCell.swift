//
//  BankCollectionViewCell.swift
//  EPSDesignApp
//
//  Created by MANHA on 7/3/23.
//

import UIKit

class BankCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bankImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCollectionView(name: String) {
        bankImg.image = UIImage(named: name)
    }
}
