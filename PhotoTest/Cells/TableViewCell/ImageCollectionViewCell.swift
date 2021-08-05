//
//  ImageCollectionViewCell.swift
//  PhotoTest
//
//  Created by Pavel Avlasov on 02.08.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var selectImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeImage.addSubview(selectImage)
        self.layer.cornerRadius = 10
        selectImage.isHidden = true
        placeImage.translatesAutoresizingMaskIntoConstraints = false
        selectImage.translatesAutoresizingMaskIntoConstraints = false
        selectImage.rightAnchor.constraint(equalTo: placeImage.rightAnchor, constant: -5).isActive = true
        selectImage.leftAnchor.constraint(equalTo: placeImage.rightAnchor, constant: -15).isActive = true
        selectImage.topAnchor.constraint(equalTo: placeImage.topAnchor, constant: 0).isActive = true
        selectImage.bottomAnchor.constraint(equalTo: placeImage.topAnchor, constant: 15).isActive = true

        placeImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        placeImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        placeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        placeImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
    }

}
