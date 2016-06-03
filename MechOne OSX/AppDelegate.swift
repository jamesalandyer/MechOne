//
//  AppDelegate.swift
//  MechOne OSX
//
//  Created by James Dyer on 5/24/16.
//  Copyright (c) 2016 James Dyer. All rights reserved.
//


import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        let scene = GameScene(size: CGSize(width: 1024, height: 768))
        
        scene.scaleMode = .AspectFit
        
        _ = SKTResolution(screenSize: skView.bounds.size, canvasSize: scene.size)
        
        self.skView!.presentScene(scene)
        
        self.skView!.ignoresSiblingOrder = true
        
        
        self.skView!.showsFPS = GameSettings.Debugging.ALL_ShowFrameRate
        self.skView!.showsNodeCount = GameSettings.Debugging.ALL_ShowNodeCount
        
        self.window.title = "MechOne"
        
        if (GameSettings.Defaults.OSX_Start_FullScreen) {
            self.window.toggleFullScreen(nil)
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
}
