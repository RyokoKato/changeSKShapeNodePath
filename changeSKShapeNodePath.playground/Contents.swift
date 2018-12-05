//: Playground - noun: a place where people can play

import UIKit
import SpriteKit
import PlaygroundSupport


let view = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
view.backgroundColor = UIColor.lightGray

let skview = SKView(frame: view.frame)
let scene = TestScene(size: view.frame.size)

view.addSubview(skview)

PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

skview.presentScene(scene)
