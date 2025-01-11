//
//  HeaderCollectionReusableView.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!

    static let identifier = "HeaderCollectionReusableView"
    static let nib = UINib(nibName: "HeaderCollectionReusableView", bundle: nil)
    
    var showSeeAllButton: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupHeaderView() {
        seeAllButton.isHidden = showSeeAllButton
    }
}
