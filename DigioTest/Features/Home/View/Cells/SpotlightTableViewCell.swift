//
//  SpotlightTableViewCell.swift
//  DigioTest
//
//  Created by Vitor Mendes on 01/08/23.
//

import UIKit

class SpotlightTableViewCell: UITableViewCell {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    var spotlights: [Spotlight] = []
    var openDetail: ((Spotlight) -> Void)?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollection()
        setupViews()
    }
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SpotlightCollectionViewCell.self,
                                forCellWithReuseIdentifier: SpotlightCollectionViewCell.description())
    }
    func setupViews() {
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Size.cardSize)
        ])
    }
    func setup(spotlights: [Spotlight], openDetail: @escaping (Spotlight) -> Void) {
        self.spotlights = spotlights
        self.openDetail = openDetail
        collectionView.reloadData()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SpotlightTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotlights.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SpotlightCollectionViewCell.description(),
            for: indexPath) as! SpotlightCollectionViewCell
        cell.setupCell(image: spotlights[indexPath.row].bannerURL)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (window?.screen.bounds.width ?? 0) - Spacing.bigSpacing, height: Size.cardSize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openDetail?(self.spotlights[indexPath.item])
    }
}
