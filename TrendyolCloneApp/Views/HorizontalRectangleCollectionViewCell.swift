//
//  HorizontalRectangleCollectionViewCell.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class HorizontalRectangleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!

    static let identifier = "HorizontalRectangleCollectionViewCell"
    static let nib = UINib(nibName: "HorizontalRectangleCollectionViewCell", bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
