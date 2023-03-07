//
//  UtilityCollectionViewCell.swift
//  EPSDesignApp
//
//  Created by MANHA on 7/3/23.
//

import UIKit

class UtilityCollectionViewCell: UICollectionViewCell {
  
    var itemWidth:CGFloat = 0
    var itemHeight:CGFloat = 0
    var interSpace:CGFloat = 12 // act as middle gap between cell in case of vertical collection, and as line space in case of horizontal collection
    var lineSpace:CGFloat = 20  // inverse case
    var padding:CGFloat = 10
    let numberOfItemsInRow:CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 3
    
    @IBOutlet weak var utilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUI(utility: String) {
        utilityLabel.text = utility
    }
}
