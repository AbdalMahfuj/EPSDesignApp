//
//  BillTableViewCell.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 3/7/23.
//

import UIKit

class BillTableViewCell: UITableViewCell {
    private var itemWidth: CGFloat = 0
    private var itemHeight: CGFloat = 0
    private var padding: CGFloat = 0
    private var interGap: CGFloat = 0
    private var lineGap: CGFloat = 0

    @IBOutlet weak var billTitleLabel: UILabel!
    @IBOutlet weak var billCollectionView: UICollectionView!
    @IBOutlet weak var billCollectionViewHeight: NSLayoutConstraint!
    var utility = [String]()
    
  /*  func createCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let screenWidth              = UIScreen.main.bounds.width - 20 // 20 is collectionView's trailing,leading
        let padding: CGFloat                = 0
        let minimumInterimSpacing: CGFloat  = 10
        let minimumLineSpace:CGFloat        = 10
        
        // Updated this to a var
        var availableWidth : CGFloat        = 0.0
        
        var numberOfColumn: CGFloat         = 0.0
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            numberOfColumn = 4
            // Update the width available as well
        } else {
            numberOfColumn = 3
        }
        
        availableWidth = screenWidth - (padding * 2) - (minimumLineSpace * (numberOfColumn - 1))
        
        let itemWidth                       = availableWidth / numberOfColumn
        
        /// vertical collectionview height calculation
        var timeOfHeight = 9/numberOfColumn
        timeOfHeight = ceil(timeOfHeight)
        let cc :Int = Int(timeOfHeight)
        print("timeOfHeight: \(Int(cc))")
        
        billCollectionViewHeight.constant = itemWidth * CGFloat(cc)

        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing  = minimumInterimSpacing
        flowLayout.minimumLineSpacing       = minimumLineSpace
        flowLayout.sectdionInset             = .zero//UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height: itemWidth)
        print(itemWidth)
        return flowLayout
    }  */

    override func awakeFromNib() {
        super.awakeFromNib()
        billCollectionView.register(UINib(nibName: "UtilityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UtilityCollectionViewCell")
        billCollectionView.delegate = self
        billCollectionView.dataSource = self
        billCollectionView.reloadData()
    }

    
    func config(utility: [String]) {
        self.utility = utility
        
        let numberOfColumn: CGFloat =  UIDevice.current.userInterfaceIdiom == .pad ? 4.0 : 3.0
        interGap = 15.0
        lineGap = 30
        itemWidth = (UIScreen.main.bounds.width - 20 - 2.0 * padding - (numberOfColumn - 1.0) * interGap) / numberOfColumn
        itemHeight = itemWidth
        let rowsAndLines = rowAndLine(columns: Int(numberOfColumn), totalItem: utility.count)
        billCollectionViewHeight.constant = CGFloat(rowsAndLines.0) * itemHeight + CGFloat(rowsAndLines.1) * lineGap
        billCollectionView.reloadData()
    }
    
    /* calculate #row and #line gap  */
    func rowAndLine(columns: Int, totalItem: Int)->(Int, Int){
        let itemRow =  ceil((CGFloat(totalItem)/CGFloat(columns)))
        return (Int(itemRow), Int(itemRow-1))
    }
}

extension BillTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    ///numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        utility.count
    }
    
    /// cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = billCollectionView.dequeueReusableCell(withReuseIdentifier: "UtilityCollectionViewCell", for: indexPath) as! UtilityCollectionViewCell
        cell.setUI(utility: utility[indexPath.row])
        return cell
    }
    
    /// sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: itemWidth, height: itemHeight)
    }
    
    /// interGap
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        interGap
    }
    
    /// lineGap
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        lineGap
    }
    
    /// insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: padding, bottom: 0, right: padding)
    }
    
}
