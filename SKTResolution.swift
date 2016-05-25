//
//  SKTResolution.swift
//  MechOne
//
//  Created by James Dyer on 5/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit

///GLOBALS

var SKMViewSize: CGSize?    // The size of the visible area of the screen on current device (screen)
var SKMSceneSize: CGSize?   // The size of the scene itself (canvas)
var SKMUIRect: CGRect?      // The visible screen (screen) in relation to the scene (canvas)
var SKMScale: CGFloat?      // Assists with scaling assets up or down based on screen height

class SKTResolution: NSObject {
    
    override init() {
        super.init()
    }
    
    /**
     Sets the global variables, usually run on app launch.
     */
    
    convenience init(screenSize:CGSize, canvasSize:CGSize) {
        self.init()
        
        if (screenSize.height < screenSize.width) {
            SKMViewSize = screenSize
        } else {
            SKMViewSize = CGSize(width:screenSize.height, height:screenSize.width)
        }
        
        SKMSceneSize = canvasSize
        
        SKMScale = (SKMViewSize!.height / SKMSceneSize!.height)
        
        let scale:CGFloat = min( SKMSceneSize!.width/SKMViewSize!.width, SKMSceneSize!.height/SKMViewSize!.height )
        SKMUIRect = CGRect(x: ((((SKMViewSize!.width * scale) - SKMSceneSize!.width) * 0.5) * -1.0), y: ((((SKMViewSize!.height * scale) - SKMSceneSize!.height) * 0.5) * -1.0), width: SKMViewSize!.width * scale, height: SKMViewSize!.height * scale)
        
        if GameSettings.Debugging.ALL_TellMeStatus {
            print("[SKTResolution] Canvas: w \(SKMSceneSize!.width) h \(SKMSceneSize!.height)", terminator: "")
            print("[SKTResolution] Screen: w \(SKMViewSize!.width) h \(SKMViewSize!.height)", terminator: "")
            print("[SKTResolution] UI Scale: \(SKMScale!)", terminator: "")
        }
        
    }
    
    
}
