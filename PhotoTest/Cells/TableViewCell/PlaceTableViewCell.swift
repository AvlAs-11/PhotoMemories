//
//  PlaceTableViewCell.swift
//  PhotoTest
//
//  Created by Pavel Avlasov on 1.08.21.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView?
    @IBOutlet weak var nextBackView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameOfCell: UITextView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    let numberOfItemsInSection = 3
    var numberOfSection = 1
    var needUpdate: (()->())?
    var picker:UIImagePickerController?=UIImagePickerController()
    
    func configure(text: String) {
        nameOfCell?.text = text
    }
    
    @IBAction func AddImage(_ sender: Any) {
        numberOfSection += 1
        imagesCollectionView.frame.size.height += CGFloat(200)
        nextBackView.frame.size.height += CGFloat(100)
        backView?.frame.size.height += CGFloat(100)
        contentView.frame.size.height += CGFloat(100)
        imagesCollectionView.reloadData()
//        imagesCollectionView.sizeToFit()
//        stackView.sizeToFit()
//
//        nextBackView.sizeToFit()
//        backView?.sizeToFit()
//        contentView.sizeToFit()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imagesCollectionView.backgroundColor = .black
        setupDefault()
        nameOfCell.delegate = self
        nameOfCell.textColor = .lightGray
        nameOfCell.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 40)
        nameOfCell.layer.cornerRadius = 10
        
        nameOfCell.addSubview(addImageButton)
        addImageButton.centerYAnchor.constraint(equalTo: nameOfCell.centerYAnchor, constant: 0).isActive = true
        addImageButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        
        
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        imagesCollectionView.register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
    }
    
    private func setupDefault() {
        backView?.layer.shadowColor = UIColor.lightGray.cgColor
        backView?.layer.shadowRadius = 5
        backView?.layer.cornerRadius = 20
        backView?.layer.shadowOpacity = 0.5
        backView?.layer.shadowPath = UIBezierPath(rect: CGRect(origin: CGPoint(x: 0
                                                                               , y: self.bounds.height - 10),
                                                               size: CGSize(width: self.bounds.width, height: 3))).cgPath
    }
}

extension PlaceTableViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let action = needUpdate {
            action()
//            imagesCollectionView.sizeToFit()
//            imagesCollectionView.reloadData()
//            imagesCollectionView.reloadData()
//            imagesCollectionView.sizeToFit()
//            stackView.sizeToFit()
//
//            nextBackView.sizeToFit()
//            backView?.sizeToFit()
//            contentView.sizeToFit()
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.textColor = .lightGray
            textView.text = "Name"
        }
        else {
            textView.textColor = .black
        }
    }
}

extension PlaceTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.frame.size.height = CGFloat(numberOfSection * 100)
//        nextBackView.sizeToFit()
//        backView?.sizeToFit()
//        stackView.sizeToFit()
        return numberOfItemsInSection
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        collectionView.frame.size.height = CGFloat(numberOfSection * 100)
//        nextBackView.sizeToFit()
//        backView?.sizeToFit()
//        stackView.sizeToFit()
//        collectionView.sizeToFit()
        return numberOfSection
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
//        stackView.sizeToFit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width = numberOfItemsInSection + 1 (4)
        //hieght = numberOfSection
//        return CGSize(width: collectionView.frame.width / CGFloat((numberOfItemsInSection + 1)), height: collectionView.frame.height / CGFloat(numberOfSection))
//        collectionView.frame.size.height = CGFloat(numberOfSection * 200)
//        collectionView.reloadData()
//        collectionView.sizeToFit()
//        nextBackView.sizeToFit()
//        backView?.sizeToFit()
//        stackView.sizeToFit()
        return CGSize(width: contentView.frame.width / CGFloat((numberOfItemsInSection + 1)), height:
        collectionView.frame.height / CGFloat(numberOfSection) - 10)
//        return CGSize(width: 100, height: 100)
    } 
}
