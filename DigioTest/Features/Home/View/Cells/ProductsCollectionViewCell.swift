//
//  ProductsCollectionViewCell.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    let conteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        conteinerView.backgroundColor = UIColor.white
        conteinerView.layer.masksToBounds = true
        conteinerView.layer.cornerRadius = 15
        conteinerView.dropShadow()
        return conteinerView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(conteinerView)
        conteinerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: topAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.normalSpacing),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Spacing.normalSpacing),
            conteinerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Size.productSize),
            imageView.heightAnchor.constraint(equalToConstant: Size.productSize)
        ])
    }
    func setupCell(image: String) {
        imageView.loadImage(imageUrl: image)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
