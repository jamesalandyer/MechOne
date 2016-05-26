//
//  AnimationComponent.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

struct Animation {
    let animationState: AnimationState
    let textures: [SKTexture]
    let repeatTexturesForever: Bool
    let textureSize: CGSize
}

class AnimationComponent: GKComponent {
    
    static let actionKey = "Action"
    static let timePerFrame = NSTimeInterval(1.0 / 20.0)
    
    let node: SKSpriteNode
    var animations: [AnimationState: Animation]
    private(set) var currentAnimation: Animation?
    var requestedAnimationState: AnimationState?
    
    init(node: SKSpriteNode, animations: [AnimationState: Animation]) {
        self.node = node
        self.animations = animations
    }
    
    private func runAnimationForAnimationState(animationState:
        AnimationState) {
        
        if currentAnimation != nil &&
            currentAnimation!.animationState == animationState { return }
        
        guard let animation = animations[animationState] else {
            print("Unknown animation for state \(animationState.rawValue)")
            return
        }
        
        node.removeActionForKey(AnimationComponent.actionKey)
        
        let texturesAction: SKAction
        if animation.repeatTexturesForever {
            texturesAction = SKAction.repeatActionForever(
                SKAction.animateWithTextures(animation.textures,
                    timePerFrame: AnimationComponent.timePerFrame))
        } else {
            texturesAction = SKAction.animateWithTextures(animation.textures,
                                                          timePerFrame: AnimationComponent.timePerFrame)
        }
        
        node.runAction(texturesAction, withKey: AnimationComponent.actionKey)
        node.size = animation.textureSize
        
        currentAnimation = animation
    }
    
    override func updateWithDeltaTime(deltaTime: NSTimeInterval) {
        super.updateWithDeltaTime(deltaTime)
        if let animationState = requestedAnimationState {
            runAnimationForAnimationState(animationState)
            requestedAnimationState = nil
        }
    }
    
    class func animationFromAtlas(atlas: SKTextureAtlas, withImageIdentifier
        identifier: String, forAnimationState animationState: AnimationState,
        repeatTexturesForever: Bool = true, textureSize:CGSize) -> Animation {
        let textures = atlas.textureNames.filter {
            $0.containsString("\(identifier)")
            }.sort {
                $0 < $1 }.map {
                    atlas.textureNamed($0)
        }
        return Animation(
            animationState: animationState,
            textures: textures,
            repeatTexturesForever: repeatTexturesForever,
            textureSize: textureSize
        )
    }
}
