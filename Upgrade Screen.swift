//
//  Upgrade Screen.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/10/21.
//

import Foundation
import SpriteKit




let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
let scaleDown = SKAction.scale(to: 1, duration: 0.2)
let scaleSequence = SKAction.sequence([scaleUp, scaleDown])

var biggerBulletsAmount = defaults.integer(forKey: "Bigger Bullets")
var biggerEnemiesAmount = defaults.integer(forKey: "Bigger Enemies")
var autoFireAmount = defaults.integer(forKey: "Auto Fire")
var moneyMultiplierAmount = defaults.integer(forKey: "Money Multiplier")

var biggerBulletsStoreCost = defaults.integer(forKey: "Bigger Bullets Cost")
var biggerEnemiesStoreCost = defaults.integer(forKey: "Bigger Enemies Cost")
var autoFireStoreCost = defaults.integer(forKey: "Auto Fire Cost")
var moreMoneyMultiplierStoreCost = defaults.integer(forKey: "Money Multiplier Cost")

let buySound = SKAction.playSoundFileNamed("upgradeSound2.wav", waitForCompletion: false)

let biggerEnemies = SKLabelNode(fontNamed: "theboldfont")
let autoFire = SKLabelNode(fontNamed: "theboldfont")
let moreMoneyMultiplier = SKLabelNode(fontNamed: "theboldfont")
let biggerBullets = SKLabelNode(fontNamed: "theboldfont")
let resetUpgrades = SKLabelNode(fontNamed: "theboldfont")

let gameMoneyLabel = SKLabelNode(fontNamed: "theboldfont")
let biggerEnemiesCostLabel = SKLabelNode(fontNamed: "theboldfont")
let autoFireCostLabel = SKLabelNode(fontNamed: "theboldfont")
let moreMoneyMultiplierCostLabel = SKLabelNode(fontNamed: "theboldfont")
let biggerBulletsCostLabel = SKLabelNode(fontNamed: "theboldfont")
let backButton = SKLabelNode(fontNamed: "theboldfont")

class upgradeScreen: SKScene {
    
    var biggerEnemiesStoreCost = 300 + biggerEnemiesAmount*250
    var autoFireStoreCost = 500 + autoFireAmount*250
    var moreMoneyMultiplierStoreCost = 125 + moneyMultiplierAmount*500
    var biggerBulletsStoreCost = 500 + biggerBulletsAmount*250
    
    func loseMoney() {
        
        gameMoneyLabel.text = "Money: $\(gameMoney)"
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([buySound, scaleUp, scaleDown])
        gameMoneyLabel.run(scaleSequence)
    }
    
    
    

    
    
    
    override func didMove(to view: SKView) {

        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.height/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        gameMoneyLabel.text = "Money: $\(gameMoney)"
        gameMoneyLabel.fontSize = 75
        gameMoneyLabel.fontColor = SKColor.white
        gameMoneyLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.90)
        gameMoneyLabel.zPosition = 1
        gameMoneyLabel.name = "Game Money"
        addChild(gameMoneyLabel)
        
        biggerEnemiesCostLabel.text = "$\(biggerEnemiesStoreCost)"
        biggerEnemiesCostLabel.fontSize = 50
        biggerEnemiesCostLabel.fontColor = SKColor.white
        biggerEnemiesCostLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        biggerEnemiesCostLabel.zPosition = 1
        addChild(biggerEnemiesCostLabel)
        
        biggerEnemies.text = "Bigger Enemies: \(biggerEnemiesAmount)"
        biggerEnemies.fontSize = 75
        biggerEnemies.fontColor = SKColor.white
        biggerEnemies.position = CGPoint(x: self.size.width/2, y: self.size.height*0.70)
        biggerEnemies.zPosition = 1
        biggerEnemies.name = "Bigger Enemies"
        addChild(biggerEnemies)
        
