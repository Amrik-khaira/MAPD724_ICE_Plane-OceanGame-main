protocol GameProtocol
{
    // initiaziler
    func Start()
    
    // update every freeze
    func Update()
    
    //check position is out side of bound
    func CheckBounds()
    
    // Method to rest position
    func Reset()
}
