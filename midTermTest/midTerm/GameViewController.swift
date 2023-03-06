//  File: GameViewController.swift
//  Created by Tanishk Sai Reddy peruvala
//  Student Id: 301293616
//  Date: March 6, 2023

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController
{
    var currentScene: GKScene?
    
    @IBOutlet var LivesLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var StartLabel: UILabel!
    @IBOutlet var StartButton: UIButton!
    @IBOutlet var EndLabel: UILabel!
    @IBOutlet var RestartButton: UIButton!
    
    //Lanscape
    
    @IBOutlet var StartLandscape: UIButton!
    @IBOutlet var StartLabelLandScape: UIButton!
    @IBOutlet var pilotLandscape: UILabel!
    @IBOutlet var RestartButtonLandscape: UIButton!
    @IBOutlet var EndLabelLandscape: UILabel!
    @IBOutlet var RestartButtonLanscape: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
 
            
            presentStartScene()

            CollisionManager.gameViewController = self
        
    }
    
    /*override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            return.allButUpsideDown
        }else{
            return .all
        }
    }*/
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
        //Landscape
        pilotLandscape.isHidden = false
    }
    /*func presentLandscapeScene(){
        //startLabelLandscape.isHidden = true
        //restartButtonLandscape.isHidden = true
        setScene(sceneName: "StartScene")
    }*/
    
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
        
        //Landscape
        RestartButtonLandscape.isHidden = false
        EndLabelLandscape.isHidden = false
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
        //Landscape
        StartLandscape.isHidden = true
        StartLabelLandScape.isHidden = true
        pilotLandscape.isHidden = true
        
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
        //Landscape
        RestartButtonLandscape.isHidden = true
        EndLabelLandscape.isHidden = true
        
    }
}
