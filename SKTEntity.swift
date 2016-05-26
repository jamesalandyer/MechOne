//
//  SKTEntity.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

class SKTEntity: GKEntity {
    
    var name = ""
    
    func contactWith(entity: SKTEntity) {
        //Overridden by subclass
    }
    
}
