//
//  NavigationBar.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit
import SnapKit


class NavigationController: UINavigationController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    lazy var rightFirstButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        button.tintColor = .gray
        return button
    } ()
    
    lazy var rightSecondButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        button.tintColor = .gray
        return button
    } ()
    
    lazy var titleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }

    func setUpNavigationBar() {
        
        navigationBar.addSubview(titleView)
        
        titleView.addSubview(rightFirstButton)
        titleView.addSubview(rightSecondButton)
        titleView.addSubview(searchBar)
        
        titleView.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(40)
            make.centerX.equalTo(self.navigationBar.snp.centerX)
            make.centerY.equalTo(self.navigationBar.snp.centerY)
        }
        
        rightFirstButton.snp.makeConstraints { make in
            make.trailing.equalTo(rightSecondButton.snp.leading).offset(-8)
            make.centerY.equalTo(titleView)
            make.width.height.equalTo(40)
        }
        
        rightSecondButton.snp.makeConstraints { make in
            make.trailing.equalTo(titleView.snp.trailing).offset(-16)
            make.centerY.equalTo(titleView)
            make.width.height.equalTo(40)
        }
        
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.centerY.equalTo(self.navigationBar.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(rightFirstButton.snp.leading).offset(-8)
        }
    }
}
