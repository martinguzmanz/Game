//
//  GameViewController.swift
//  OSXGame
//
//  Created by Julio César Guzman on 11/21/15.
//  Copyright (c) 2015 Julio. All rights reserved.
//

import SceneKit
import QuartzCore

extension NSColor {
    static func randomColor () -> (NSColor) {
        let red = CGFloat(arc4random_uniform(UInt32(256)))/256.0 as CGFloat
        let green = CGFloat(arc4random_uniform(UInt32(256)))/256.0 as CGFloat
        let blue = CGFloat(arc4random_uniform(UInt32(256)))/256.0 as CGFloat
        return NSColor(red: red , green: green , blue: blue , alpha: 1.0)
    }
}

class GameViewController: NSViewController {
    
    @IBOutlet weak var gameView: GameView!
    
    var renderer : SceneRenderer?
    
    override func awakeFromNib(){
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/scene.scn")!
       
        // set the scene to the view
        self.gameView!.scene = scene
        
        //Set renderer
        self.renderer = PracticaSceneRenderer(scene: scene)
        gameView.delegate = self.renderer
        
        // allows the user to manipulate the camera
        self.gameView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.gameView!.showsStatistics = true
        
        // configure the view
        self.gameView!.backgroundColor = NSColor.blackColor()
        
        
        self.gameView!.playing = true
        self.gameView!.loops = true

    }

}