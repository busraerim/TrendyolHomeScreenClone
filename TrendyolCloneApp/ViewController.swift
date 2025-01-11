//
//  ViewController.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var sectionList: [SectionModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSectionList()
        prepareCollectionView()
    }

    private func configureSectionList() {
        sectionList.append(SectionModel(itemCount: 1, sectionStyle: .notificationSection))
        sectionList.append(SectionModel(itemCount: 10, sectionStyle: .littleSquare))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .verticalRectangle))
        sectionList.append(SectionModel(itemCount: 17, sectionStyle: .verticalRectangle))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .horizontalRectangle))
        sectionList.append(SectionModel(itemCount: 3, sectionStyle: .nonSliderRectangle))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .verticalRectangle))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .verticalRectangle))
        sectionList.append(SectionModel(itemCount: 4, sectionStyle: .nonSliderRectangle))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .verticalRectangle))
        sectionList.append(SectionModel(itemCount: 3, sectionStyle: .nonSliderRectangle))
        sectionList.append(SectionModel(itemCount: 7, sectionStyle: .verticalRectangle))

    }
    
    private func prepareCollectionView() {
        let layout = makeCollectionViewLayout()
        collectionView.register(HeaderCollectionReusableView.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(NotificationCollectionViewCell.nib, forCellWithReuseIdentifier: NotificationCollectionViewCell.identifier)
        collectionView.register(LittleSquareCollectionViewCell.nib, forCellWithReuseIdentifier: LittleSquareCollectionViewCell.identifier)
        collectionView.register(VerticalRectangleCollectionViewCell.nib, forCellWithReuseIdentifier: VerticalRectangleCollectionViewCell.identifier)
        collectionView.register(HorizontalRectangleCollectionViewCell.nib, forCellWithReuseIdentifier: HorizontalRectangleCollectionViewCell.identifier)
        collectionView.register(NonSliderRectangleCollectionViewCell.nib, forCellWithReuseIdentifier: NonSliderRectangleCollectionViewCell.identifier)
        collectionView.collectionViewLayout = layout

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionList[section].itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sectionList[indexPath.section].sectionStyle {
        case .verticalRectangle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalRectangleCollectionViewCell.identifier, for: indexPath) as! VerticalRectangleCollectionViewCell
            cell.imageView.backgroundColor = generateRandomColor()
            return cell
        case .littleSquare:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LittleSquareCollectionViewCell.identifier, for: indexPath) as! LittleSquareCollectionViewCell
            cell.imageView.backgroundColor = generateRandomColor()
            return cell
        case .horizontalRectangle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalRectangleCollectionViewCell.identifier, for: indexPath) as! HorizontalRectangleCollectionViewCell
            cell.backView.backgroundColor = generateRandomColor()
            return cell
        case .nonSliderRectangle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NonSliderRectangleCollectionViewCell.identifier, for: indexPath) as! NonSliderRectangleCollectionViewCell
            cell.backgroundColor = generateRandomColor()
            return cell
        case .notificationSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotificationCollectionViewCell.identifier, for: indexPath) as! NotificationCollectionViewCell
            cell.backView.backgroundColor = generateRandomColor()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            switch sectionList[indexPath.section].sectionStyle {
            case .littleSquare, .nonSliderRectangle:
                headerView.seeAllButton.isHidden = true
            default:
                headerView.seeAllButton.isHidden = false
            }
            return headerView
        }
        return UICollectionReusableView()
    }
    
    
}

extension ViewController {
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            return self?.makeSliderLayoutSection(sectionIndex: sectionIndex)
        }
    }
    
    func createHeaderElement() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(45))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerElement.pinToVisibleBounds = false
        return headerElement
    }
    
    func createNotificationSectionLayout(sectionIndex: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createLittleSquareLayout(sectionIndex: Int) -> NSCollectionLayoutSection {
       let headerElement = createHeaderElement()
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),heightDimension: .fractionalHeight(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [headerElement]
        return section
    }
    
    func createVerticalRectangleLayout(sectionIndex: Int) -> NSCollectionLayoutSection {
        let headerElement = createHeaderElement()
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),heightDimension: .fractionalHeight(0.37))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createHorizontalRectangleLayout(sectionIndex: Int) -> NSCollectionLayoutSection {
        let headerElement = createHeaderElement()
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func createNonSliderRectangleLayout(sectionIndex: Int) -> NSCollectionLayoutSection {
        let headerElement = createHeaderElement()
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0)

        let count = sectionList[sectionIndex].itemCount
        let groupHeight = 0.25 * Double(count)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(groupHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: count)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func makeSliderLayoutSection(sectionIndex: Int) -> NSCollectionLayoutSection {
        switch sectionList[sectionIndex].sectionStyle {
        case .notificationSection:
            createNotificationSectionLayout(sectionIndex: sectionIndex)
        case .littleSquare:
            createLittleSquareLayout(sectionIndex: sectionIndex)
        case .verticalRectangle:
        createVerticalRectangleLayout(sectionIndex: sectionIndex)
        case .horizontalRectangle:
         createHorizontalRectangleLayout(sectionIndex: sectionIndex)
        case .nonSliderRectangle:
         createNonSliderRectangleLayout(sectionIndex: sectionIndex)
        }
    }
}
