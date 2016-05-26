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

enum AnimationState: String {
    case Dead = "Dead_"
    case Jump = "Jump_"
    case Run = "Run_"
}

enum ColliderType: UInt32 {
    case Player        = 0
    case Destroyable   = 0b1
    case Wall          = 0b10
    case Collectable   = 0b100
    case EndLevel      = 0b1000
    case Projectile    = 0b10000
    case None          = 0b100000
    case KillZone      = 0b1000000
}

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
    
    /**
     Game standards in all modes.
     */
    
    struct GameParams {
        
        struct zValues {
            static let zBackground01:CGFloat = 10
            static let zBackground02:CGFloat = 20
            static let zBackground03:CGFloat = 30
            static let zWorld:CGFloat = 100.0
            static let zWorldFront:CGFloat = 150.0
            static let zPlayer: CGFloat = 125.0
        }
        
    }
    
}
