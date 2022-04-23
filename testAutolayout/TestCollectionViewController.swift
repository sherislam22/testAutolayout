//
//  TestCollectionViewController.swift
//  testAutolayout
//
//  Created by sher on 23/4/22.
//

import UIKit

class TestCollectionViewController: UICollectionViewController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { _
            in
               self.collectionViewLayout.invalidateLayout()
            let indexPAth = IndexPath(item: self.pageControl.currentPage, section: 0)
               self.collectionView.scrollToItem(at: indexPAth, at: .centeredHorizontally, animated: true)
               
        }) {
            (_) in
        }
    }

    let pages = [Page(title: "Join us today in our fun and games!", imageUrl: "1", descrption: "Are you ready for loads and loads for fun? Don't wait any longer! We hope to see you in our stores soon."),
                 Page(title: "Join us today in our fun and games!", imageUrl: "2", descrption: "Are you ready for loads and loads for fun? Don't wait any longer! We hope to see you in our stores soon.")]
    
    let prewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prew", for: .normal)
        button.attributedTitle(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-bold", size: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(prewbutton), for: .touchUpInside)
        return button
    }()
    @objc  func prewbutton() {
        print("prew")
        let nextindex = max(pageControl.currentPage - 1 , 0)
        let indexPath = IndexPath(item: nextindex, section: 0)
        pageControl.currentPage = nextindex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.tintColor = .gray
        return pc
    }()
    let NextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.attributedTitle(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "AvenirNext-bold", size: 14)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self, action: #selector(nexthandler), for: .touchUpInside)
        return button
    }()
    
    @objc private func nexthandler() {
        print("next")
        let nextindex = min(pageControl.currentPage + 1 , pages.count - 1)
        let indexPath = IndexPath(item: nextindex, section: 0)
        pageControl.currentPage = nextindex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
    private func setupButtonlayout() {
        view.addSubview(prewButton)
        

        let bottomControlsStackView = UIStackView(arrangedSubviews: [prewButton, pageControl, NextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 30),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30)])
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonlayout()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    
}
extension TestCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
}
