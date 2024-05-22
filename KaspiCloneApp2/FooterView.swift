//
//  FuterView.swift
//  KaspiCloneApp2
//
//  Created by Kurbash on 25.08.2024.
//

import Foundation
import UIKit


class FooterView: UIView{
    
    
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let button3 = UIButton(type: .system)
    private let button4 = UIButton(type: .system)
    
    private let stackView = UIStackView()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        
        button1.setImage(UIImage(named: "homeIcon"), for: .normal)
        button2.setImage(UIImage(named: "profile"), for: .normal)
        button3.setImage(UIImage(named: "notification"), for: .normal)
        button4.setImage(UIImage(named: "services"), for: .normal)
        
        button1.imageView?.contentMode = .scaleAspectFit
        button2.imageView?.contentMode = .scaleAspectFit
        button3.imageView?.contentMode = .scaleAspectFit
        button4.imageView?.contentMode = .scaleAspectFit
        button1.tintColor = .black
        button2.tintColor = .black
        button3.tintColor = .black
        button4.tintColor = .black
        
        
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        
        addSubview(stackView)
        setupConstraints()
        
        
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        button4.addTarget(self, action: #selector(button4Tapped), for: .touchUpInside)
        
    }
    private func setupConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),])
    }
    
    
    @objc private func button1Tapped() {
        if let viewController = findViewController() {
            print("кнопка работает")
            let homeVC = ViewController()
            viewController.navigationController?.pushViewController(homeVC, animated: true)
            print("Проверка, нынешняя страница после нажатия: \(homeVC)")
        }
    }
    
    @objc private func button2Tapped() {
        if let viewController = findViewController() {
            print("кнопка работает")
            let profileVC = ViewController()
            viewController.navigationController?.pushViewController(profileVC, animated: true)
            print("Проверка, нынешняя страница после нажатия: \(profileVC)")
        }
    }
    
    @objc private func button3Tapped() {
        if let viewController = findViewController() {
            print("кнопка работает")
            let notificationsVC = ViewController()
            viewController.navigationController?.pushViewController(notificationsVC, animated: true)
            print("Проверка, нынешняя страница после нажатия: \(notificationsVC)")
        }
    }
    
    @objc private func button4Tapped() {
        if let viewController = findViewController() {
            print("кнопка работает")
            let servicesVC = ViewController()
            viewController.navigationController?.pushViewController(servicesVC, animated: true)
        }
    }
    
}
