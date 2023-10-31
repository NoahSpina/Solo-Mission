//
//  shipStoreScene.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/11/21.
//

import Foundation
import SpriteKit

var ship2Bought = 0
var ship3Bought = 0
var ship4Bought = 0
var ship5Bought = 0

func resetShips() {
    
    ship2Bought = 0
    ship3Bought = 0
    ship4Bought = 0
    ship5Bought = 0
    
    defaults.set(ship2Bought, forKey: "Ship 2 Bought")
    defaults.set(ship3Bought, forKey: "Ship 3 Bought")
    defaults.set(ship4Bought, forKey: "Ship 4 Bought")
    defaults.set(ship5Bought, forKey: "Ship 5 Bought")
    
}


func currentShipReplacement() {

    
    if currentShipNumber == 1 {
        player = SKSpriteNode(imageNamed: "playerShip")
    }

    if currentShipNumber == 2 {
        player = SKSpriteNode(imageNamed: "playerShip2")
    }
    
    if currentShipNumber == 3 {
        player = SKSpriteNode(imageNamed: "playerShip3")
    }
    
    if currentShipNumber == 4 {
        player = SKSpriteNode(imageNamed: "playerShip4")
    }
    
    if currentShipNumber == 5 {
        player = SKSpriteNode(imageNamed: "playerShip5")
    }
    
    else {
        return
    }
}

var player = SKSpriteNode(imageNamed: "playerShip")
var currentShipNumber = 1


class shipStoreScene: SKScene {
    
//    var currentShipNumber = defaults.integer(forKey: "Current Ship")

    var ship2Bought = defaults.integer(forKey: "Ship 2 Bought")
    var ship3Bought = defaults.integer(forKey: "Ship 3 Bought")
    var ship4Bought = defaults.integer(forKey: "Ship 4 Bought")
    var ship5Bought = defaults.integer(forKey: "Ship 5 Bought")
    
    func currentShipLabelReplacement() {
        if ship2Bought != 0 {
            playerShip2Label.text = "Ship 2"
        }
    
        if ship3Bought != 0 {
            playerShip3Label.text = "Ship 3"
        }
    
        if ship4Bought != 0 {
            playerShip4Label.text = "Ship 4"
        }
    
        if ship5Bought != 0  {
            playerShip5Label.text = "Ship 5"
        }
    }
    
    func loseMoney() {
        gameMoneyLabel.text = "Money: $\(gameMoney)"
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([buySound, scaleUp, scaleDown])
        gameMoneyLabel.run(scaleSequence)
    }
    
    let playerShip1Label = SKLabelNode(fontNamed: "theboldfont")
    let playerShip2Label = SKLabelNode(fontNamed: "theboldfont")
    let playerShip3Label = SKLabelNode(fontNamed: "theboldfont")
    let playerShip4Label = SKLabelNode(fontNamed: "theboldfont")
    let playerShip5Label = SKLabelNode(fontNamed: "theboldfont")
    let gameMoneyLabel = SKLabelNode(fontNamed: "theboldfont")
    let resetShipsLabel = SKLabelNode(fontNamed: "theboldfont")
    let backButton = SKLabelNode(fontNamed: "theboldfont")
    
