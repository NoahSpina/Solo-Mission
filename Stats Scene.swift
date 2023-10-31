//
//  Stats Scene.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/11/21.
//

import Foundation
import SpriteKit

var bulletsFired = defaults.integer(forKey: "Bullets Fired")
var moneyAccumulated = defaults.integer(forKey: "Money Accumulated")
var enemiesKilled = defaults.integer(forKey: "Enemies Killed")
var amountDeaths = defaults.integer(forKey: "Amount Deaths")
var timesLost = defaults.integer(forKey: "Times Lost")
var gamesPlayed = defaults.integer(forKey: "Games Played")
var killDeathRatio = defaults.integer(forKey: "KD Ratio")
var enemiesPassedScreen = defaults.integer(forKey: "Enemies Passed")
var timesWon = defaults.integer(forKey: "Times Won")


class statsScreen: SKScene {
    
    let enemiesPassedScreenLabel = SKLabelNode(fontNamed: "theboldfont")
    let killDeathRatioLabel = SKLabelNode(fontNamed: "theboldfont")
    let gamesPlayedLabel = SKLabelNode(fontNamed: "theboldfont")
    let timesLostLabel = SKLabelNode(fontNamed: "theboldfont")
    let amountOfDeathsLabel = SKLabelNode(fontNamed: "theboldfont")
    let enemiesKilledLabel = SKLabelNode(fontNamed: "theboldfont")
    let moneyAccumulatedLabel = SKLabelNode(fontNamed: "theboldfont")
    let amountOfWinsLabel = SKLabelNode(fontNamed: "theboldfont")
    let resetStatsButton = SKLabelNode(fontNamed: "theboldfont")
    let backButton = SKLabelNode(fontNamed: "theboldfont")
    let bulletsFiredLabel = SKLabelNode(fontNamed: "theboldfont")
    
    
    override func didMove(to view: SKView) {
        

        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.height/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        
                backButton.text = "Back"
                backButton.fontSize = 100
                backButton.fontColor = SKColor.white
                backButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.07)
                backButton.zPosition = 1
                backButton.name = "Back"
                addChild(backButton)
        
        
            resetStatsButton.text = "Reset Stats"
            resetStatsButton.fontSize = 50
            resetStatsButton.fontColor = SKColor.white
            resetStatsButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.90)
            resetStatsButton.zPosition = 1
            resetStatsButton.name = "Reset Stats"
                addChild(resetStatsButton)
        
        bulletsFiredLabel.text = "Bullets Fired: \(bulletsFired)"
        bulletsFiredLabel.fontSize = 75
        bulletsFiredLabel.fontColor = SKColor.white
        bulletsFiredLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        bulletsFiredLabel.zPosition = 1
        bulletsFiredLabel.name = "Bullets Fired"
            addChild(bulletsFiredLabel)
        
        amountOfWinsLabel.text = "Wins: \(timesWon)"
        amountOfWinsLabel.fontSize = 50
        amountOfWinsLabel.fontColor = SKColor.white
        amountOfWinsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        amountOfWinsLabel.zPosition = 1
        amountOfWinsLabel.name = "Amount Wins"
            addChild(amountOfWinsLabel)
        
        moneyAccumulatedLabel.text = "Net Worth: $\(moneyAccumulated)"
        moneyAccumulatedLabel.fontSize = 75
        moneyAccumulatedLabel.fontColor = SKColor.white
        moneyAccumulatedLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        moneyAccumulatedLabel.zPosition = 1
        moneyAccumulatedLabel.name = "Money Accumulated"
        addChild(moneyAccumulatedLabel)
        
        
        enemiesKilledLabel.text = "Enemies Killed: \(enemiesKilled)"
        enemiesKilledLabel.fontSize = 75
        enemiesKilledLabel.fontColor = SKColor.white
        enemiesKilledLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.65)
        enemiesKilledLabel.zPosition = 1
        enemiesKilledLabel.name = "Enemies Killed"
        addChild(enemiesKilledLabel)
        
        
        amountOfDeathsLabel.text = "Deaths: \(amountDeaths)"
        amountOfDeathsLabel.fontSize = 75
        amountOfDeathsLabel.fontColor = SKColor.white
        amountOfDeathsLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        amountOfDeathsLabel.zPosition = 1
        amountOfDeathsLabel.name = "Money Accumulated"
        addChild(amountOfDeathsLabel)
        
        
        timesLostLabel.text = "Losses: \(timesLost)"
        timesLostLabel.fontSize = 75
        timesLostLabel.fontColor = SKColor.white
        timesLostLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.475)
        timesLostLabel.zPosition = 1
        timesLostLabel.name = "Times Lost"
        addChild(timesLostLabel)
        
        
        gamesPlayedLabel.text = "Games Played: \(gamesPlayed)"
        gamesPlayedLabel.fontSize = 75
        gamesPlayedLabel.fontColor = SKColor.white
        gamesPlayedLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.35)
        gamesPlayedLabel.zPosition = 1
        gamesPlayedLabel.name = "Games Played"
        addChild(gamesPlayedLabel)
        
        
        killDeathRatioLabel.text = "KDR: \(CGFloat(killDeathRatio))"
        killDeathRatioLabel.fontSize = 75
        killDeathRatioLabel.fontColor = SKColor.white
        killDeathRatioLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.25)
        killDeathRatioLabel.zPosition = 1
        killDeathRatioLabel.name = "KD Ratio"
        addChild(killDeathRatioLabel)
        
        
        enemiesPassedScreenLabel.text = "Enemies Passed: \(enemiesPassedScreen)"
        enemiesPassedScreenLabel.fontSize = 75
        enemiesPassedScreenLabel.fontColor = SKColor.white
        enemiesPassedScreenLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.15)
        enemiesPassedScreenLabel.zPosition = 1
        enemiesPassedScreenLabel.name = "KD Ratio"
        addChild(enemiesPassedScreenLabel)
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
            
            if nodeITapped.name == "Reset Stats" {
                
                resetStatsButton.run(scaleSequence)
                
                amountDeaths = 0
                enemiesKilled = 0
                killDeathRatio = 0
                gamesPlayed = 0
                enemiesPassedScreen = 0
                moneyAccumulated = 0
                timesLost = 0
                enemiesKilled = 0
                bulletsFired = 0
                timesWon = 0
                
                defaults.set(timesWon, forKey: "Times Won")
                defaults.set(bulletsFired, forKey: "Bullets Fired")
                defaults.set(enemiesKilled, forKey: "Enemies Killed")
                defaults.set(amountDeaths, forKey: "Amount Deaths")
                defaults.set(enemiesKilled, forKey: "Enemies Killed")
                defaults.set(killDeathRatio, forKey: "KD Ratio")
                defaults.set(gamesPlayed, forKey: "Games Played")
                defaults.set(enemiesPassedScreen, forKey: "Enemies Passed")
                defaults.set(moneyAccumulated, forKey: "Money Accumulated")
                defaults.set(timesLost, forKey: "Times Lost")
                
                amountOfWinsLabel.text = "Wins: \(timesWon)"
                enemiesKilledLabel.text = "Enemies Killed: \(enemiesKilled)"
                bulletsFiredLabel.text = "Bullets Fired: \(bulletsFired)"
                enemiesPassedScreenLabel.text = "Enemies Passed: \(enemiesPassedScreen)"
                killDeathRatioLabel.text = "KDR: \(CGFloat(killDeathRatio))"
                gamesPlayedLabel.text = "Games Played: \(gamesPlayed)"
                timesLostLabel.text = "Losses: \(timesLost)"
                amountOfDeathsLabel.text = "Deaths: \(amountDeaths)"
                moneyAccumulatedLabel.text = "Net Worth: $\(moneyAccumulated)"
            }
            
        }
        
        
        
    }
    
    

}
