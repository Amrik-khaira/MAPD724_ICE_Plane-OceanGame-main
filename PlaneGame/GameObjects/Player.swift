import GameplayKit
import SpriteKit

class Player: GameObj
{
    //initializer
    init() {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //lifecycle function
    override func Start() {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    override func Update() {
        CheckBounds()
    }
    override func CheckBounds() {
        //limit the player move to left bound
        if(position.x <= -255){
            position.x = -255
        }
        if(position.x >= 255){
            position.x = 255
        }
        //limit the player move to left bound
    }
    override func Reset() {
        position.y = -495
    }
    func TouchMove(newPos:CGPoint){
        position = newPos
    }
}
