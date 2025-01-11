//
//  LenghtRectangleCollectionViewCell.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class VerticalRectangleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    static let identifier = "VerticalRectangleCollectionViewCell"
    static let nib = UINib(nibName: "VerticalRectangleCollectionViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
