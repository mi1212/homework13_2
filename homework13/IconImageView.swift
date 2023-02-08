//
//  IconImageView.swift
//  homework13
//
//  Created by Mikhail Chuparnov on 31.01.2023.
//

import UIKit

final class IconImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        tintColor = .systemTeal
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
