//
//  CharSelect.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

class CharSelect: SKTScene {
    //TODO: Story Intro
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
    
    /*
     Story: You overheard the Mechs plotting to attempt to overtake earth. You believe that this is not right and want to stop them. So you destroy the ships engine and attack system, now all you need to do is escape the ship before the engine
     explodes into a fiery inferno. Be careful, if you don't escape fast enough you will be destroyed by this fiery inferno. By the way, also take note that the suit you are in is a brand new state of the art prototype suit. It is still in testing
     so make sure to account for that. If you don't escape, you can't warn your friends on earth to prepare for an attack. Tap to continue.
    */
    
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
