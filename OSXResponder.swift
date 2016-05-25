//
//  OSXResponder.swift
//  MechOne
//
//  Created by James Dyer on 5/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import SpriteKit

extension SKTScene {
    
    /**
    Handles screen click events.
    */
    
    override func mouseDown(theEvent: NSEvent) {
        
        let location = theEvent.locationInNode(self)
        screenInteractionStarted(location)
        
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        
        let location = theEvent.locationInNode(self)
        screenInteractionMoved(location)
        
    }
    
    override func mouseUp(theEvent: NSEvent) {
        
        let location = theEvent.locationInNode(self)
        screenInteractionEnded(location)
        
    }
    
    override func mouseExited(theEvent: NSEvent) {
        
        let location = theEvent.locationInNode(self)
        screenInteractionEnded(location)
        
    }
    
    /**
    Handles key presses and depresses.
    */
    
    override func keyDown(theEvent: NSEvent) {
        handleKeyEvent(theEvent, keyDown: true)
    }
    
    override func keyUp(theEvent: NSEvent) {
        handleKeyEvent(theEvent, keyDown: false)
    }
    
    func handleKeyEvent(event: NSEvent, keyDown: Bool) {
        guard let characters = event.charactersIgnoringModifiers?.characters else {
            return
        }
        for character in characters {
            buttonEvent("\(character)", velocity: 1.0, pushedOn: keyDown)
        }
    }
    
}