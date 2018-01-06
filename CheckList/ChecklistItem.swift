//
//  ChecklistItem.swift
//  CheckList
//
//  Created by Nyi Nyi Zaw on 12/28/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject {

    var text = ""
    var checked = false
    
    func toggleCheck(){
        checked = !checked
    }
    
}
