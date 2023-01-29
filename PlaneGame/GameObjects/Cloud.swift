import GameplayKit
import SpriteKit

class Cloud : GameObj
{
    //initializere
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5//transparence
        Reset()
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if(position.y <= -876)
        {
            Reset()
        }
    }

    override func Reset() {
        //randomize speed
        
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5)  + 5.0 //speed can be form 5 to 10 units
        
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4)  -  2.0 //speed can be form -2 to 2 units
        
        //psudo random X axis position from -262 to 262
        position.x = CGFloat((randomSource?.nextInt(upperBound: 524))!  - 262)
        
        //psudo random Y axis position from 902 to 932
        position.y = CGFloat((randomSource?.nextInt(upperBound: 30))!  + 902)
        isColliding = false
        
    }
    //Public move
    func Move()
    {
        
        //adding speed
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
