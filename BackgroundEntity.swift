//
//  BackgroundEntity.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

class BackgroundEntity: GKEntity {
    
    var spriteComponent: SpriteComponent!
    
    init(movementFactor:CGPoint, image:SKTexture, size:CGSize, position:CGPoint, reset:Bool) {
        super.init()
        
        //Initialize components
        spriteComponent = SpriteComponent(entity: self, texture: image, size: size, position:position)
        addComponent(spriteComponent)
        let parallaxComponent = ParallaxComponent(entity: self, movementFactor: movementFactor, spritePosition: spriteComponent.node.position, reset: reset)
        addComponent(parallaxComponent)
    }
    
}

