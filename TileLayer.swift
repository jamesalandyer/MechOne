//
//  TileLayer.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import SpriteKit
import GameplayKit

let randomSceneryArt = ["crate", "Ladder", "Fence"]
let randomWallArt = ["sign_1", "sign_2", "sign_3", "sign_4", "sign_5"]

class TileLayer: SKNode, tileMapDelegate {
    
    var levelGenerator = tileMapBuilder()
    let randomScenery = GKRandomDistribution(forDieWithSideCount: randomSceneryArt.count)
    let randomWall = GKRandomDistribution(forDieWithSideCount: randomWallArt.count)
    
    init(levelIndex:Int, typeIndex:setType) {
        super.init()
        
        levelGenerator.delegate = self
        
        levelGenerator.loadLevel(levelIndex, fromSet: typeIndex)
        levelGenerator.presentLayerViaDelegate()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: tileMapDelegate
    
    func createNodeOf(type type:tileType, location:CGPoint) {
        //Load texture atlas
        let atlasTiles = SKTextureAtlas(named: "Tiles")
        
        //Handle each object
        switch type {
        case .tileAir:
            //Intentionally left blank
            break
        case .tileGroundLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundCornerLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundMiddle:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("3"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundCornerRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("4"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("5"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileWallLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("6"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileGroundVent:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("7"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileWallRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("8"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileWiresCenter:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("9"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileWiresRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("10"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileWiresRightCorner:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("11"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileGroundCenter:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("12"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileWiresLeftCorner:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("13"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileWiresLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("14"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCeilingRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("15"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingWiresRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("16"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCeilingCenter:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("17"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .bottomOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingWiresLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("18"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCeilingLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("19"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingCenterLeft:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("20"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .bottomOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileCeilingCenterRight:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("21"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .bottomOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileRandomScenery:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed(randomSceneryArt[randomScenery.nextInt() - 1]))
            node.size = CGSize(width: 32, height: 32)
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileRandomWall:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed(randomWallArt[randomWall.nextInt() - 1]))
            node.size = CGSize(width: 32, height: 32)
            node.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileBarrel:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("barrel"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileDoorOpen:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Door_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileDoorClosed:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Door_5"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileLaserTop:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("laser_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileLaserMiddle:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("laser_2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileLaserBottom:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("laser_3"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileLaserInactiveTop:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("laser_inactive_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileLaserInactiveBottom:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("laser_inactive_2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tilePlatform:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("mov_platform"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .topOutline, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tilePounderShelf:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("pounder_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tilePounder:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("pounder_2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Wall.rawValue, dynamic: false)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileSaw:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("saw"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileSpike:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("spike"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileSwitchUnlocked:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("switch_1"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileSwitchLocked:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("switch_2"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileLamp:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Lamp"))
            node.xScale = 0.25
            node.yScale = 0.25
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            addChild(node)
            break
        case .tileCrate:
            let node = SKSpriteNode(texture: atlasTiles.textureNamed("Crate"))
            node.size = CGSize(width: 32, height: 32)
            node.position = location
            node.zPosition = GameSettings.GameParams.zValues.zWorld
            
            let physicsComponent = PhysicsComponent(entity: GKEntity(), bodySize: node.size, bodyShape: .square, rotation: false)
            physicsComponent.setCategoryBitmask(ColliderType.Destroyable.rawValue, dynamic: true)
            physicsComponent.setPhysicsCollisions(ColliderType.Player.rawValue | ColliderType.Wall.rawValue | ColliderType.Destroyable.rawValue)
            node.physicsBody = physicsComponent.physicsBody
            
            addChild(node)
            break
        case .tileDiamond:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_Diamond"
            addChild(node)
            break
        case .tileStartLevel:
            let node = SKNode()
            node.position = CGPoint(x: location.x, y: location.y - 16)
            node.name = "placeholder_StartPoint"
            addChild(node)
            break
        case .tileEndLevel:
            let node = SKNode()
            node.position = location
            node.name = "placeholder_FinishPoint"
            addChild(node)
            break
        }
        
        
    }
    
}

