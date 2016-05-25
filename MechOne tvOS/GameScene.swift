//
//  GameScene.swift
//  MechOne tvOS
//
//  Created by James Dyer on 5/24/16.
//  Copyright (c) 2016 James Dyer. All rights reserved.
//

import SpriteKit

class GameScene: SKTScene {
    override func didMoveToView(view: SKView) {
        
        //This scene acts as the first point of contact to start background music and pass off to main menu
        
        //Start Background Music
        SKTAudio.sharedInstance().playBackgroundMusic("background_music.mp3")
        SKTAudio.sharedInstance().backgroundMusicPlayer?.volume = 0.4
        
        //Transition to Main Menu
        let nextScene = MainMenu(size: self.scene!.size)
        nextScene.scaleMode = self.scaleMode
        self.view?.presentScene(nextScene)
        
    }
    
}
