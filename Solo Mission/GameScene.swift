//https://youtu.be/mvlwZs2ehLU
//The tutorial above ^^ implemented the base game, however, I added the upgrades, stats, and winning scene to the game.
//  GameScene.swift
//  Solo Mission
//
//  Created by Noah Spina on 12/8/21.
//  I pledge my Honor that I abided by the Stevens Honor System - Noah Spina
//

import SpriteKit
import GameplayKit

var bulletSize = 1.2 + Double(biggerBulletsAmount)*Double(0.25)
var enemySize = 1.2 + CGFloat(biggerEnemiesAmount)*(0.25)

func updateUpgrades() {
     bulletSize = 1.2 + Double(biggerBulletsAmount)*Double(0.25)
     enemySize = 1.2 + CGFloat(biggerEnemiesAmount)*(0.25)
     gameMoney += 2+Int(1 + moneyMultiplierAmount*moneyMultiplierAmount)
}

func KDCalulation() {
    if amountDeaths == 0 {
        return
    }
    
    else {
        killDeathRatio = enemiesKilled/amountDeaths
    }
}

func developerMoney() {
    gameMoney = 1000000000
    defaults.set(gameMoney, forKey: "Game Money")
}

var gameScore = 0

var gameMoney = defaults.integer(forKey: "Game Money")

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    enum gameState {
            
            case preGame
            //when game is before start
            
            case inGame
            //when we are playing the game
            
            case afterGame
            //the game state after the game
        }
    
    
    var currentGameState = gameState.preGame

    let scoreLabel = SKLabelNode(fontNamed: "theboldfont")
    
    
    let player2 = SKSpriteNode(imageNamed: "playerShip2")
    let player3 = SKSpriteNode(imageNamed: "playerShip3")
    let player4 = SKSpriteNode(imageNamed: "playerShip4")
    let player5 = SKSpriteNode(imageNamed: "playerShip5")
    
    
    let bulletSound = SKAction.playSoundFileNamed("Bullet Fire.wav", waitForCompletion: false)
    
    let gameOverSound = SKAction.playSoundFileNamed("gameOverSound2.wav", waitForCompletion: false)
    
    let gameWinSound = SKAction.playSoundFileNamed("mixkit-achievement-bell-600.wav", waitForCompletion: false)//change the winning sound
    
    let explosionSound = SKAction.playSoundFileNamed("Explosion.wav", waitForCompletion: false)
    
    var levelNumber = 0
    
    var livesNumber = 5
    
    let livesLabel = SKLabelNode(fontNamed: "theboldfont")
    
    let tapToStartLabel = SKLabelNode(fontNamed: "theboldfont")
    
    
    struct PhysicsCategories {
        static let None: UInt32 = 0
        static let Player: UInt32 = 0b1
        static let Bullet: UInt32 = 0b10
        static let Enemy: UInt32 = 0b100
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    var gameArea: CGRect
    
    override init(size: CGSize) {
        
        
        let maxAspectRatio: CGFloat = 21.0/9.0 //I messed around with th aspec ratio to see if the enemies would spawn on the screen more often
        let playableWidth = (size.height) / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        gameScore = 0
       
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1 {
        let background = SKSpriteNode(imageNamed: "background")
        background.size = self.size
        background.anchorPoint = CGPoint(x: 0.5, y: 0)
        background.position = CGPoint(x: self.size.width/2,
                                      y: self.size.height*CGFloat(i))
        background.zPosition = 0
        background.name = "Background"
        self.addChild(background)
            
            
        }
        
        player.setScale(1)
        player.position = CGPoint(x: self.size.width/2, y: 0 - player.size.height)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = PhysicsCategories.Player
        player.physicsBody!.collisionBitMask = PhysicsCategories.None
        player.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy
        self.addChild(player)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 70
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: self.size.width * 0.22, y: self.size.height + scoreLabel.frame.size.height)
        scoreLabel.zPosition = 100
        self.addChild(scoreLabel)
        
        
        livesLabel.text = "Lives: 5"
        livesLabel.fontSize = 70
        livesLabel.fontColor = SKColor.white
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livesLabel.position = CGPoint(x: self.size.width*0.78, y: self.size.height + livesLabel.frame.size.height)
        livesLabel.zPosition = 100
        self.addChild(livesLabel)
            

        let moveOnToScreenAction = SKAction.moveTo(y: self.size.height*0.8, duration: 0.5)
        scoreLabel.run(moveOnToScreenAction)
        livesLabel.run(moveOnToScreenAction)
        
        
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 100
        tapToStartLabel.fontColor = SKColor.white
        tapToStartLabel.zPosition = 2
        tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        tapToStartLabel.alpha = 0
        self.addChild(tapToStartLabel)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        tapToStartLabel.run(fadeInAction)
    }
    
    
    
    var lastUpdateTime: TimeInterval = 0
    var deltaFrameTime: TimeInterval = 0
    var amountToMovePerSecond: CGFloat = 600.0
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        else {
            deltaFrameTime = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
        }
        
        let amountToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
        
        self.enumerateChildNodes(withName: "Background") {
            background, stop in
            
            if self.currentGameState == gameState.inGame { 
                background.position.y -= amountToMoveBackground
            }
            
            if background.position.y < -self.size.height {
                background.position.y += self.size.height * 2
                
            }
        }
        
    }
    
    
    func startGame() {
        
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction, deleteAction])
        tapToStartLabel.run(deleteSequence)
        
        let moveShipOnToScreenAction = SKAction.moveTo(y: self.size.height*0.2, duration: 0.5)
        let startLevelAction = SKAction.run(startNewLevel)
        let startGameSequence = SKAction.sequence([moveShipOnToScreenAction, startLevelAction])
        player.run(startGameSequence)
        
        autoFireFunction()
    }
    
    
    
    
    func loseALife() {
        
        livesNumber -= 1
        livesLabel.text = "Lives: \(livesNumber)"
        
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleUp, scaleDown])
        livesLabel.run(scaleSequence)
        
        enemiesPassedScreen += 1
        defaults.set(enemiesPassedScreen, forKey: "Enemies Passed")

        
        if livesNumber == 0 {
            runGameOver()
        }
        
    }
    
    
    func addScore() {
        
        gameScore += 1
        scoreLabel.text = "Score: \(gameScore)"
        
        if gameScore == 10 || gameScore == 25 || gameScore == 50 || gameScore == 75 || gameScore == 100 || gameScore == 125 || gameScore == 150 || gameScore == 175 || gameScore == 200 {
            startNewLevel()
        }
        
        if gameScore == 250 {
            runGameWin()
        }
    }
    
    func runGameOver() {
        
        currentGameState = gameState.afterGame
        
        self.removeAllActions()
        
        self.enumerateChildNodes(withName: "Bullet") {
            bullet, stop in
            bullet.removeAllActions()
        }
        
        self.enumerateChildNodes(withName: "Enemy") {
            enemy, stop in
            enemy.removeAllActions()
        }
        
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([gameOverSound,waitToChangeScene, changeSceneAction])
        self.run(changeSceneSequence)
        
        timesLost += 1
        defaults.set(timesLost, forKey: "Times Lost")
        
        
    }

    
    
    func changeScene() {
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    
    
    
    func runGameWin() {
        
        
        currentGameState = gameState.afterGame
        
        self.removeAllActions()
        
        self.enumerateChildNodes(withName: "Bullet") {
            bullet, stop in
            bullet.removeAllActions()
        }
        
        self.enumerateChildNodes(withName: "Enemy") {
            enemy, stop in
            enemy.removeAllActions()
        }
        
        
        let changeSceneAction = SKAction.run(changeToWinScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([gameWinSound,waitToChangeScene, changeSceneAction])
        self.run(changeSceneSequence)
        
        timesWon += 1
        defaults.set(timesWon, forKey: "Times Won")
    }
    
    func changeToWinScene() {
        
        let sceneToMoveTo = winningScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else {
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        //if player hits the enemy
        if body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Enemy {
            
            
            if body1.node != nil {
                spawnExplosion(spawnPosition: body1.node!.position)
            }
            
            if body2.node != nil {
                spawnExplosion(spawnPosition: body2.node!.position)
            }
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            
            runGameOver()
            
            amountDeaths += 1
            defaults.set(amountDeaths, forKey: "Amount Deaths")
        }
        
        //if bullet hits enemy
        if body1.categoryBitMask == PhysicsCategories.Bullet && body2.categoryBitMask == PhysicsCategories.Enemy {
            if body2.node != nil {
                if body2.node!.position.y > self.size.height {
                    return
                }
                else {
                    spawnExplosion(spawnPosition: body2.node!.position)
                    addScore()
                    
                    gameMoney += 2+Int(1 + moneyMultiplierAmount*moneyMultiplierAmount)
                    defaults.set(gameMoney, forKey: "Game Money")
                    moneyAccumulated += 2+Int(1 + moneyMultiplierAmount*moneyMultiplierAmount)
                    defaults.set(moneyAccumulated, forKey: "Money Accumulated")
                    enemiesKilled += 1
                    defaults.set(enemiesKilled, forKey: "Enemies Killed")
                }
            }
            
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
        }
        
        
    }
    
    func spawnExplosion(spawnPosition: CGPoint) {
        
        let explosion = SKSpriteNode(imageNamed: "explosion")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.1)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound, scaleIn, fadeOut, delete])
        
        explosion.run(explosionSequence)
        
    }
    
    
    func autoFireFunction() {
        if autoFireAmount > 0 && autoFireAmount < 5 {
            let autoFireBullet = SKAction.run(fireBullet)
            let waitForFireDuration = SKAction.wait(forDuration: 1 - (CGFloat(autoFireAmount/4)) + 0.2)
            let autoFireBulletSequence = SKAction.sequence([waitForFireDuration, autoFireBullet]) //auto fire bullet sequence
            let spawnBulletForever = SKAction.repeatForever(autoFireBulletSequence)
            self.run(spawnBulletForever)
        }
        else {
            return
        }
    }
    
    
    func fireBullet() {
        
        bulletsFired += 1
        defaults.set(bulletsFired, forKey: "Bullets Fired")
        
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.name = "Bullet"
        bullet.setScale(bulletSize)
        bullet.position = player.position
        bullet.zPosition = 1
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody!.affectedByGravity = false
        bullet.physicsBody!.categoryBitMask = PhysicsCategories.Bullet
        bullet.physicsBody!.collisionBitMask = PhysicsCategories.None
        bullet.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: (self.size.height + bullet.size.height), duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
        
    }
    
    func spawnEnemy() {
        
        let randomXStart = random(min: gameArea.minX + 0.5, max: gameArea.maxX + 0.5)
        let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXEnd, y: -self.size.height * 0.2)
        
        let enemy = SKSpriteNode(imageNamed: "enemyShip")
        enemy.name = "Enemy"
        enemy.setScale(enemySize)
        enemy.position = startPoint
        enemy.zPosition = 2
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Bullet
        self.addChild(enemy)
        
        let moveEnemy = SKAction.move(to: endPoint, duration: 2)
        let deleteEnemy = SKAction.removeFromParent()
        let loseALifeAction = SKAction.run(loseALife)
        let enemySequence = SKAction.sequence([moveEnemy, deleteEnemy, loseALifeAction])
        
        
        if currentGameState == gameState.inGame {
            enemy.run(enemySequence)
        }
        
        
        
        let dx = endPoint.x - startPoint.x
        let dy = endPoint.y - startPoint.y
        let amountToRotate = atan2(dy, dx)
        enemy.zRotation = amountToRotate
        
    }
    
    func startNewLevel() {
        
        levelNumber += 1
        
        if self.action(forKey: "spawningEnemies") != nil {
            self.removeAction(forKey: "spawningEnemies")
        }
        
        if self.action(forKey: "spawningBullets") != nil {
            self.removeAction(forKey: "spawningBullets")
        }
        
        var levelDuration = TimeInterval()
        
        
        switch levelNumber {
        case 1: levelDuration = 1.2
        case 2: levelDuration = 1.0
        case 3: levelDuration = 0.8
        case 4: levelDuration = 0.7
        case 5: levelDuration = 0.6
        case 6: levelDuration = 0.5
        case 7: levelDuration = 0.4
        case 8: levelDuration = 0.3
        case 9: levelDuration = 0.2
        case 10: levelDuration = 0.1
        default:
            levelDuration = 0.1
            print("Cannot find level info")
        }
        
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: levelDuration)
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame {
            startGame()
            
            gamesPlayed += 1
            defaults.set(gamesPlayed, forKey: "Games Played")
        }
        
        else if currentGameState == gameState.inGame {
            fireBullet()
        }
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            
            if currentGameState == gameState.inGame {
                player.position.x += amountDragged
            }
            
            
            
            if player.position.x > gameArea.maxX - player.size.width/2 {
                player.position.x = gameArea.maxX - player.size.width/2
            }
            
            if player.position.x < gameArea.minX + player.size.width/2 {
                player.position.x = gameArea.minX + player.size.width/2
            }
            
        }

    }
    
    
}
