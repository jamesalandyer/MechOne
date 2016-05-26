//
//  GameBuildMode.swift
//  MechOne
//
//  Created by James Dyer on 5/25/16.
//  Copyright © 2016 James Dyer. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

enum toolSelection {
    case toolMove
    case toolAdd
    case toolRemove
}

class GameBuildMode: SKTScene {
    
    //Layers
    var worldLayer:TileLayer!
    var overlayLayer = SKNode()
    
    //Tools
    var currentTool = toolSelection.toolMove
    var tilePanel = builderPanel(images: tileImages)
    
    //Tiles
    static let tileImages = [
        "0","1","2","3","4","5","6","7","8","9",
        "10","11","12","13","14","15","16","17",
        "18","19","20","21","Fence","sign_1","barrel","Door_1","Door_5","laser_1","laser_2","laser_3","laser_inactive_1","laser_inactive_2",
        "mov_platform","pounder_1","pounder_2","saw","spike","switch_1","switch_2","Lamp","crate","diamond","s","f"
    ]
    
    
    override func didMoveToView(view: SKView) {
        
        //Setup camera
        let myCamera = SKCameraNode()
        camera = myCamera
        addChild(myCamera)
        
        //Setup Layers
        worldLayer = TileLayer(levelIndex: 0, typeIndex: .setBuilder)
        addChild(worldLayer)
        myCamera.addChild(overlayLayer)
        updateTileMap()
        
        //UI Elements
        let modeButton = SKLabelNode(fontNamed: "Roboto-Bold")
        modeButton.posByScreen(-0.4, y: 0.4)
        modeButton.fontSize = 40
        modeButton.text = lt("Move")
        modeButton.fontColor = SKColor.whiteColor()
        modeButton.zPosition = 150
        modeButton.name = "modeSelect"
        overlayLayer.addChild(modeButton)
        
        let zoButton = SKLabelNode(fontNamed: "Roboto-Bold")
        zoButton.posByScreen(-0.4, y: -0.45)
        zoButton.fontSize = 30
        zoButton.text = lt("Zoom Out")
        zoButton.fontColor = SKColor.whiteColor()
        zoButton.zPosition = 150
        zoButton.name = "zoomOut"
        overlayLayer.addChild(zoButton)
        
        let ziButton = SKLabelNode(fontNamed: "Roboto-Bold")
        ziButton.posByScreen(-0.2, y: -0.45)
        ziButton.fontSize = 30
        ziButton.text = lt("Zoom In")
        ziButton.fontColor = SKColor.whiteColor()
        ziButton.zPosition = 150
        ziButton.name = "zoomIn"
        overlayLayer.addChild(ziButton)
        
        let upButton = SKLabelNode(fontNamed: "Roboto-Bold")
        upButton.posByScreen(0.35, y: 0.45)
        upButton.fontSize = 30
        upButton.text = lt("Up")
        upButton.fontColor = SKColor.whiteColor()
        upButton.zPosition = 150
        upButton.name = "Up"
        overlayLayer.addChild(upButton)
        
        let downButton = SKLabelNode(fontNamed: "Roboto-Bold")
        downButton.posByScreen(0.35, y: -0.45)
        downButton.fontSize = 30
        downButton.text = lt("Down")
        downButton.fontColor = SKColor.whiteColor()
        downButton.zPosition = 150
        downButton.name = "Down"
        overlayLayer.addChild(downButton)
        
        let printButton = SKLabelNode(fontNamed: "Roboto-Bold")
        printButton.posByScreen(0.0, y: -0.45)
        printButton.fontSize = 30
        printButton.text = lt("Print")
        printButton.fontColor = SKColor.whiteColor()
        printButton.zPosition = 150
        printButton.name = "Print"
        overlayLayer.addChild(printButton)
        
        let background = SKSpriteNode(imageNamed: "BG")
        background.position = CGPointZero
        background.xScale = 1.2
        background.yScale = 1.2
        background.alpha = 0.2
        background.zPosition = -1
        overlayLayer.addChild(background)
        
        tilePanel.posByScreen(0.45, y: 0.45)
        tilePanel.selectIndex(0)
        overlayLayer.addChild(tilePanel)
        
    }
    
    //MARK: Responders
    
