//
//  EPoint.swift
//  Spritekit_Cat
//
//  Created by 新翌王 on 2023/4/19.
//

import UIKit
import SpriteKit

enum PointType: Int {
    case gray = 0
    case red = 1
}

class EPoint: SKSpriteNode {
    var prePointIndex = -1
    var aroundPoint = [Int]()
    var step = 99
    var index = 0
    var type = PointType.gray
    var isEdge = false
}
