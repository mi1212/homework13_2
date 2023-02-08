//
//  ProfileViewController.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 06.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.register(ProfileHeaderViewCell.self, forCellWithReuseIdentifier: ProfileHeaderViewCell.identifire)
        collection.register(PropertsCollectionViewCell.self, forCellWithReuseIdentifier: PropertsCollectionViewCell.identifire)
        collection.register(ActuallsCollectionViewCell.self, forCellWithReuseIdentifier: ActuallsCollectionViewCell.identifire)
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifire)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProperts()
        setupLayout()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        profileCollectionView.layoutIfNeeded()
    }
    
    private func setupProperts() {
        view.backgroundColor = .black
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
    }
    
    private func setupLayout() {
        view.addSubview(profileCollectionView)
        
        NSLayoutConstraint.activate([
            profileCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .systemTeal
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let dotsButtonItem = UIBarButtonItem(title: "...", style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = dotsButtonItem
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0: // размеры хидера
            let width = view.frame.width
            let height = view.frame.height/3.6
            return CGSize(width: width, height: height)
        case 1: // размеры раздела "актуальное"
            let width = view.frame.width
            let height = view.frame.height/9
            return CGSize(width: width, height: height)
        case 2: // размеры раздела "актуальное"
            let width = view.frame.width
            let height = view.frame.height/18
            return CGSize(width: width, height: height)
        case 3: // размеры фотографий
            let width = (view.frame.width - 3)/3
            return CGSize(width: width, height: width)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 18
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0: // ячейка хидера
            let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileHeaderViewCell.identifire, for: indexPath)
            
            return cell
        case 1: // ячейка актульного
            let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ActuallsCollectionViewCell.identifire, for: indexPath)
            
            return cell
        case 2: // ячейка свойст фотоколлекции фото/видео/сомной
            let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: PropertsCollectionViewCell.identifire, for: indexPath)
            
            return cell
        case 3: // ячейка фотографий
            let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifire, for: indexPath) as! PhotoCollectionViewCell
            cell.setupImage(indexPath: indexPath)
            return cell
        default:
            let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileHeaderViewCell.identifire, for: indexPath)
            
            return cell
        }
        
        
    }
}
