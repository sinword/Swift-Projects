//
//  GameScene.swift
//  Spritekit_Cat
//
//  Created by 新翌王 on 2023/4/19.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let pcontainer = PointContainer()
    var backgroundMusic : SKAudioNode!
    let touchMusic = SKAction.playSoundFileNamed("oh_no.mp3", waitForCompletion: false)
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
       let background = SKSpriteNode(imageNamed: "bg")
        background.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(background)
        
        pcontainer.position = CGPoint(x: self.frame.midX - 10, y: self.frame.midY - 150)
        addChild(pcontainer)
        pcontainer.onInit()
        
        if let musicURL = Bundle.main.url(forResource: "whistle", withExtension: "mp3") {
            backgroundMusic = SKAudioNode(url: musicURL)
            addChild(backgroundMusic)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        run(touchMusic)
        for touch:AnyObject in touches {
            let location = touch.location(in: self)
            let arrObject = self.nodes(at: location)
            for p in arrObject {
                let point = p as? EPoint
                if point != nil && point!.type != PointType.red {
                    pcontainer.onGetNextPoint(point!.index)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
