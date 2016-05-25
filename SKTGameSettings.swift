//
//  SKTGameSettings.swift
//  MechOne
//
//  Created by James Dyer on 5/24/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import CoreGraphics
import SpriteKit

struct GameSettings {
    
    /**
     Standard options when game is run in debug mode.
     */
    
    struct Debugging {
        
        static let ALL_ShowFrameRate: Bool = true
        static let ALL_ShowNodeCount: Bool = true
        
        static let IOS_ShowDrawCount: Bool = false
        static let IOS_ShowQuadCount: Bool = false
        static let IOS_ShowPhysics  : Bool = false
        static let IOS_ShowFields   : Bool = false
        
        static let ALL_TellMeStatus : Bool = true
    }
    
    /**
     Standard options for the game in all modes.
     */
    
    struct Defaults {
        
        static let ALL_Identifier         : String = "com.jamesalandyer.MechOne"
        
        static let OSX_Start_FullScreen   : Bool = false
        static let OSX_DefaultResolution  : Int  = 0
        
        static let OSX_Resolutions        : [(CGFloat, CGFloat)] = [(1024, 768), (1280, 800)]
        static let ALL_Introduce          : Bool = false
        
    }

    
}
