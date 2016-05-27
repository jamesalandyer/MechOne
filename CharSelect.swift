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
        
        let nameBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        nameBlock.posByScreen(0.5, y: 0.9)
        nameBlock.fontColor = SKColor.whiteColor()
        nameBlock.fontSize = 54
        nameBlock.text = "Select a Character:"
        addChild(nameBlock)
        
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        self.runAction(sndButtonClick)
        let nextScene = LevelSelect(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        self.runAction(sndButtonClick)
        let nextScene = LevelSelect(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    #endif
    
}
