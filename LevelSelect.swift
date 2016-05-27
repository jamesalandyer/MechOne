//
//  LevelSelect.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

class LevelSelect: SKTScene {
    
    //Sounds
    let sndButtonClick = SKAction.playSoundFileNamed("click.wav", waitForCompletion: false)
    
    let levelLayer = SKNode()
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
        let nameBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        nameBlock.posByScreen(0.5, y: 0.9)
        nameBlock.fontColor = SKColor.whiteColor()
        nameBlock.fontSize = 54
        nameBlock.text = "SELECT A LEVEL:"
        addChild(nameBlock)
        
        //Show levels
        showLevelsFrom(0)
        
    }
    
    func showLevelsFrom(index:Int) {
        
        for node in levelLayer.children {
            node.removeFromParent()
        }
        
        let gridSize = CGSize(width: self.view!.frame.width, height: 2)
        let gridSpacing = CGSize(width: 160, height: -120)
        let gridStart = CGPoint(screenX: 0.1, screenY: 0.75)
        //var gridIndex = 0
        
        var currentX = 0
        var currentY = 0
        var lastAvail = false
        
        for (index, _) in tileMapLevels.MainSet.enumerate() {
            
            var available:Bool
            
            if index != 0 {
                available = NSUserDefaults.standardUserDefaults().boolForKey("Level_\(index)")
            } else {
                available = true
            }
            
            let sign = SKSpriteNode(texture: SKTexture(imageNamed: "Door_1"))
            sign.position = CGPoint(x: gridStart.x + (gridSpacing.width * CGFloat(currentX)), y: gridStart.y + (gridSpacing.height * CGFloat(currentY)))
            sign.size = CGSize(width: 75.6, height: 78)
            sign.zPosition = 20
            sign.userData = ["Index":index,"Available":(available || lastAvail)]
            sign.name = "LevelSign"
            addChild(sign)
            
            let signText = SKLabelNode(fontNamed: "Roboto-Bold")
            signText.position = sign.position
            signText.fontColor = SKColor.whiteColor()
            signText.fontSize = 32
            signText.zPosition = 21
            signText.text = (available || lastAvail) ? "\(index + 1)" : "X"
            if signText.text == "X" {
                signText.text = ""
                sign.texture = SKTexture(imageNamed: "Door_5")
            }
            addChild(signText)
            
            let diamonds = NSUserDefaults.standardUserDefaults().integerForKey("\(index)diamonds") as Int
            var i = 0
            
            while diamonds > i {
                let diamond = SKSpriteNode(imageNamed: "diamond")
                diamond.size = CGSize(width: 22, height: 22)
                diamond.position = CGPoint(x: (-(sign.size.width / 3) + ((sign.size.width / 3) * CGFloat(i))) as CGFloat , y: -(sign.size.height / 2.5))
                diamond.zPosition = 22
                sign.addChild(diamond)
                i = i + 1
            }
            
            currentX = currentX + 1
            if currentX > Int(gridSize.width) {
                currentX = 0
                currentY = currentY + 1
            }
            if available {
                lastAvail = true
            } else {
                lastAvail = false
            }
            
        }
        
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        for node in nodesAtPoint(location) {
            if let theNode: SKNode = node,
                let nodeName = theNode.name {
                if nodeName == "LevelSign" {
                    if theNode.userData!["Available"] as! Bool == true {
                        self.runAction(sndButtonClick)
                        let nextScene = GamePlayMode(size: self.scene!.size)
                        nextScene.levelIndex = (theNode.userData!["Index"] as? Int)!
                        nextScene.scaleMode = self.scaleMode
                        self.view?.presentScene(nextScene)
                    }
                }
            }
        }
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        self.runAction(sndButtonClick)
        let nextScene = GamePlayMode(size: self.scene!.size)
        nextScene.levelIndex = 0
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    #endif
}

