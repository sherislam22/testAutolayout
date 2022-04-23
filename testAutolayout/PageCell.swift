//
//  PageCell.swift
//  testAutolayout
//
//  Created by sher on 23/4/22.
//

import UIKit

class PageCell: UICollectionViewCell {
    let imageView = UIImageView(image: UIImage(named: "1"))
    let topContainerView = UIView()
    var textfield: UITextView = {
        let textField = UITextView()
        textField.text = "Cafe Figma "
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isScrollEnabled = false
        textField.isEditable = false
        return textField
    }()
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            imageView.image = UIImage(named: unwrappedPage.imageUrl)
            let AttributedText = NSMutableAttributedString(string:unwrappedPage.title, attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-bold", size: 18) as Any])
            AttributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.descrption)", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-bold", size: 13) as Any,NSAttributedString.Key.foregroundColor: UIColor.gray as Any]))
            textfield.attributedText = AttributedText
            textfield.contentMode = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(textfield)
        setupImageLAyout()
    }
    
    
    private func setupImageLAyout() {
        
        addSubview(topContainerView)
        topContainerView.addSubview(imageView)
       //------------------
       // image
       imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
       imageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
       
       imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
       imageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
       
       //------------------
       
       topContainerView.backgroundColor = .clear
        topContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
       topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
       topContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
       topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
       topContainerView.layer.cornerRadius = 20
       //------------------
       // description
        
       
       textfield.topAnchor.constraint(equalTo: topContainerView.bottomAnchor,constant: 20).isActive = true
        textfield.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0).isActive = true
//
        textfield.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 24).isActive = true
        textfield.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
       //------------------
   }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