    override func didMove(to view: SKView) {
        
        currentShipReplacement()
        currentShipLabelReplacement()
        
        gameMoneyLabel.text = "Money: $\(gameMoney)"
        gameMoneyLabel.fontSize = 75
        gameMoneyLabel.fontColor = SKColor.white
        gameMoneyLabel.position = CGPoint(x: self.size.width*0.50, y: self.size.height*0.15)
        gameMoneyLabel.zPosition = 1
        gameMoneyLabel.name = "Game Money"
        addChild(gameMoneyLabel)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.height/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let player1Image = SKSpriteNode(imageNamed: "playerShip")
        player1Image.setScale(1)
        player1Image.zPosition = 1
        player1Image.position = (CGPoint(x: self.size.width/2, y: self.size.height*0.9))
        player1Image.name = "Ship 1"
        addChild(player1Image)
        
        let player2Image = SKSpriteNode(imageNamed: "playerShip2")
        player2Image.setScale(0.8)
        player2Image.zPosition = 1
        player2Image.position = (CGPoint(x: self.size.width/2, y:self.size.height*0.75))
        player2Image.name = "Ship 2"
        addChild(player2Image)
        
        let player3Image = SKSpriteNode(imageNamed: "playerShip3")
        player3Image.setScale(1)
        player3Image.zPosition = 1
        player3Image.position = (CGPoint(x: self.size.width/2, y: self.size.height*0.60))
        player3Image.name = "Ship 3"
        addChild(player3Image)
        
        let player4Image = SKSpriteNode(imageNamed: "playerShip4")
        player4Image.setScale(1)
        player4Image.zPosition = 1
        player4Image.position = (CGPoint(x: self.size.width/2, y: self.size.height*0.45))
        player4Image.name = "Ship 4"
        addChild(player4Image)
        
        let player5Image = SKSpriteNode(imageNamed: "playerShip5")
        player5Image.setScale(1)
        player5Image.zPosition = 1
        player5Image.position = (CGPoint(x: self.size.width/2, y: self.size.height*0.31))
        player5Image.name = "Ship 5"
        addChild(player5Image)
        
        playerShip1Label.text = "Ship 1"
        playerShip1Label.fontSize = 50
        playerShip1Label.fontColor = SKColor.white
        playerShip1Label.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.83)
        playerShip1Label.zPosition = 1
        playerShip1Label.name = "Ship 1"
        self.addChild(playerShip1Label)
        
