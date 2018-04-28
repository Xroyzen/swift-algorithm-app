//: Playground - noun: a place where people can play

import UIKit

class Point {
    
    // F = G + H
    var distanceFromStart: Int  // G
    var distanceToEnd: Int      // H
    var position: CGPoint
    var previousPoint: Point? = nil
    
    var fullDistance: Int { return distanceFromStart + distanceToEnd }
    
    init(fromStart: Int, toEnd: Int, pos: CGPoint, prev: Point? = nil) {
        self.distanceFromStart = fromStart
        self.distanceToEnd = toEnd
        self.position = pos
        self.previousPoint = prev
    }
}

var table: [[Int]] = [ [0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0],
                       [0, 0, -1, 0, 0],
                       [0, 0, -1, 0, 0],
                       [0, 0, 0, 0, 0] ]

let start = CGPoint(x: 1, y: 1)
let end = CGPoint(x: 3, y: 3)

func getDistanceToEnd(from: CGPoint, to: CGPoint) -> Int {
    
    return Int(sqrt( (from.x * to.x) + (from.y * to.y) ))
}

func FindPath(start: CGPoint, end: CGPoint) -> [CGPoint] {
    
    var closedPoint = [Point]()
    var openPoint = [Point]()
    
    let startPoint = Point(fromStart: 0, toEnd: getDistanceToEnd(from: start, to: end), pos: start)
    openPoint.append(startPoint)
    
    while (openPoint.count > 0) {
        
        openPoint.sort { $0.fullDistance < $1.fullDistance }
        let currentPoint = openPoint.first

        if (currentPoint?.position == end) {
            return getPath(path: currentPoint!)
        }
        closedPoint.append(openPoint.removeFirst())
        let neighbours = getNeighbours(from: currentPoint!, closedPoints: closedPoint)
        for index in 0..<neighbours.count {
            var newPoint = openPoint.filter { $0.position == neighbours[index].position }.first
            if (newPoint == nil) {
                openPoint.append(neighbours[index])
            }
            else {
                guard newPoint!.fullDistance > neighbours[index].fullDistance else { continue }
                newPoint?.previousPoint = neighbours[index].previousPoint
                newPoint?.distanceFromStart = neighbours[index].distanceFromStart
            }
        }
    }
    
    return []
}

func getPath(path: Point) -> [CGPoint] {
    
    var result = [CGPoint]()
    var currentPoint: Point? = path
    while (currentPoint != nil) {
        guard let point = currentPoint else { return [path.position] }
        result.append(point.position)
        currentPoint = point.previousPoint
    }
    result.reverse()
    
    return result
}

func getNeighbours(from point: Point, closedPoints: [Point]) -> [Point] {
    
    var neighbours = [Point]()
    var steps = [CGPoint]()
    steps.append(CGPoint(x: point.position.x+1, y: point.position.y))
    steps.append(CGPoint(x: point.position.x-1, y: point.position.y))
    steps.append(CGPoint(x: point.position.x, y: point.position.y+1))
    steps.append(CGPoint(x: point.position.x, y: point.position.y-1))
    steps.append(CGPoint(x: point.position.x+1, y: point.position.y+1))
    steps.append(CGPoint(x: point.position.x+1, y: point.position.y-1))
    steps.append(CGPoint(x: point.position.x-1, y: point.position.y+1))
    steps.append(CGPoint(x: point.position.x-1, y: point.position.y-1))
    
    for index in 0..<steps.count {
        
        let step = steps[index]
        guard isValid(row: Int(step.x), col: Int(step.y)) && isOpenPoint(closedPoint: closedPoints, currentPoint: step) else { continue }
        let curr = Point(fromStart: point.distanceFromStart+1, toEnd: getDistanceToEnd(from: step, to: end), pos: step, prev: point)
        neighbours.append(curr)
    }
    
    return neighbours
}

func isValid(row: Int, col: Int) -> Bool {
    
    return (row >= 0 && row < table.count) && (col >= 0 && col < table[0].count) && table[row][col] >= 0
}

func isOpenPoint(closedPoint: [Point], currentPoint: CGPoint) -> Bool {
    
    let exist = closedPoint.filter { $0.position == currentPoint }
    
    return exist.isEmpty
}

let test = FindPath(start: start, end: end)

for index in 0..<test.count {
    let row = Int(test[index].x)
    let col = Int(test[index].y)
    table[row][col] = index + 1
}

for row in 0..<table.count {
    var msg = ""
    for col in 0..<table[0].count {
        msg += "\(table[row][col]) "
    }
    print(msg)
}




