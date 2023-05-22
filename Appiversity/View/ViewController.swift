//
//  ViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginTitle()
    }
    
    func setupLoginTitle(){
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }
}

