//
//  BillTableViewCell.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 3/7/23.
//

import UIKit

class BillTableViewCell: UITableViewCell {
   
    @IBOutlet weak var billTitleLabel: UILabel!
    @IBOutlet weak var billCollectionView: UICollectionView!
    @IBOutlet weak var billCollectionViewHeight: NSLayoutConstraint!
    
    /*func createCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let screenWidth              = UIScreen.main.bounds.width - 20 // 20 is collectionView's trailing,leading
        let padding: CGFloat                = 0
        let minimumInterimSpacing: CGFloat  = 10
        let minimumLineSpace:CGFloat        = 10
        
        // Updated this to a var
        var availableWidth                  = 0.0
        
        var numberOfColumn: CGFloat
        
        // 375 is iPhone SE width
        if UIDevice.current.userInterfaceIdiom == .pad {
            numberOfColumn = 4
            // Update the width available as well
        } else {
            numberOfColumn = 3
        }
        
        availableWidth = screenWidth - (padding * 2) - (minimumLineSpace * (numberOfColumn - 1))
        
        let itemWidth                       = availableWidth / numberOfColumn
        print(numberOfColumn)
        print(itemWidth)
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing  = minimumInterimSpacing
        flowLayout.minimumLineSpacing       = minimumLineSpace
        flowLayout.sectionInset             = .zero//UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemWidth)
        print(itemWidth)
        return flowLayout
    } */

    override func awakeFromNib() {
        super.awakeFromNib()
        billCollectionView.register(UINib(nibName: "UtilityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UtilityCollectionViewCell")
        billCollectionView.delegate = self
        billCollectionView.dataSource = self
        //billCollectionView.collectionViewLayout = createCollectionViewFlowLayout()
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

extension BillTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = billCollectionView.dequeueReusableCell(withReuseIdentifier: "UtilityCollectionViewCell", for: indexPath) as! UtilityCollectionViewCell
        //cell.frame.height = ceil(20.0/4.0) * 192.5
        cell.setUI(utility: "Gas")
        return cell
    }
    
    // sizeForItemAt
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: billCollectionView.frame.size.width , height: billCollectionView.frame.size.width * 2)
//    }

    
}
