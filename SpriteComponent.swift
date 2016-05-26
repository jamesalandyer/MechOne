//
//  SpriteComponent.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityNode: SKSpriteNode {
    weak var entity: GKEntity!
}

class SpriteComponent: GKComponent {
    
    let node: EntityNode
    
    init(entity: GKEntity, texture: SKTexture, size: CGSize, position: CGPoint) {
        node = EntityNode(texture: texture, color: SKColor.whiteColor(), size: size)
        node.position = position
        node.entity = entity
    }
}
