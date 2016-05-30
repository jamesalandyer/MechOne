//
//  GameIntro.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

class GameIntro: SKTScene {
    
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
        nameBlock.text = "WELCOME MECH!"
        addChild(nameBlock)
        
        let story1Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story1Block.posByScreen(0.5, y: 0.8)
        story1Block.fontColor = SKColor.whiteColor()
        story1Block.fontSize = 25
        story1Block.text = "You overheard the MECHs plotting to attempt to overtake earth."
        addChild(story1Block)
        
        let story2Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story2Block.posByScreen(0.5, y: 0.7)
        story2Block.fontColor = SKColor.whiteColor()
        story2Block.fontSize = 25
        story2Block.text = "You believe that this is not right and want to stop them."
        addChild(story2Block)
        
        let story3Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story3Block.posByScreen(0.5, y: 0.6)
        story3Block.fontColor = SKColor.whiteColor()
        story3Block.fontSize = 25
        story3Block.text = "So you destroy the ships engine and attack system."
        addChild(story3Block)
        
        let story4Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story4Block.posByScreen(0.5, y: 0.5)
        story4Block.fontColor = SKColor.whiteColor()
        story4Block.fontSize = 25
        story4Block.text = "Be careful, you need to escape the ship before the engine explodes into a fiery inferno."
        addChild(story4Block)
        
        let story5Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story5Block.posByScreen(0.5, y: 0.4)
        story5Block.fontColor = SKColor.whiteColor()
        story5Block.fontSize = 25
        story5Block.text = "By the way, the suit you are in is a brand new state of the art prototype suit."
        addChild(story5Block)
        
        let story6Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story6Block.posByScreen(0.5, y: 0.3)
        story6Block.fontColor = SKColor.whiteColor()
        story6Block.fontSize = 25
        story6Block.text = "It is still in testing so make sure to account for that."
        addChild(story6Block)
        
        let story7Block = SKLabelNode(fontNamed: "Roboto-Bold")
        story7Block.posByScreen(0.5, y: 0.2)
        story7Block.fontColor = SKColor.whiteColor()
        story7Block.fontSize = 25
        story7Block.text = "If you don't escape, you can't warn your friends on earth to prepare for an attack."
        addChild(story7Block)
        
        let continueBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        continueBlock.posByScreen(0.5, y: 0.1)
        continueBlock.fontColor = SKColor.whiteColor()
        continueBlock.fontSize = 35
        continueBlock.text = "TAP TO CONTINUE"
        addChild(continueBlock)
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
        let nextScene = LevelSelect(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
        let nextScene = LevelSelect(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
    }
    #endif
    
}
