//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Guillaume on 05/06/16.
//  Copyright © 2016 Guillaume. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    
    var ordersInCart: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = headerView
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        ordersInCart = Orders.readOrdersFromArchive()
        if (ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        
        updateToTal()
        
        
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)

        let order = ordersInCart?[indexPath.row]
        
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }
    

   
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            var orders = Orders.readOrdersFromArchive()
            
            if let orders = ordersInCart {
                Orders.saveOrdersFromArchive(orders)
            }
            
        
            updateToTal()
        }
    }
    

    func updateToTal() -> Void {
        if let orders = ordersInCart {
            var total: Double = 0.0
            
            for order in orders {
                if let price = order.product?.price {
                    total += price
                }
            }
            
            totalLabel.text = String(total)
        }
    }
    
}
