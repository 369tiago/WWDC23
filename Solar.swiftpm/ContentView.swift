import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = MenuScreen()
        var width = UIScreen.main.bounds.width
        var height = UIScreen.main.bounds.height
        var aux : CGFloat = 0
        
        if height > width {
            aux = height
            height = width
            width = aux
        }
        
        scene.size = CGSize (width: width, height: height)
        scene.scaleMode = .aspectFit
        scene.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        return scene
    }
    
    var body: some View {
        SpriteView(scene: scene)
        
    }
}
