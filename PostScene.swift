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
    
    let sndPass = SKAction.playSoundFileNamed("pass.wav", waitForCompletion: false)
    let sndDied = SKAction.playSoundFileNamed("died.wav", waitForCompletion: false)
    
    var level:Int?
    var win:Bool?
    var diamonds:Int?
    var gameWon: Bool {
        if let win = win {
            if let level = level {
                if win && level == 19 {
                    return true
                } else {
                    return false
                }
            }
        }
        
        return false
    }
    
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
        
        if win != nil {
            if win! {
                background.runAction(sndPass)
            } else {
                background.runAction(sndDied)
            }
        }
        
        let nameBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        nameBlock.posByScreen(0.5, y: 0.75)
        nameBlock.fontColor = SKColor.whiteColor()
        nameBlock.fontSize = 32
        if win != nil {
            if gameWon {
                    nameBlock.text = "YOU ESCAPED THE BASE!"
            } else {
                    nameBlock.text = win! ? "YOU MADE IT!" : "YOU WERE KILLED IN THE INFERNO!"
            }
        }
        addChild(nameBlock)
        
        let retryBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        retryBlock.posByScreen(0.5, y: 0.5)
        retryBlock.fontColor = SKColor.whiteColor()
        retryBlock.fontSize = 64
        if win != nil {
            if gameWon {
                retryBlock.posByScreen(0.5, y: 0.55)
                retryBlock.fontSize = 40
                retryBlock.text = "YOU HAVE BOARDED A SHIP"
                let winBlock = SKLabelNode(fontNamed: "Roboto-Bold")
                winBlock.posByScreen(0.5, y: 0.45)
                winBlock.fontColor = SKColor.whiteColor()
                winBlock.fontSize = 40
                winBlock.text = "AND ARE NOW ON YOUR WAY TO EARTH!"
                addChild(winBlock)
            } else {
                retryBlock.text = win! ? "NEXT LEVEL" : "RETRY LEVEL"
            }
        }
        retryBlock.name = "RETRY"
        addChild(retryBlock)
        
        let homeBlock = SKLabelNode(fontNamed: "Roboto-Bold")
        homeBlock.posByScreen(0.5, y: 0.25)
        homeBlock.fontColor = SKColor.whiteColor()
        homeBlock.fontSize = 32
        homeBlock.text = "RETURN TO BASE"
        homeBlock.name = "HOME"
        addChild(homeBlock)
        
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
        for node in nodesAtPoint(location) {
            if let theNode: SKNode = node,
                let nodeName = theNode.name {
                if nodeName == "RETRY" {
                    if win != nil && gameWon == false {
                        if let level = level {
                            SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
                            let nextScene = GamePlayMode(size: self.scene!.size)
                            nextScene.levelIndex = win! ? level + 1 : level
                            nextScene.scaleMode = self.scaleMode
                            self.view?.presentScene(nextScene)
                        }
                    }
                }
                if nodeName == "HOME" {
                    SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
                    let nextScene = MainMenu(size: self.scene!.size)
                    nextScene.scaleMode = self.scaleMode
                    self.view?.presentScene(nextScene)
                }
            }
        }
    }
    
    #if os(OSX)
    override func handleKeyEvent(event: NSEvent, keyDown: Bool) {
        if let characters = event.characters {
            for character in characters.characters {
                switch character {
                case " " where keyDown:
                    if win != nil && gameWon == false {
                        if let level = level {
                            SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
                            let nextScene = GamePlayMode(size: self.scene!.size)
                            nextScene.levelIndex = win! ? level + 1 : level
                            nextScene.scaleMode = self.scaleMode
                            self.view?.presentScene(nextScene)
                        }
                    }
                    break
                default:
                    break
                }
            }
        }
    }
    
    #endif
    
    #if !os(OSX)
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        for press in presses {
            switch press.type {
            case .Select:
                if win != nil && gameWon == false {
                    if let level = level {
                        SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
                        let nextScene = GamePlayMode(size: self.scene!.size)
                        nextScene.levelIndex = win! ? level + 1 : level
                        nextScene.scaleMode = self.scaleMode
                        self.view?.presentScene(nextScene)
                    }
                }
            case .Menu:
                SKTAudio.sharedInstance().playSoundEffect("button_click.wav")
                let nextScene = MainMenu(size: self.scene!.size)
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
