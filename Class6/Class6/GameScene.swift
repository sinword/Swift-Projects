//
//  GameScene.swift
//  Class6
//
//  Created by 新翌王 on 2023/3/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let label = SKLabelNode(text: "Hello World!")
    var txtchange: Bool = false
    
    override func didMove(to view: SKView) {
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        label.fontSize = 45
        label.fontColor = SKColor.red
        label.fontName = "Avenir"
        label.speed = 5
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        let dtaporegnizer = UITapGestureRecognizer(target: self, action: #selector(doubletap))
        dtaporegnizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(recognizer)
        view.addGestureRecognizer(dtaporegnizer)
        addChild(label)
        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(longpress))
        view.addGestureRecognizer(longpress)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe_Left))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe_Right))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe_Up))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe_Down))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinch_label))
        view.addGestureRecognizer(pinch)
        
        let rotate = UIPinchGestureRecognizer(target: self, action: #selector(handleRotate))
        view.addGestureRecognizer(rotate)
    }
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        let moveToAction = SKAction.move(to: sceneLocation, duration: 1)
        label.run(moveToAction)
    }
    
    @objc func doubletap(recognizer: UIGestureRecognizer) {
        
        if txtchange {
            label.text = "HELLO WORLD!"
        }
        else {
            label.text = "!!!"
            
        }
        txtchange = !txtchange
    }
    
    @objc func longpress(recognizer: UIGestureRecognizer) {
        if recognizer.state == .began {
            self.backgroundColor = SKColor.init(red: CGFloat(arc4random_uniform(255)) / CGFloat(255.0),
                                                green: CGFloat(arc4random_uniform(255)) / CGFloat(255.0),
                                                blue: CGFloat(arc4random_uniform(255)) / CGFloat(255.0),
                                                alpha: 1)
        }
    }
    
    @objc func swipe_Left(recognizer: UIGestureRecognizer) {
        let fadeAlpha = SKAction.fadeAlpha(by: -0.2, duration: 1)
        label.run(fadeAlpha)
    }
    
    @objc func swipe_Right(recognizer: UIGestureRecognizer) {
        let fadeAlpha = SKAction.fadeAlpha(by: 0.2, duration: 1)
        label.run(fadeAlpha)
    }
    
    @objc func swipe_Up(recognizer: UIGestureRecognizer) {
        let fadeAlpha = SKAction.fadeAlpha(by: 0.5, duration: 1)
        label.run(fadeAlpha)
    }
    
    @objc func swipe_Down(recognizer: UIGestureRecognizer) {
        let fadeAlpha = SKAction.fadeAlpha(by: -0.5, duration: 1)
        label.run(fadeAlpha)
    }
    
    @objc func pinch_label(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began {
            print("Start")
        }
        else if recognizer.state == .changed {
            let labelsize = label.fontSize
            let scale = recognizer.scale
            let labelscale = labelsize * scale
            if labelscale > 22 && labelscale < 90 {
                label.fontSize = labelscale
            }
        }
        else if recognizer.state == .ended {
            print("end")
        }
    }
    
    @objc func handleRotate(recognizer: UIRotationGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.changed {
            let rotation = recognizer.rotation
            recognizer.view?.transform = CGAffineTransform(rotationAngle: rotation)
        }
    }
    
}
