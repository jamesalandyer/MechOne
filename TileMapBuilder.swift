//
//  TileMapBuilder.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

enum tileType: Int {
    case tileAir                 = 0
    case tileGroundLeft          = 1
    case tileGroundCornerLeft    = 2
    case tileGroundMiddle        = 3
    case tileGroundCornerRight   = 4
    case tileGroundRight         = 5
    case tileWallLeft            = 6
    case tileGroundVent          = 7
    case tileWallRight           = 8
    case tileWiresCenter         = 9
    case tileWiresRight          = 10
    case tileWiresRightCorner    = 11
    case tileGroundCenter        = 12
    case tileWiresLeftCorner     = 13
    case tileWiresLeft           = 14
    case tileCeilingRight        = 15
    case tileCeilingWiresRight   = 16
    case tileCeilingCenter       = 17
    case tileCeilingWiresLeft    = 18
    case tileCeilingLeft         = 19
    case tileCeilingCenterLeft   = 20
    case tileCeilingCenterRight  = 21
    case tileRandomScenery       = 22
    case tileRandomWall          = 23
    case tileBarrel              = 24
    case tileDoorOpen            = 25
    case tileDoorClosed          = 26
    case tileLaserTop            = 27
    case tileLaserMiddle         = 28
    case tileLaserBottom         = 29
    case tileLaserInactiveTop    = 30
    case tileLaserInactiveBottom = 31
    case tilePlatform            = 32
    case tilePounderShelf        = 33
    case tilePounder             = 34
    case tileSaw                 = 35
    case tileSpike               = 36
    case tileSwitchUnlocked      = 37
    case tileSwitchLocked        = 38
    case tileLamp                = 39
    case tileCrate               = 40
    case tileDiamond             = 41
    case tileStartLevel          = 42
    case tileEndLevel            = 43
}

protocol tileMapDelegate {
    func createNodeOf(type type:tileType, location:CGPoint)
}

struct tileMapBuilder {
    
    var delegate: tileMapDelegate?
    
    var tileSize = CGSize(width: 32, height: 32)
    var tileLayer: [[Int]] = Array()
    var mapSize:CGPoint {
        get {
            return CGPoint(x: tileLayer[0].count, y: tileLayer.count)
        }
    }
    
    //MARK: Setters and getters for the tile map
    
    mutating func setTile(position position:CGPoint, toValue:Int) {
        tileLayer[Int(position.y)][Int(position.x)] = toValue
    }
    
    func getTile(position position:CGPoint) -> Int {
        return tileLayer[Int(position.y)][Int(position.x)]
    }
    
    //MARK: Level creation
    
    mutating func loadLevel(level:Int, fromSet set:setType) {
        switch set {
        case .setMain:
            tileLayer = tileMapLevels.MainSet[level]
            break
        case .setBuilder:
            tileLayer = tileMapLevels.BuilderSet[level]
            break
        }
    }
    
    //MARK: Presenting the layer
    
    func presentLayerViaDelegate() {
        for (indexr, row) in tileLayer.enumerate() {
            for (indexc, cvalue) in row.enumerate() {
                if (delegate != nil) {
                    delegate!.createNodeOf(type: tileType(rawValue: cvalue)!,
                                           location: CGPoint(
                                            x: tileSize.width * CGFloat(indexc),
                                            y: tileSize.height * CGFloat(-indexr)))
                }
            }
        }
    }
    
    //MARK: Builder function
    
    func printLayer() {
        print("Tile Layer:")
        for row in tileLayer {
            print(row)
        }
    }
    
}

