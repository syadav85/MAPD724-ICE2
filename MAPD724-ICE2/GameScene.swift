//
//  GameScene.swift
//  MAPD724-ICE2
//
//  Created by Satender Yadav on 1/29/23.
//  Student ID: 301293305
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screeSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    // instance variables
    var ocean1 : Ocean?
    var ocean2 : Ocean?
    var player : Player?
    
    override func sceneDidLoad()
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // add ocean1 to the scene and starts it at the Reset location
        ocean1 = Ocean()
        ocean1?.Start()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add ocean2 to the scene and starts it lower
        ocean2 = Ocean()
        ocean2?.Start()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        // add the player to the scene
        player = Player()
        player?.Start()
        addChild(player!)
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
        
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // triggered every frame - once every 16ms
    override func update(_ currentTime: TimeInterval)
    {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
    }
}
