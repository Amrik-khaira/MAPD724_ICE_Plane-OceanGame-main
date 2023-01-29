import SpriteKit
import GameplayKit


let screenSize = UIScreen.main.bounds
var screenWidth:CGFloat?
var screenHeight:CGFloat?


class GameScene: SKScene
{
    // instance varriable
    var ocean1:Ocean?
    var ocean2:Ocean?
    var player:Player?
    var island:Island?
    var clouds:[Cloud] = []
    override func sceneDidLoad()
    {
        screenWidth = frame.width
        screenHeight = frame.height
        print("frame",screenWidth!/2-80)
        
        name = "GAME"
        //add First ocean
        
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add second ocean
        
        ocean2 = Ocean()
        ocean2?.position.y = -773
        addChild(ocean2!)
        
        // adding Player
        player = Player()
        addChild(player!)
        
        //adding Island
        island = Island()
        addChild(island!)
        
        //adding Clouds
        for _ in 0...2
        {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
        ocean1?.Update()
        ocean2?.Update()
        
        player?.Update()
        
        //to move Island per frame
        island?.Update()
        
        //To move cloud per frame
        for cloud in clouds
        {
            cloud.Update()
        }
    }
}
