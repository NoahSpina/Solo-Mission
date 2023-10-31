//
//  Winning Scene.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/11/21.
//

import Foundation
import SpriteKit

class winningScene: SKScene {
    
    let winLabel = SKLabelNode(fontNamed: "theboldfont")

    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.height/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
            winLabel.text = "You Won!"
            winLabel.fontSize = 150
            winLabel.fontColor = SKColor.white
            winLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
            winLabel.zPosition = 1
            winLabel.name = "Win Label"
                addChild(winLabel)
        
        let backButton = SKLabelNode(fontNamed: "theboldfont")
                backButton.text = "Back"
                backButton.fontSize = 100
                backButton.fontColor = SKColor.white
                backButton.position = CGPoint(x: self.size.width/2, y: self.size.height*0.10)
                backButton.zPosition = 1
                backButton.name = "Back"
                addChild(backButton)
        
        
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.5)
        let scaleDown = SKAction.scale(to: 1, duration: 0.5)
        let scaleSequence = SKAction.sequence([scaleUp, scaleDown])
        let scaleSequenceForever = SKAction.repeatForever(scaleSequence)
            winLabel.run(scaleSequenceForever)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    for touch: AnyObject in touches {
    
        let pointOfTouch = touch.location(in: self)
        let nodeITapped = atPoint(pointOfTouch)
        
            if nodeITapped.name == "Back" {
                winLabel.removeAllActions()
                
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        }
    }
}
