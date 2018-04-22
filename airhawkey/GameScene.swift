//
//  GameScene.swift
//  airhawkey
//
//  Created by Danny Peng on 4/21/18.
//  Copyright © 2018 Danny Peng. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    let motion = CMMotionManager()
    
    private var player = SKSpriteNode(imageNamed: "9899.png")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.2)
        
        addChild(player)
        
        startAccelerometers()
        
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //startAccelerometers()
        
    }
    
    func startAccelerometers() {
        // Make sure the accelerometer hardware is available.
        if self.motion.isAccelerometerAvailable {
            self.motion.accelerometerUpdateInterval = 1.0 / 60.0  // 60 Hz
            self.motion.startAccelerometerUpdates()
            
            // Configure a timer to fetch the data.
            var timer = Timer(fire: Date(), interval: (1.0/60.0),
                               repeats: true, block: { (timer) in
                                // Get the accelerometer data.
                                if let data = self.motion.accelerometerData {
                                    let px = data.acceleration.x
                                    let py = data.acceleration.y
                                    let pz = data.acceleration.z
                                    
                                    print("x is: ", px, "y is: ", py, "z is: ", pz)
                                    
                                    
                                    // Use the accelerometer data in your app.
                                    let setx = CGFloat(100 * px) + (self.size.width * 0.1)
                                    let sety = CGFloat(100 * py) + (self.size.height * 0.3)
                                    self.player.position = CGPoint(x: setx, y: sety)
                                    
                                }
            })
            
            // Add the timer to the current run loop.
            RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
        }
    }
    
    
}
