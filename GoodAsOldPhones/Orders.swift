//
//  Orders.swift
//  GoodAsOldPhones
//
//  Created by Guillaume on 05/06/16.
//  Copyright © 2016 Guillaume. All rights reserved.
//

import UIKit

class Orders: NSObject, NSCoding {

    var orders: [Order]?
    
    
    override init(){
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.orders = aDecoder.decodeObjectForKey("orders") as? [Order]
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(orders, forKey: "orders")
    }
    
    class func archiveFilePath() -> String {
        let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        
        return documentsDirectory.URLByAppendingPathExtension("cart.archive").path!
    }
    
    class func readOrdersFromArchive() -> [Order]? {
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(archiveFilePath()) as? [Order]
        
    }
    
    class func saveOrdersFromArchive(orders: [Order]) -> Bool {
        
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
        
    }
    
    
}
