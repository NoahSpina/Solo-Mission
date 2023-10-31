//
//  MainMenuScene.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/10/21.
//

import Foundation
import SpriteKit


class MainMenuScene: SKScene {
    
    let currentShipLabel = SKLabelNode(fontNamed: "theboldfont")
    var currentShipImageLabel = player
    
    let startGame = SKLabelNode(fontNamed: "theboldfont")
    let upgradeButton = SKLabelNode(fontNamed: "theboldfont")
    let statsButton = SKLabelNode(fontNamed: "theboldfont")
    let shipStoreButton = SKLabelNode(fontNamed: "theboldfont")
    
    override func didMove(to view: SKView) {
        
      //  developerMoney()
        
        updateUpgrades()
        
        currentShipImageLabel.setScale(0.5)
        currentShipImageLabel.zPosition = 1
        currentShipImageLabel.position = (CGPoint(x: self.size.width*0.66, y: self.size.height*0.2))
        addChild(currentShipImageLabel)
        
        currentShipLabel.text = "Current Ship"
        currentShipLabel.fontSize = 50
        currentShipLabel.fontColor = SKColor.white
        currentShipLabel.position = CGPoint (x: self.size.width * 0.66, y: self.size.height * 0.10)
        currentShipLabel.zPosition = 1
        currentShipLabel.name = "Current Ship"
        self.addChild(currentShipLabel)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.height/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameBy = SKLabelNode(fontNamed: "theboldfont")
        gameBy.text = "Noah Spina's"
        gameBy.fontSize = 50
        gameBy.fontColor = SKColor.white
        gameBy.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.80)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "theboldfont")
        gameName1.text = "Solo"
        gameName1.fontSize = 200
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "theboldfont")
        gameName2.text = "Mission"
        gameName2.fontSize = 200
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        startGame.text = "Start Game"
        startGame.fontSize = 150
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width/2, y: self.size.height * 0.4)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
        
        upgradeButton.text = "Upgrade Screen"
        upgradeButton.fontSize = 75
        upgradeButton.fontColor = SKColor.white
        upgradeButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
        upgradeButton.zPosition = 1
        upgradeButton.name = "upgradeButton"
        addChild(upgradeButton)
        
        
        statsButton.text = "Stats"
        statsButton.fontSize = 75
        statsButton.fontColor = SKColor.white
        statsButton.position = CGPoint (x: self.size.width * 0.3, y: self.size.height * 0.10)
        statsButton.zPosition = 1
        statsButton.name = "Stats Button"
        self.addChild(statsButton)
        
        shipStoreButton.text = "Ship Store"
        shipStoreButton.fontSize = 75
        shipStoreButton.fontColor = SKColor.white
        shipStoreButton.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.30)
        shipStoreButton.zPosition = 1
        shipStoreButton.name = "Ship Store"
        self.addChild(shipStoreButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            if nodeITapped.name == "startButton" {
                
                
                player.removeFromParent()
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            
            if nodeITapped.name == "upgradeButton" {
                
                upgradeButton.run(scaleSequence)
                
                let sceneToMoveTo = upgradeScreen(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nodeITapped.name == "Stats Button" {
                
                statsButton.run(scaleSequence)
                
                KDCalulation()
                
                let sceneToMoveTo = statsScreen(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nodeITapped.name == "Ship Store" {
                
                shipStoreButton.run(scaleSequence)
                
                let sceneToMoveTo = shipStoreScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            
            }
        
            
            
        }
        
        
    }
    
    
}
