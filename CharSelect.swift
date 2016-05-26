//
//  CharSelect.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

class CharSelect: SKTScene {
    
    //Sounds
    let sndButtonClick = SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
        let nameBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        nameBlock.posByScreen(0.5, y: 0.9)
        nameBlock.fontColor = SKColor.whiteColor()
        nameBlock.fontSize = 54
        nameBlock.text = "Select a Character:"
        addChild(nameBlock)
        
        //Characters
        
        let characters = ["Male","Female"]
        let count = characters.count
        
        for (index, char) in characters.enumerate() {
            let atlas = SKTextureAtlas(named: char)
            
            let charNode = SKSpriteNode(texture: atlas.textureNamed("Idle__000"))
            let locX:Double = (1.0 / Double(count + 1))
            let location = locX + (locX * Double(index))
            charNode.posByScreen(CGFloat(location), y: 0.5)
            charNode.size = CGSize(width: 232, height: 439)
            charNode.xScale = 0.5
            charNode.yScale = 0.5
            charNode.name = "C\(index)"
            charNode.userData = ["Index":index]
            addChild(charNode)
            
            let nameBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
            nameBlock.posByScreen(CGFloat(location), y: 0.25)
            nameBlock.fontColor = SKColor.whiteColor()
            nameBlock.fontSize = 32
            nameBlock.text = char
            addChild(nameBlock)
            
        }
        
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        for node in nodesAtPoint(location) {
            if let nodename = node.name {
                if nodename.hasPrefix("C") {
                    self.runAction(sndButtonClick)
                    let nextScene = LevelSelect(size: self.scene!.size)
                    nextScene.characterIndex = node.userData!["Index"] as! Int
                    nextScene.scaleMode = self.scaleMode
                    self.view?.presentScene(nextScene)
                }
            }
        }
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .LeftArrow:
                self.runAction(sndButtonClick)
                let nextScene = LevelSelect(size: self.scene!.size)
                nextScene.characterIndex = 0
                nextScene.scaleMode = self.scaleMode
                self.view?.presentScene(nextScene)
                break
            case .RightArrow:
                self.runAction(sndButtonClick)
                let nextScene = LevelSelect(size: self.scene!.size)
                nextScene.characterIndex = 1
                nextScene.scaleMode = self.scaleMode
                self.view?.presentScene(nextScene)
                break
            default:
                break
            }
        }
    }
    #endif
    
}
