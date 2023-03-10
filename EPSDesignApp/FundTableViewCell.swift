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
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var colors = [UIColor]()
    var banks = [String]()
    
    func createCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let screenWidth              = UIScreen.main.bounds.width - 20 // 20 is collectionView's trailing,leading
        let padding: CGFloat                = 0
        let minimumInterimSpacing: CGFloat  = 10
        let minimumLineSpace:CGFloat        = 20
        
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
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing  = minimumInterimSpacing
        flowLayout.minimumLineSpacing       = minimumLineSpace
        flowLayout.sectionInset             = .zero//UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize                 = CGSize(width: itemWidth, height:  fundCollectionView.frame.height)
        
        return flowLayout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fundCollectionView.register(UINib(nibName: "BankCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BankCollectionViewCell")
        fundCollectionView.delegate = self
        fundCollectionView.dataSource = self
        fundCollectionView.collectionViewLayout = createCollectionViewFlowLayout()
        fundCollectionView.reloadData()
    }
    
    func config(banks: [String], colors: [UIColor]) {
        self.banks = banks
        self.colors = colors
        fundCollectionView.reloadData()
    }
}

extension FundTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    //sizeForItemAt
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: 128*2, height: 128)
    //    }
    
    // minimumInteritemSpacingForSectionAt
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        0
    //    }
    
    // minimumLineSpacingForSectionAt
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        10
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fundCollectionView.dequeueReusableCell(withReuseIdentifier: "BankCollectionViewCell", for: indexPath) as! BankCollectionViewCell
        cell.configure(name: banks[indexPath.row], color: colors[indexPath.row])
        return cell
    }
    
    
}
