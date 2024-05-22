//
//  TwoRowCarouselCell.swift
//  KaspiCloneApp2
//
//  Created by Kurbash on 25.08.2024.
//

import Foundation
import UIKit

class TwoRowCarouselCell: UICollectionViewCell {
    @IBOutlet weak var topLeftContainer: UIView!
    
    @IBOutlet weak var LabelCell1: UILabel!
    
    @IBOutlet weak var LabelCell2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        // Убедимся, что Auto Layout используется для всех элементов
        topLeftContainer.translatesAutoresizingMaskIntoConstraints = false
        LabelCell1.translatesAutoresizingMaskIntoConstraints = false
        LabelCell2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // topLeftContainer (содержит LabelCell1)
            topLeftContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topLeftContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            topLeftContainer.trailingAnchor.constraint(equalTo: LabelCell1.leadingAnchor, constant: -8),
            topLeftContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // LabelCell1 внутри topLeftContainer
            LabelCell2.topAnchor.constraint(equalTo: topLeftContainer.topAnchor),
            LabelCell2.leadingAnchor.constraint(equalTo: topLeftContainer.leadingAnchor),
            LabelCell2.trailingAnchor.constraint(equalTo: topLeftContainer.trailingAnchor),
            LabelCell2.bottomAnchor.constraint(equalTo: topLeftContainer.bottomAnchor),
            
            // LabelCell2 справа от LabelCell1
            LabelCell1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            LabelCell1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            // Важный констрейнт для выравнивания LabelCell1 и LabelCell2 по вертикали
            LabelCell1.leadingAnchor.constraint(equalTo: topLeftContainer.trailingAnchor, constant: 8)
        ])
        
        topLeftContainer.layer.cornerRadius = 4
        
    
        
    
        
        func setInsets(for label: UILabel, with text: String){
            let paragraphyStyle = NSMutableParagraphStyle()
            paragraphyStyle.alignment = .center
            let attributeString = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphyStyle,
                .backgroundColor: UIColor.red,
                .foregroundColor: UIColor.white,
                .font: label.font
            ]
        )
        let padding = 4
        let insetText = NSAttributedString(string: " \(text) ", attributes: [
                .font: label.font,
                .foregroundColor: label.textColor
            ])
            label.attributedText = insetText
            label.backgroundColor = .red
            label.layer.masksToBounds = true
                                                
        }
    }
    
    func configure(with item: TwoRowCarouselItems) {
        LabelCell1.text = item.title
        LabelCell2.text = item.view
    }
    
    
}
