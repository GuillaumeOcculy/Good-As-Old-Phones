//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Guillaume on 05/06/16.
//  Copyright © 2016 Guillaume. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var product: Product?
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
            
        }
        
    }


    @IBAction func addToCartPressed(sender: AnyObject) {
        print("plop")
    }

}