        if ship2Bought == 0 {
        playerShip2Label.text = "Ship 2: $1000"
        }
        if ship2Bought == 1 {
            playerShip2Label.text = "Ship 2"
        }
        playerShip2Label.fontSize = 50
        playerShip2Label.fontColor = SKColor.white
        playerShip2Label.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.68)
        playerShip2Label.zPosition = 1
        playerShip2Label.name = "Ship 2"
        self.addChild(playerShip2Label)
        
        if ship3Bought == 0 {
        playerShip3Label.text = "Ship 3: $5000"
        }
        if ship3Bought == 1 {
            playerShip3Label.text = "Ship 3"
        }
        playerShip3Label.fontSize = 50
        playerShip3Label.fontColor = SKColor.white
        playerShip3Label.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.53)
        playerShip3Label.zPosition = 1
        playerShip3Label.name = "Ship 3"
        self.addChild(playerShip3Label)
        
        if ship4Bought == 0 {
        playerShip4Label.text = "Ship 4: $10000"
        }
        if ship4Bought == 1 {
            playerShip4Label.text = "Ship 4"
        }
        playerShip4Label.fontSize = 50
        playerShip4Label.fontColor = SKColor.white
        playerShip4Label.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.38)
        playerShip4Label.zPosition = 1
        playerShip4Label.name = "Ship 4"
        self.addChild(playerShip4Label)
        
        if ship5Bought == 0 {
        playerShip5Label.text = "Ship 5: $25000"
        }
        if ship5Bought == 1 {
            playerShip5Label.text = "Ship 5"
        }
        playerShip5Label.fontSize = 50
        playerShip5Label.fontColor = SKColor.white
        playerShip5Label.position = CGPoint (x: self.size.width * 0.5, y: self.size.height * 0.23)
        playerShip5Label.zPosition = 1
        playerShip5Label.name = "Ship 5"
        self.addChild(playerShip5Label)
        
        backButton.text = "Back"
        backButton.fontSize = 100
        backButton.fontColor = SKColor.white
        backButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        backButton.zPosition = 1
        backButton.name = "Back"
        addChild(backButton)
        
        
        resetShipsLabel.text = "Reset Ships"
        resetShipsLabel.fontSize = 50
        resetShipsLabel.fontColor = SKColor.white
        resetShipsLabel.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.60)
        resetShipsLabel.zPosition = 1
        resetShipsLabel.name = "Reset Ships"
        addChild(resetShipsLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
        
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
        
            if nodeITapped.name == "Back" {
                
                backButton.run(scaleSequence)
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if nodeITapped.name == "Ship 1" {
                
                playerShip1Label.run(scaleSequence)
                
                currentShipNumber = 1
                currentShipLabelReplacement()
                currentShipReplacement()
                defaults.set(ship2Bought, forKey: "Ship 2 Bought")
                defaults.set(ship3Bought, forKey: "Ship 3 Bought")
                defaults.set(ship4Bought, forKey: "Ship 4 Bought")
                defaults.set(ship5Bought, forKey: "Ship 5 Bought")
            }
            
            if nodeITapped.name == "Ship 2" {
                
                playerShip2Label.run(scaleSequence)
                
                if gameMoney > 999 && ship2Bought == 0 {
                    currentShipNumber = 2
                    gameMoney -= 1000
                    loseMoney()
                    ship2Bought += 1
                    playerShip2Label.text = "Ship 2"
                    defaults.set(ship2Bought, forKey: "Ship 2 Bought")
                    currentShipReplacement()
                    currentShipLabelReplacement()
                    defaults.set(ship2Bought, forKey: "Ship 2 Bought")
                }
                
                if ship2Bought != 0 {
                    currentShipNumber = 2
                    playerShip2Label.text = "Ship 2"
                    currentShipLabelReplacement()
                    currentShipReplacement()
                }
            }
            
            if nodeITapped.name == "Ship 3" {
               
                playerShip3Label.run(scaleSequence)
                
                if gameMoney > 4999 && ship3Bought == 0 {
                    currentShipNumber = 3
                    gameMoney -= 5000
                    loseMoney()
                    ship3Bought += 1
                    playerShip3Label.text = "Ship 3"
                    defaults.set(ship3Bought, forKey: "Ship 3 Bought")
                    currentShipReplacement()
                    currentShipLabelReplacement()
                    
                    defaults.set(ship3Bought, forKey: "Ship 3 Bought")
                 
                }
                
                if ship3Bought != 0 {
                    currentShipNumber = 3
                    currentShipLabelReplacement()
                    currentShipReplacement()
                }
            }
            
            if nodeITapped.name == "Ship 4"  {
                
                playerShip4Label.run(scaleSequence)
                
                if ship4Bought != 0 {
                    currentShipNumber = 4
                    currentShipLabelReplacement()
                    currentShipReplacement()
                }
                
                if gameMoney > 9999 && ship4Bought == 0 {
                    currentShipNumber = 4
                    gameMoney -= 10000
                    loseMoney()
                    ship4Bought += 1
                    playerShip4Label.text = "Ship 4"
                    currentShipReplacement()
                    currentShipLabelReplacement()
                    defaults.set(ship4Bought, forKey: "Ship 4 Bought")
                    
                }
            }
            
            if nodeITapped.name == "Ship 5" {
                
                playerShip5Label.run(scaleSequence)
                
                if ship5Bought != 0 {
                    currentShipNumber = 5
                    currentShipLabelReplacement()
                    currentShipReplacement()
                }
                
                if gameMoney > 24999 && ship5Bought == 0 {
                    currentShipNumber = 5
                    gameMoney -= 25000
                    loseMoney()
                    ship5Bought += 1
              
                    currentShipReplacement()
                    currentShipLabelReplacement()
                
                    defaults.set(ship5Bought, forKey: "Ship 5 Bought")
                }
            }
            
            if nodeITapped.name == "Reset Ships" {
                
                resetShipsLabel.run(scaleSequence)
                currentShipNumber = 1
                currentShipLabelReplacement()
                currentShipReplacement()
                resetShips()
                
                playerShip2Label.text = "Ship 2: $1000"
                playerShip3Label.text = "Ship 3: $5000"
                playerShip4Label.text = "Ship 4: $10000"
                playerShip5Label.text = "Ship 5: $25000"
          
            }
        }
    }
}
