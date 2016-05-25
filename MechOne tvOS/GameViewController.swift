//
//  GameViewController.swift
//  MechOne tvOS
//
//  Created by James Dyer on 5/24/16.
//  Copyright (c) 2016 James Dyer. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let scene = GameScene(size: CGSize(width: 1363, height: 768))
    var skView:SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView = self.view as! SKView
        
        if GameSettings.Debugging.ALL_TellMeStatus {
            skView.showsFPS = GameSettings.Debugging.ALL_ShowFrameRate
            skView.showsNodeCount = GameSettings.Debugging.ALL_ShowNodeCount
            skView.showsDrawCount = GameSettings.Debugging.IOS_ShowDrawCount
            skView.showsQuadCount = GameSettings.Debugging.IOS_ShowQuadCount
            skView.showsPhysics = GameSettings.Debugging.IOS_ShowPhysics
            skView.showsFields = GameSettings.Debugging.IOS_ShowFields
        }
        
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .AspectFill
        
        _ = SKTResolution(screenSize: view.bounds.size, canvasSize: scene.size)
        
        skView.presentScene(scene)
        
    }
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event:
        UIPressesEvent?) {
        if (skView.scene != nil) {
            skView.scene!.pressesBegan(presses, withEvent: event)
        }
    }
    override func pressesEnded(presses: Set<UIPress>, withEvent event:
        UIPressesEvent?) {
        if (skView.scene != nil) {
            skView.scene!.pressesEnded(presses, withEvent: event)
        }
    }
}
