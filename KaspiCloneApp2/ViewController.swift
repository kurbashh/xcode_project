//
//  ViewController.swift
//  KaspiCloneApp2
//
//  Created by admin on 22.05.2024.
//

import UIKit

struct News {
    let image: UIImage
}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }
}

struct TwoRowCarouselItems {
    let title: String
    let view: String
}


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var ProductCarousel: UICollectionView!
    @IBOutlet weak var FooterView: FooterView!
    
    @IBOutlet weak var TwoRowCarousel: UICollectionView!
    
    @IBOutlet weak var headerView: HeaderView!
    
    @IBOutlet weak var firstRowButtonsStackView: UIStackView!
    
    @IBOutlet weak var secondRowButtonsStackView: UIStackView!
    
    var news: [News] = []
    var carouselItems: [TwoRowCarouselItems] = []
    
    private var products: [Product] = []
    private var displayedProducts: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ProductCarousel.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        TwoRowCarousel.register(UINib(nibName: "TwoRowCarouselCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCell")
        
        
        ProductCarousel.dataSource = self
        ProductCarousel.delegate = self
        setupProductCollectionView()
        loadProduct()
        displayRandomProducts()
        
        
        TwoRowCarousel.dataSource = self
        TwoRowCarousel.delegate = self
        
        let news1 = News(image: UIImage(named: "image1")!)
        let news2 = News(image: UIImage(named: "image2")!)
        let news3 = News(image: UIImage(named: "image1")!)
        let news4 = News(image: UIImage(named: "image2")!)
        
        let item1 = TwoRowCarouselItems(title: "Рассрочка", view: "0-0-24")
        let item2 = TwoRowCarouselItems(title: "Рассрочка", view: "0-0-14")
        let item3 = TwoRowCarouselItems(title: "Карта", view: "RED")
        let item4 = TwoRowCarouselItems(title: "KCard", view: "Kids")
        let item5 = TwoRowCarouselItems(title: "Карта", view: "RED")
        let item6 = TwoRowCarouselItems(title: "KCard", view: "Kids")
        
        
        carouselItems = [item1, item2, item3, item4, item5, item6]
        
        TwoRowCarousel.reloadData()
        if let layout = TwoRowCarousel.collectionViewLayout as? UICollectionViewFlowLayout {
                    layout.scrollDirection = .horizontal
                    layout.itemSize = CGSize(width: 100, height: 100) // Adjust size as needed
                    layout.minimumLineSpacing = 10 // Adjust spacing as needed
                    layout.minimumInteritemSpacing = 10
                }
        
        news = [news1, news2, news3, news4]
        
        headerView.news = news
        
        setupButtonStackViews()
    }
    
    func setupButtonStackViews() {
        firstRowButtonsStackView.axis = .horizontal
        secondRowButtonsStackView.axis = .horizontal
        
        firstRowButtonsStackView.spacing = 14
        secondRowButtonsStackView.spacing = 14
        
        firstRowButtonsStackView.alignment = .fill
        firstRowButtonsStackView.distribution = .fillEqually
        secondRowButtonsStackView.alignment = .fill
        secondRowButtonsStackView.distribution = .fillEqually
        
        firstRowButtonsStackView.addBackground(color: .systemGray6)
        secondRowButtonsStackView.addBackground(color: .systemGray6)
        
        for _ in 0..<4 {
            let button = UIButton()
            button.setImage(UIImage(named: "button1"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            firstRowButtonsStackView.addArrangedSubview(button)
            
            button.widthAnchor.constraint(equalToConstant: 62).isActive = true
            button.heightAnchor.constraint(equalToConstant: 62).isActive = true
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
        
        for _ in 0..<4 {
            let button = UIButton()
            button.setImage(UIImage(named: "button1"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            secondRowButtonsStackView.addArrangedSubview(button)
            
            button.widthAnchor.constraint(equalToConstant: 62).isActive = true
            button.heightAnchor.constraint(equalToConstant: 62).isActive = true
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
    
    func setupProductCollectionView(){
        let layout = ProductCarousel.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 150, height: 200)
        ProductCarousel.showsHorizontalScrollIndicator = false
    }
    
    private func loadProduct(){
        products = [
            Product(name: "Apple MacBook Air 2020", price: "399 999", category: "Ноутбуки", imageName: "button1"),
            Product(name: "Apple MacBook Air 2020", price: "401 000", category: "Ноутбуки", imageName: "button1"),
            Product(name: "Apple MacBook Air 2020", price: "502 999", category: "Ноутбуки", imageName: "button1"),
            Product(name: "Apple MacBook Air 2020", price: "522 999", category: "Ноутбуки", imageName: "button1"),
            Product(name: "Apple MacBook Air 2020", price: "532 399", category: "Ноутбуки", imageName:  "button1")
            
        ]
        print("Products loaded: \(products.count)")
        ProductCarousel.reloadData()
    }
    
    
    
    private func displayRandomProducts() {
            displayedProducts = products.shuffled().prefix(10).map { $0 }
            ProductCarousel.reloadData()
        }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ToNextScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToNextScreen" {
            // Подготовка к переходу на новый экран, если необходимо
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == TwoRowCarousel {
            return carouselItems.count
        } else if collectionView == ProductCarousel{
            print("Products count: \(products.count)")
            return products.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == TwoRowCarousel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as! TwoRowCarouselCell
            let item = carouselItems[indexPath.row]
            cell.configure(with: item)
            return cell
            
        } else if collectionView == ProductCarousel{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
            let product = products[indexPath.item]
            cell.configure(with: product)
            return cell
            
        }
        return UICollectionViewCell()
    }
    

}



    
    
    

