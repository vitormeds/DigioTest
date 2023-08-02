//
//  UIImageViewExtension.swift
//  DigioTest
//
//  Created by Vitor Mendes on 02/08/23.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(imageUrl: String) {
        if let urlImg: URL = URL(string: imageUrl) {
            let request: ImageRequest? = ImageRequest(urlRequest: URLRequest(url: urlImg))
            let options = ImageLoadingOptions(
                placeholder: DigioTestAssets.noImageIcon.image,
                transition: .fadeIn(duration: 0)
            )
            Nuke.loadImage(with: request!, options: options, into: self)
        }
    }
}
