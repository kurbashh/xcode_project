//
//  ProductCollectionViewCell.swift
//  KaspiCloneApp2
//
//  Created by Kurbash on 26.08.2024.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    
    @IBOutlet weak var ProductCategory: UILabel!
    @IBOutlet weak var ProductName: UILabel!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
        ProductImage.contentMode = .scaleAspectFill
        ProductImage.clipsToBounds = true
    }
    
    func configure(with product: Product){
        ProductImage.image = UIImage(named: product.imageName)
        ProductName.text = product.name
        ProductPrice.text = product.price
        ProductCategory.text = product.category
    }
}
