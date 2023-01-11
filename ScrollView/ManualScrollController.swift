//
//  ManualScrollController.swift
//  ScrollView
//
//  Created by Evgen on 09.01.2023.
//  Copyright © 2023 Evgen. All rights reserved.
//

import UIKit

class ManualScrollController: UIViewController, UIScrollViewDelegate {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .red
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.text = TextLoader.load()
        label.backgroundColor = .white
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Good job", for: .normal)
        button.setTitle("Read to end", for: .disabled)
        button.isEnabled = false
        button.titleLabel?.textColor = .white
        button.backgroundColor = .darkGray
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
        configureView()
    }
    
    func configureLayout() {
        
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100).isActive = true
        
        scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        scrollView.addSubview(label)
        
        label.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor).isActive = true
        label.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
        
        containerView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func configureView() {
        scrollView.delegate = self
    }
    
    // MARK: - delegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)  {
        if scrollView.contentOffset.y > label.frame.height - view.bounds.height - button.bounds.height - (UIScreen.main.bounds.height / 3) {
            button.isEnabled = true
            button.backgroundColor = .systemBlue
        }
    }
}