        autoFireCostLabel.text = "$\(autoFireStoreCost)"
        autoFireCostLabel.fontSize = 50
        autoFireCostLabel.fontColor = SKColor.white
        autoFireCostLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.60)
        autoFireCostLabel.zPosition = 1
        addChild(autoFireCostLabel)
        
        let autoFireMax = SKLabelNode(fontNamed: "theboldfont")
        autoFireMax.text = "Max 4"
        autoFireMax.fontSize = 25
        autoFireMax.fontColor = SKColor.white
        autoFireMax.position = CGPoint(x: self.size.width/2, y: self.size.height*0.53)
        autoFireMax.zPosition = 1
        addChild(autoFireMax)
        
        autoFire.text = "Auto Fire: \(autoFireAmount)"
        autoFire.fontSize = 75
        autoFire.fontColor = SKColor.white
        autoFire.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        autoFire.zPosition = 1
        autoFire.name = "Auto Fire"
            addChild(autoFire)
        
        if autoFireAmount == 4 {
                        autoFireCostLabel.removeFromParent()
                }
        
        moreMoneyMultiplierCostLabel.text = "$\(moreMoneyMultiplierStoreCost)"
        moreMoneyMultiplierCostLabel.fontSize = 50
        moreMoneyMultiplierCostLabel.fontColor = SKColor.white
        moreMoneyMultiplierCostLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        moreMoneyMultiplierCostLabel.zPosition = 1
        addChild(moreMoneyMultiplierCostLabel)
        
        
        moreMoneyMultiplier.text = "Money Multiplier: \(moneyMultiplierAmount)"
        moreMoneyMultiplier.fontSize = 75
        moreMoneyMultiplier.fontColor = SKColor.white
        moreMoneyMultiplier.position = CGPoint(x: self.size.width/2, y: self.size.height*0.40)
        moreMoneyMultiplier.zPosition = 1
        moreMoneyMultiplier.name = "Money Multiplier"
        addChild(moreMoneyMultiplier)
        
        
        biggerBulletsCostLabel.text = "$\(biggerBulletsStoreCost)"
        biggerBulletsCostLabel.fontSize = 50
        biggerBulletsCostLabel.fontColor = SKColor.white
        biggerBulletsCostLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.30)
        biggerBulletsCostLabel.zPosition = 1
        addChild(biggerBulletsCostLabel)
        
        
        biggerBullets.text = "Bigger Bullets: \(biggerBulletsAmount)"
        biggerBullets.fontSize = 75
        biggerBullets.fontColor = SKColor.white
        biggerBullets.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        biggerBullets.zPosition = 1
        biggerBullets.name = "Bigger Bullets"
        addChild(biggerBullets)
        
        
        resetUpgrades.text = "Reset Upgrades"
        resetUpgrades.fontSize = 75
        resetUpgrades.fontColor = SKColor.white
        resetUpgrades.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        resetUpgrades.zPosition = 1
        resetUpgrades.name = "Reset Upgrades"
        addChild(resetUpgrades)
        
        
        backButton.text = "Back"
        backButton.fontSize = 100
        backButton.fontColor = SKColor.white
        backButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.10)
        backButton.zPosition = 1
        backButton.name = "Back"
        addChild(backButton)
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
    
            if nodeITapped.name == "Bigger Enemies" {
                if gameMoney > biggerEnemiesStoreCost {
                    
                    biggerEnemiesCostLabel.run(scaleSequence)
                    
                    gameMoney -= biggerEnemiesStoreCost
                    defaults.set(gameMoney, forKey: "Game Money")
                    loseMoney()
                    
                    biggerEnemiesAmount += 1
                    defaults.set(biggerEnemiesAmount, forKey: "Bigger Enemies")
                    
                    biggerEnemiesStoreCost += biggerEnemiesAmount*250
                    defaults.set(biggerEnemiesStoreCost, forKey: "Bigger Enemies Cost")

                    biggerEnemies.text = "Bigger Enemies: \(biggerEnemiesAmount)"
                    biggerEnemiesCostLabel.text = "$\(biggerEnemiesStoreCost)"
                }
            }
            
            if nodeITapped.name == "Auto Fire" && autoFireAmount < 4 {
                if gameMoney > autoFireStoreCost {
                    
                    autoFireCostLabel.run(scaleSequence)
                    
                    gameMoney -= autoFireStoreCost
                    defaults.set(gameMoney, forKey: "Game Money")
                    loseMoney()
                    
                    
                    autoFireAmount += 1
                    defaults.set(autoFireAmount, forKey: "Auto Fire")

                
                    autoFireStoreCost += autoFireAmount*250
                    defaults.set(autoFireStoreCost, forKey: "Auto Fire Cost")
                    
                    autoFire.text = "Auto Fire: \(autoFireAmount)"
                    autoFireCostLabel.text = "$\(autoFireStoreCost)"
                    
                    if autoFireAmount == 4 {
                            autoFireCostLabel.removeFromParent()
                    }
                }
            }
            
            
            if nodeITapped.name == "Money Multiplier" {
                if gameMoney > moreMoneyMultiplierStoreCost {
                  
                    moreMoneyMultiplierCostLabel.run(scaleSequence)
                    
                    gameMoney -= moreMoneyMultiplierStoreCost
                    defaults.set(gameMoney, forKey: "Game Money")
                    loseMoney()
                moneyMultiplierAmount += 1
                    defaults.set(moneyMultiplierAmount, forKey: "Money Multiplier")
                    
                moreMoneyMultiplierStoreCost += moneyMultiplierAmount*500
                    defaults.set(moreMoneyMultiplierStoreCost, forKey: "Money Multiplier Cost")
                    
                moreMoneyMultiplier.text = "Money Multiplier: \(moneyMultiplierAmount)"
                moreMoneyMultiplierCostLabel.text = "$\(moreMoneyMultiplierStoreCost)"
                }
            }
            
            if nodeITapped.name == "Bigger Bullets" {
                if gameMoney > biggerBulletsStoreCost {
                    
                    biggerBulletsCostLabel.run(scaleSequence)
                    
                    gameMoney -= biggerBulletsStoreCost
                    defaults.set(gameMoney, forKey: "Game Money")
                    loseMoney()
                    
                biggerBulletsAmount += 1
                    defaults.set(biggerBulletsAmount, forKey: "Bigger Bullets")
                    
                biggerBulletsStoreCost += biggerBulletsAmount*250
                    defaults.set(biggerBulletsStoreCost, forKey: "Bigger Bullets Cost")
                    
                biggerBullets.text = "Bigger Bullets: \(biggerBulletsAmount)"
                biggerBulletsCostLabel.text = "$\(biggerBulletsStoreCost)"
                }
            }
            
            if nodeITapped.name == "Reset Upgrades" {
                
                resetUpgrades.run(scaleSequence)
                
                biggerBulletsAmount = 0
                autoFireAmount = 0
                moneyMultiplierAmount = 0
                biggerEnemiesAmount = 0
                
                defaults.set(autoFireAmount, forKey: "Auto Fire")
                defaults.set(moneyMultiplierAmount, forKey: "Money Multiplier")
                defaults.set(biggerEnemiesAmount, forKey: "Bigger Enemies")
                defaults.set(biggerBulletsAmount, forKey: "Bigger Bullets")
                
                biggerEnemiesStoreCost = Int(300 + (CGFloat(biggerEnemiesAmount))*50)
                defaults.set(biggerEnemiesStoreCost, forKey: "Bigger Bullets Cost")
                autoFireStoreCost = Int(500 + (CGFloat(autoFireAmount))*250)
                defaults.set(autoFireStoreCost, forKey: "Auto Fire Cost")
                moreMoneyMultiplierStoreCost = Int(125 + (CGFloat(moneyMultiplierAmount)*500))
                defaults.set(moreMoneyMultiplierStoreCost, forKey: "Money Multiplier Cost")
                biggerBulletsStoreCost = Int(500 + (CGFloat(biggerBulletsAmount)*500))
                defaults.set(biggerEnemiesStoreCost, forKey: "Bigger Enemies Cost")
                
                biggerEnemies.text = "Bigger Enemies: \(biggerEnemiesAmount)"
                biggerEnemiesCostLabel.text = "$\(biggerEnemiesStoreCost)"
                
                autoFire.text = "Auto Fire: \(autoFireAmount)"
                autoFireCostLabel.text = "$\(autoFireStoreCost)"
                
                moreMoneyMultiplier.text = "Money Multiplier: \(moneyMultiplierAmount)"
                moreMoneyMultiplierCostLabel.text = "$\(moreMoneyMultiplierStoreCost)"
                
                biggerBullets.text = "Bigger Bullets: \(biggerBulletsAmount)"
                biggerBulletsCostLabel.text = "$\(biggerBulletsStoreCost)"
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 1.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nodeITapped.name == "Back" {
               
                backButton.run(scaleSequence)
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        
        }
    }
    
    
    
}
