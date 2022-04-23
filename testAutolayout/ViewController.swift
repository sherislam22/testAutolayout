//
//  ViewController.swift
//  testAutolayout
//
//  Created by sher on 20/4/22.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "1"))
    var textfield: UITextView = {
        let textField = UITextView()
        textField.text = "Cafe Figma "
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isScrollEnabled = false
        textField.isEditable = false
        return textField
    }()
    let prewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prew", for: .normal)
        button.attributedTitle(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-bold", size: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    let NextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.attributedTitle(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-bold", size: 14)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        return button
    }()
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(textfield)
        view.addSubview(prewButton)
        setupImageLAyout()
        setupButtonlayout()
    }
    
        let pageControl: UIPageControl = {
            let pc = UIPageControl()
            pc.currentPage = 0
            pc.numberOfPages = 4
            pc.currentPageIndicatorTintColor = .red
            pc.tintColor = .gray
            return pc
        }()
    
    private func setupButtonlayout() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prewButton, pageControl, NextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)
        ])
    }
    
     private func setupImageLAyout() {
         let topContainerView = UIView()
         topContainerView.addSubview(imageView)
         view.addSubview(topContainerView)
        
        // container top
        //------------------
        // image
        imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        
        //------------------
        
        topContainerView.backgroundColor = .clear
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainerView.layer.cornerRadius = 20
        //------------------
        // description
        let AttributedText = NSMutableAttributedString(string: "Join us today in our fun and games! ", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-bold", size: 18) as Any])
        AttributedText.append(NSMutableAttributedString(string: "Are you ready for loads and loads for fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-bold", size: 13) as Any,NSAttributedString.Key.foregroundColor: UIColor.gray as Any]))
        textfield.attributedText = AttributedText
        textfield.topAnchor.constraint(equalTo: topContainerView.bottomAnchor,constant: 20).isActive = true
         textfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24).isActive = true
         textfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        //------------------
    }

}
