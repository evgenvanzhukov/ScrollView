//
//  InitialViewController.swift
//  ScrollView
//
//  Created by Evgen on 09.01.2023.
//  Copyright © 2023 Evgen. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var manualButton: UIButton!
    var storyboardButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addButtons()
        configureButtons()
        showManualScroll(manualButton) // Todo: не забыть удалить
    }
    

    func addButtons() {
        manualButton = UIButton()
        view.addSubview(manualButton)
        
        manualButton.translatesAutoresizingMaskIntoConstraints = false
        manualButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        manualButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        storyboardButton = UIButton()
        view.addSubview(storyboardButton)
        storyboardButton.translatesAutoresizingMaskIntoConstraints = false
        storyboardButton.topAnchor.constraint(equalTo: manualButton.bottomAnchor, constant: 100).isActive = true
        storyboardButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func configureButtons() {
        
        manualButton.backgroundColor = .darkGray
        manualButton.setTitle("Coded", for: .normal)
        manualButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 15)
        manualButton.titleLabel?.textColor = .white
        manualButton.layer.cornerRadius = 5
        manualButton.layer.borderWidth = 2
        manualButton.layer.borderColor = UIColor.black.cgColor
        manualButton.addTarget(self, action: #selector(showManualScroll), for: .touchUpInside)

        
        storyboardButton.backgroundColor = .systemBlue
        storyboardButton.setTitle("Storyboarded", for: .normal)
        storyboardButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 15)
        storyboardButton.titleLabel?.textColor = .white
        storyboardButton.layer.cornerRadius = 5
        storyboardButton.layer.borderWidth = 2
        storyboardButton.layer.borderColor = UIColor.black.cgColor
        storyboardButton.addTarget(self, action: #selector(showStoryboardedScroll), for: .touchUpInside)
    }
    
    @objc
    func showStoryboardedScroll(_ sender: UIButton) {
        let scrollViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: StoryboardScrollController.self)) as! StoryboardScrollController
        self.navigationController?.pushViewController(scrollViewController, animated: true)
    }
    
    @objc
    func showManualScroll(_ sender: UIButton) {
        let scrollViewController = ManualScrollController()
        self.navigationController?.pushViewController(scrollViewController, animated: true)
    }
}
