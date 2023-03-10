
import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "cloud", initialScale: 0.9)
        Start()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5
        Reset()
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if(position.x <= -685)
        {
            Reset()
        }
    }
    override func Reset()
    {
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        horizonatalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        
        position.y = CGFloat(randomX)
        
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 685
        
        position.x = CGFloat(randomY)
        
        isColliding = false
    }
    func Move()
    {
        position.y -= horizonatalSpeed!
        position.x -= verticalSpeed!
    }
}
