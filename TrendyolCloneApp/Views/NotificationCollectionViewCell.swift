//
//  NotificationCollectionViewCell.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    static let identifier = "NotificationCollectionViewCell"
    static let nib = UINib(nibName: "NotificationCollectionViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
