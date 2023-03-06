import GameplayKit
import SpriteKit

class Island : GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        horizonatalSpeed = 5.0
        Reset()
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if(position.x <= -876)
        {
            Reset()
        }
    }
    override func Reset()
    {
        position.x = 876
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    func Move(){
        position.x -= horizonatalSpeed!
    }
}
