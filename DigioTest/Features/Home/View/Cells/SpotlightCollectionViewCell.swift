//
//  SpotlightCollectionViewCell.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit
import Nuke

class SpotlightCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.normalSpacing),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Spacing.normalSpacing),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupCell(image: String) {
        if let urlImg: URL = URL(string: image) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            Nuke.loadImage(with: request!, into: imageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

