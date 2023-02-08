//
//  ActuallsCollectionViewCell.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 06.02.2023.
//

import UIKit

final class ActuallsCollectionViewCell: UICollectionViewCell {
    
    private let actuallsCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.register(ActuallCollectionViewCell.self, forCellWithReuseIdentifier: ActuallCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperts()
        setupLayout()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperts() {
        actuallsCollectionView.delegate = self
        actuallsCollectionView.dataSource = self
    }
    
    private func setupLayout() {
        addSubview(actuallsCollectionView)
        
        NSLayoutConstraint.activate([
            actuallsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            actuallsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            actuallsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actuallsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension ActuallsCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (frame.width - 8 )/5
        let height = frame.height - 8
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
}

extension ActuallsCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActuallCollectionViewCell.identifire, for: indexPath) as! ActuallCollectionViewCell
        return cell
    }
}
