//
//  PostScene.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import SpriteKit

class PostScreen: SKTScene {
    
    var level:Int?
    var win:Bool?
    var diamonds:Int?
    
    override func didMoveToView(view: SKView) {
        
        layoutScene()
        saveStats()
        
    }
    
    func layoutScene() {
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.posByCanvas(0.5, y: 0.5)
        background.xScale = 1.2
        background.yScale = 1.2
        background.zPosition = -1
        addChild(background)
        
        let nameBlock = SKLabelNode(fontNamed: "MarkerFelt-Wide")
        nameBlock.posByScreen(0.5, y: 0.5)
        nameBlock.fontColor = SKColor.whiteColor()
        nameBlock.fontSize = 64
        if (win != nil) {
            nameBlock.text = win! ? "You Passed!" : "You Failed!"
        }
        addChild(nameBlock)
        
    }
    
    func saveStats() {
        if win! {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Level_\(level!)")
            if diamonds! > NSUserDefaults.standardUserDefaults().integerForKey("\(level!)diamonds") {
                NSUserDefaults.standardUserDefaults().setInteger(diamonds!, forKey: "\(level!)diamonds")
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    override func screenInteractionStarted(location: CGPoint) {
        
        let nextScene = MainMenu(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
        
    }
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
    let nextScene = MainMenu(size: self.scene!.size)
    nextScene.scaleMode = self.scaleMode
    self.view?.presentScene(nextScene)
    }
    #endif
    
}