    override func screenInteractionStarted(location: CGPoint) {
        
        if let node = nodeAtPoint(location) as? SKLabelNode {
            if node.name == "modeSelect" {
                switch currentTool {
                case .toolMove:
                    node.text = lt("Add")
                    currentTool = .toolAdd
                    break
                case .toolAdd:
                    node.text = lt("Remove")
                    currentTool = .toolRemove
                    break
                case .toolRemove:
                    node.text = lt("Move")
                    currentTool = .toolMove
                    break
                }
                return
            }
            if node.name == "zoomOut" {
                if let camera = camera {
                    camera.xScale = camera.xScale + 0.2
                    camera.yScale = camera.yScale + 0.2
                }
                return
            }
            if node.name == "zoomIn" {
                if let camera = camera {
                    camera.xScale = camera.xScale - 0.2
                    camera.yScale = camera.yScale - 0.2
                }
                return
            }
            if node.name == "Up" {
                tilePanel.position = CGPoint(x: tilePanel.position.x, y: tilePanel.position.y - 34)
                return
            }
            if node.name == "Down" {
                tilePanel.position = CGPoint(x: tilePanel.position.x, y: tilePanel.position.y + 34)
                return
            }
            if node.name == "Print" {
                worldLayer.levelGenerator.printLayer()
                return
            }
        }
        if let node = nodeAtPoint(location) as? SKSpriteNode {
            if ((node.name?.hasPrefix("T_")) != nil) {
                tilePanel.selectIndex((node.userData!["index"] as? Int)!)
                return
            }
        }
        
        
        switch currentTool {
        case .toolMove:
            if let camera = camera {
                camera.runAction(SKAction.moveTo(location, duration: 0.2))
                //print("x: \(floor(abs(location.x/32.0))) y: \(floor(abs(location.y/32.0)))")
            }
            break
        case .toolAdd:
            let locationInfo = locationToTileIndex(CGPoint(x: location.x + 16, y: location.y - 16))
            if locationInfo.valid == true {
                changeTile(tilePanel.selectedIndex, location: locationInfo.tileIndex)
                updateTileMap()
            }
            break
        case .toolRemove:
            let locationInfo = locationToTileIndex(CGPoint(x: location.x + 16, y: location.y - 16))
            if locationInfo.valid == true {
                changeTile(0, location: locationInfo.tileIndex)
                updateTileMap()
            }
            break
        }
    }
    
    //MARK: functions
    
    func changeTile(tileCode:Int,location:CGPoint) {
        worldLayer.levelGenerator.setTile(position: location, toValue: tileCode)
    }
    
    func updateTileMap() {
        for child in worldLayer.children {
            child.removeFromParent()
        }
        worldLayer.levelGenerator.presentLayerViaDelegate()
        
        for child in worldLayer.children {
            if let name = child.name {
                switch name {
                case "placeholder_Diamond":
                    let label = SKLabelNode(text: "D")
                    label.zPosition = GameSettings.GameParams.zValues.zWorld + 1
                    label.position = child.position
                    worldLayer.addChild(label)
                    break
                case "placeholder_StartPoint":
                    let label = SKLabelNode(text: "S")
                    label.zPosition = GameSettings.GameParams.zValues.zWorld + 1
                    label.position = child.position
                    worldLayer.addChild(label)
                    break
                case "placeholder_FinishPoint":
                    let label = SKLabelNode(text: "F")
                    label.zPosition = GameSettings.GameParams.zValues.zWorld + 1
                    label.position = child.position
                    worldLayer.addChild(label)
                    break
                default:
                    break
                }
            }
        }
    }
    
    func locationToTileIndex(location:CGPoint) -> (valid:Bool, tileIndex:CGPoint) {
        let newIndex = CGPoint(x: floor(abs(location.x/32.0)), y: floor(abs(location.y/32.0)))
        if (newIndex.x >= 0 && newIndex.x < worldLayer.levelGenerator.mapSize.x) &&
            (newIndex.y >= 0 && newIndex.y < worldLayer.levelGenerator.mapSize.y) {
            return (true, newIndex)
        } else {
            return (false, newIndex)
        }
    }
    
}

//Tile Panel

class builderPanel: SKNode {
    
    let atlasTiles = SKTextureAtlas(named: "Tiles")
    var selectedIndex = 0
    
    init(images:[String]) {
        super.init()
        
        for (index, imageString) in images.enumerate() {
            let node = SKSpriteNode(texture: atlasTiles.textureNamed(imageString))
            node.size = CGSize(width: 32, height: 32)
            node.position = CGPoint(x: 0, y: index * -34)
            node.alpha = 0.5
            node.zPosition = 150
            node.name = "T_\(index)"
            node.userData = ["index":index]
            addChild(node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func selectIndex(indexSelected:Int) {
        selectedIndex = indexSelected
        
        for child in children {
            if selectedIndex == (child.userData!["index"] as? Int)! {
                child.alpha = 1.0
                child.setScale(1.1)
            } else {
                child.alpha = 0.5
                child.setScale(1.0)
            }
        }
    }
    
}

