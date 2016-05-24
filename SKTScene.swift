//
//  SKTScene.swift
//  MechOne
//
//  Created by James Dyer on 5/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

class SKTScene: SKScene {
    
    //MARK: Public Functions (expected to be overridden)
    
    func screenInteractionStarted(location: CGPoint) {
        //Overridden by Subclass
    }
    
    func screenInteractionMoved(location: CGPoint) {
        //Overridden by Subclass
    }
    
    func screenInteractionEnded(location: CGPoint) {
        //Overridden by Subclass
    }
    
}
