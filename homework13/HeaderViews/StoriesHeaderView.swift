//
//  StoriesHeaderView.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 30.01.2023.
//

import UIKit

class StoriesHeaderView: UIView, UICollectionViewDelegate {
    
    var height: CGFloat = 0
    
    let storiesCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        
        collection.backgroundColor = .clear
        collection.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupProperts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        backgroundColor = .black
        self.storiesCollectionView.delegate = self
        self.storiesCollectionView.dataSource = self
    }
    
    private func setupLayout() {
        addSubview(storiesCollectionView)
        
        NSLayoutConstraint.activate([
            storiesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            storiesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            storiesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            storiesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension StoriesHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = CGFloat(collectionView.frame.size.width/4.8)
        
        return CGSize(
            width: width,
            height: width
        )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}

extension StoriesHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifire, for: indexPath) as! StoriesCollectionViewCell
        cell.setupCorners()
        return cell
    }
}

