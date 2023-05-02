//
//  MenuScreen.swift
//  Solar
//
//  Created by Tiago Mendes Bottamedi on 05/04/23.
//

import SpriteKit
import SwiftUI

class MenuScreen: SKScene {
    var background: SKSpriteNode!
    var logo: SKSpriteNode!
    var button1 : SKSpriteNode!
    var button2 : SKSpriteNode!
    var button3 : SKSpriteNode!
    var sun : SKSpriteNode!
    var mercury : SKSpriteNode!
    var venus : SKSpriteNode!
    var earth : SKSpriteNode!
    var mars : SKSpriteNode!
    var jupiter : SKSpriteNode!
    var saturn: SKSpriteNode!
    var uranus : SKSpriteNode!
    var neptune : SKSpriteNode!
    var pluto : SKSpriteNode!
    var comet : SKSpriteNode!
    var texto = "This app is designed to be used in Landscape orientation. Also, please don`t skip the texts before they fully appear. Thanks!"
    var labelText = ""
    let labelNode = SKLabelNode()
    var calls : Int = 0
    var index : Int = 0
    var timer : Timer!
    
    private let texts = [
        "4.6 billion years ago, our Solar System was only dust", "Until the gravitational forces made the dust come together", "And then, the Sun appeared!", "Do you know what elements the Sun is made of?", "Correct, the Sun is made of Hydrogen and Helium", "Actually, the Sun is made of Hydrogen and Helium", "At that time, the planets were also being formed", "Can you tell which planet is the closest to the Sun?", "That's right, Mercury is the closest planet to the Sun. It also has the shortest year, which is equivalent to 88 Earth days", "Nice try, but Mercury is the closest one! It also has the shortest year, which is equivalent to 88 Earth days", "But surprisingly the hottest planet is Venus, the second planet, with an average temperature of 867°F!", "The next planet is the one we all live in", "The Earth! Guess you already know a lot about it", "In the sequence, there is a planet known by its red color, which one is it?", "Good job, it's Mars!", "Close one, but the right answer is Mars!", "Now, it's time for the gas planets", "The first one is Jupiter, the biggest planet of our system. It has a constant storm that could fit 3 Earths inside of it!", "Following it, comes the planet known by its beautiful rings and that also is the one with most moons (83), can you tell which one is it?", "You're right, it's Saturn!", "It actually is Saturn!", "Now comes a planet that has a weird feature. It is the only one to have a vertical rotation axis!", "It is Uranus! It is believed that the change of rotation was caused by a collision with an Earth-sized object", "The last planet is Neptune. It has the fastest winds of the whole Solar System, which can go up to 1242 mph!", "In our system there are also other celestial corps, like dwarf planets (Pluto, which was a planet until 2006, is now considered a dwarf planet), asteroids and moons", "Also, many changes have happened throughout time and will continue to happen until the Solar System disappears, which will take a loooong time"
    ]
    
