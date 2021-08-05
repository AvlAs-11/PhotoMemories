//
//  PlusButton.swift
//  PhotoTest
//
//  Created by Pavel Avlasov on 01.08.2021.
//

import UIKit

class PlusButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .white
        self.setBackgroundImage(UIImage(named: "plusButtonImage"), for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -3, height: 3)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 0.5 * self.bounds.height
    }
    
    func setupAnchors(view: UIView) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        self.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
    }
}
