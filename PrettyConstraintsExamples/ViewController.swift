//
//  ViewController.swift
//  PrettyConstraintsExamples
//
//  Created by Hardik Parmar on 30/10/20.
//

import UIKit
import PrettyConstraints

class ViewController: UIViewController {
    
    let containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let label:UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
    }
    
    func setUpUI() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(containerView)
        
        containerView.applyConstraints(.fitInSafeArea(self.view.safeAreaLayoutGuide))
        
        containerView.addSubview(label)
        
        label.applyConstraints(.center(in: self.view),
                               .leading(to: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10, equality: .greaterThanOrEqual),
                               .trailing(to: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10, equality: .lessThanOrEqual))
        
    }
    
}

