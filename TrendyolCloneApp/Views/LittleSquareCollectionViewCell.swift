//
//  LittleSquareCollectionViewCell.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class LittleSquareCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "LittleSquareCollectionViewCell"
    static let nib = UINib(nibName: "LittleSquareCollectionViewCell", bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