    override func didMove(to view: SKView) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.updateLabelText()
        }
        labelNode.numberOfLines = -1
        labelNode.fontName = "Bold"
        labelNode.lineBreakMode = .byWordWrapping
        labelNode.preferredMaxLayoutWidth = frame.width - 100
        labelNode.position = CGPoint (x: 0, y: frame.maxY - 125)
        labelNode.zPosition = 1
        self.addChild(labelNode)

        background = SKSpriteNode(imageNamed: "ceu")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.texture = SKTexture(imageNamed: "ceu")
        addChild(background)
        
        logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: 750, height: 325)
        logo.position = CGPoint(x: frame.midX, y: frame.midY)
        logo.zPosition = 1
        addChild(logo)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{
            return
        }
        calls = 0
        let location = touch.location(in: self)
        timer.invalidate()
        switch index {
        case 0:
            logo.removeFromParent()
            imprime()
            
        case 2:
            sun = SKSpriteNode (imageNamed: "sol")
            putsPlanet(objeto: sun, tempo: 60, pos: frame.width/13 - 15, divH: 6)
            imprime()
            
        case 3:
            button1 = SKSpriteNode (imageNamed: "Group 1")
            button2 = SKSpriteNode (imageNamed: "Group 2")
            button3 = SKSpriteNode (imageNamed: "Group 3")
            imprimeComButoes()
            
        case 4:
            testaBotoes(certo: button2, errado1: button3, errado2: button1, location: location)
            
        case 7:
            button1 = SKSpriteNode (imageNamed: "Group 4")
            button2 = SKSpriteNode (imageNamed: "Group 5")
            button3 = SKSpriteNode (imageNamed: "Group 6")
            imprimeComButoes()
            
        case 8:
            testaBotoes(certo: button1, errado1: button2, errado2: button3, location: location)
            mercury = SKSpriteNode(imageNamed: "mercury")
            putsPlanet(objeto: mercury, tempo: 1000, pos: frame.width/5.5 - 15, divH: 9)
            
        case 10:
            imprime()
            venus = SKSpriteNode(imageNamed: "venus")
            putsPlanet(objeto: venus, tempo: 3000, pos: 2 * frame.width/7.3 - 15, divH: 7.5)
            
        case 12:
            imprime()
            earth = SKSpriteNode(imageNamed: "earth")
            putsPlanet(objeto: earth, tempo: 200, pos: 2.6 * frame.width/7 - 15, divH: 6.9)
            
        case 13:
            button1 = SKSpriteNode (imageNamed: "Group 7")
            button2 = SKSpriteNode (imageNamed: "Group 8")
            button3 = SKSpriteNode (imageNamed: "Group 9")
            imprimeComButoes()
            
        case 14:
            testaBotoes(certo: button3, errado1: button2, errado2: button1, location: location)
            mars = SKSpriteNode(imageNamed: "mars")
            putsPlanet(objeto: mars, tempo: 201, pos: 3.21 * frame.width/7 - 5, divH: 9)
            
        case 17:
            imprime()
            jupiter = SKSpriteNode(imageNamed: "jupiter")
            putsPlanet(objeto: jupiter, tempo: 70, pos: 3.9 * frame.width/7 - 5, divH: 6.2)
            
        case 18:
            button1 = SKSpriteNode (imageNamed: "Group 10")
            button2 = SKSpriteNode (imageNamed: "Group 11")
            button3 = SKSpriteNode (imageNamed: "Group 12")
            imprimeComButoes()
            
        case 19:
            testaBotoes(certo: button1, errado1: button2, errado2: button3, location: location)
            saturn = SKSpriteNode(imageNamed: "saturn")
            putsPlanet(objeto: saturn, tempo: 71, pos: 4.7 * frame.width/7, divH: 7)
        
        case 22:
            imprime()
            uranus = SKSpriteNode(imageNamed: "uranus")
            putsUranus(objeto: uranus, tempo: 100, pos: 5.45 * frame.width/7, divH: 8)
            
        case 23:
            imprime()
            neptune = SKSpriteNode (imageNamed: "neptune")
            putsPlanet(objeto: neptune, tempo: 100, pos: 6.1 * frame.width/7, divH: 8)
            
        case 24:
            imprime()
            pluto = SKSpriteNode (imageNamed: "pluto")
            comet = SKSpriteNode (imageNamed: "comet")
            putsPlanet(objeto: pluto, tempo: 300, pos: frame.width - 50, divH: 11)
            PutsComet()
            
        default:
           imprime()
            
    }
}
    
    func updateLabelText (){
        labelText += texto[texto.index(texto.startIndex, offsetBy: calls)]
        labelNode.text = labelText
        calls += 1
        if calls == texto.count{
            timer.invalidate()
        }
    }
    
    func updateLabelTextButtons (){
        labelText += texto[texto.index(texto.startIndex, offsetBy: calls)]
        labelNode.text = labelText
        calls += 1
        if calls == texto.count{
            timer.invalidate()
            putsButtons()
        }
    }
    
    func PutsComet (){
        let movement = SKAction.moveBy(x: -500, y: -300, duration: 5)
        let move = SKAction.repeatForever(movement)
        let fade = SKAction.fadeIn(withDuration: 1)
        comet.position = CGPoint (x: frame.maxX + 5, y: frame.maxY + 3)
        comet.size = CGSize (width: 111, height: 90)
        comet.zPosition = 0.5
        comet.alpha = 0
        addChild(comet)
        comet.run (fade)
        comet.run (move)
    }
    
    func testaBotoes (certo : SKSpriteNode, errado1 : SKSpriteNode, errado2 : SKSpriteNode, location : CGPoint){
        if certo.contains(location) {
            imprime()
            index += 1
        }
        else if errado1.contains (location) || errado2.contains(location){
            index += 1
            imprime()
            
        }
        else {
            return
        }
        certo.removeFromParent()
        errado1.removeFromParent()
        errado2.removeFromParent()
    }
    
    func putsPlanet (objeto : SKSpriteNode, tempo : Double, pos : Double, divH : Double){
        let rotate = SKAction.rotate(byAngle: 90, duration: tempo)
        let rotation = SKAction.sequence([rotate, rotate])
        let rotationForever = SKAction.repeatForever(rotation)
        let fade = SKAction.fadeIn(withDuration: 1)
        objeto.position = CGPoint (x: frame.minX + pos, y: 0)
        objeto.size = CGSize (width: frame.height/divH, height: frame.height/divH)
        objeto.zPosition = 1
        objeto.alpha = 0
        addChild(objeto)
        objeto.run(fade)
        objeto.run(rotationForever)
    }
    
    func putsUranus (objeto : SKSpriteNode, tempo : Double, pos : Double, divH : Double){
        let rotate = SKAction.rotate(byAngle: -90, duration: tempo)
        let rotation = SKAction.sequence([rotate, rotate])
        let rotationForever = SKAction.repeatForever(rotation)
        let fade = SKAction.fadeIn(withDuration: 1)
        objeto.position = CGPoint (x: frame.minX + pos, y: 0)
        objeto.size = CGSize (width: frame.height/divH, height: frame.height/divH)
        objeto.zPosition = 1
        objeto.alpha = 0
        addChild(objeto)
        objeto.run(fade)
        objeto.run(rotationForever)
    }
    
    func putsButtons (){
        let fade = SKAction.fadeIn(withDuration: 2)
        button1.position = CGPoint (x: -150, y: frame.maxY - 150)
        button2.position = CGPoint (x: -150, y: frame.maxY - 195)
        button3.position = CGPoint (x: -150, y: frame.maxY - 240)
        button1.zPosition = 1
        button2.zPosition = 1
        button3.zPosition = 1
        button1.alpha = 0
        button2.alpha = 0
        button3.alpha = 0
        addChild(button1)
        addChild(button2)
        addChild(button3)
        button1.run(fade)
        button2.run(fade)
        button3.run(fade)
    }
    
    func imprime (){
        labelText = ""
        if index >= texts.count{
            texto = "But that's the resumed history of the Solar System, hope you enjoyed it and thanks for your attention!"
        } else {
            texto = texts[index]
        }
        calls = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            
            self.updateLabelText()
        }
        index += 1
    }
    
    func imprimeComButoes (){
        labelText = ""
        if index >= texts.count{
            texto = "But that's the resumed history of the Solar System, hope you enjoyed it and thanks for your attention!"
        } else {
            texto = texts[index]
        }
        calls = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.updateLabelTextButtons()
        }
        index += 1
    }
    
}
