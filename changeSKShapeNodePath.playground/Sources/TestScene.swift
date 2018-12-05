/****************************************
    show shape node
 ****************************************/

import Foundation
import UIKit
import SpriteKit

// MARK: - TestScene class
public class TestScene: SKScene {
    // MARK: - property
    
    // shape node's name
    private let shapeNodeName = "shapeNode"
    
    // show rectangle(true) or triangle(false)
    private var isRectangleNode = false
    
    // MARK: - initializer
    override public init(size: CGSize) {
        super.init(size: size)
        
        // add initial node
        self.addChild(makeInitialNode())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - make new node
    // make initial node
    private func makeInitialNode() -> SKShapeNode {
        let node = SKShapeNode(path: isRectangleNode ? rectanglePath() : trianglePath())
        node.name = shapeNodeName
        node.fillColor = UIColor.white
        node.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        return node
    }
    
    // MARK: - make cgPath
    // return triangle path
    private func trianglePath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -50, y: -50))
        path.addLine(to: CGPoint(x: 50, y: -50))
        path.addLine(to: CGPoint(x: 0, y: 50))
        path.close()
        return path.cgPath
    }
    
    // return rectangle path
    private func rectanglePath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -50, y: -50))
        path.addLine(to: CGPoint(x: 50, y: -50))
        path.addLine(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: -50, y: 50))
        path.close()
        return path.cgPath
    }
    
    // MARK: - handle touch
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isRectangleNode = !self.isRectangleNode
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let node = self.childNode(withName: shapeNodeName) as? SKShapeNode else {
            return
        }
        node.path = isRectangleNode ? rectanglePath() : trianglePath()
    }
}
