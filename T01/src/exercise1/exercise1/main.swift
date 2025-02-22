import Foundation

func perimetr() {
    var perimeter: Double = 0
    var triangle: [Int: (Double, Double)] = [:]
    
    var validInput = false
    while !validInput {
        triangle = input()
        if(checkTriangle(triangle: triangle) == true) {
            validInput = true
        } else {
            print("It's not a triangle")
        }
    }
    let points = makePoints(triangle: triangle)
    let segments = makeSegments(x1:points.0, y1:points.1, x2:points.2, y2:points.3, x3:points.4, y3: points.5)
    perimeter = Double(String(format: "%.3f", findPerimetr(segments: segments)))!
    print(perimeter)

}

func input() -> [Int: (Double, Double)] {
    var triangle: [Int: (Double, Double)] = [:]
    for i in 1...3 {
        var x: Double = 0.0
        var y: Double = 0.0
        var validX = false
        while !validX {
            print("вводи x")
            if  let inputX = readLine(),
                let doubleX = Double (inputX) {
                x = doubleX
                validX = true
            } else {
                print("Couldn't parse a number. Please, try again")
            }
        }
        
        var validY = false
        while !validY {
            print("вводи y")
            if let inputY = readLine(),
               let doubleY = Double (inputY) {
                y = doubleY
                validY = true
            } else {
                print("Couldn't parse a number. Please, try again")
            }
        }
        triangle[i] = (x, y)
    }
    return triangle
}

func checkTriangle(triangle: [Int: (Double, Double)] ) -> Bool {
    let points = makePoints(triangle: triangle)
    let area = 0.5 * abs((points.0 * (points.3 - points.5) + points.2 * (points.5 - points.1) + points.4 * (points.1 - points.3)))
    return area > 0
}

func makePoints(triangle: [Int: (Double, Double)] ) -> (Double, Double, Double, Double, Double, Double) {
    let x1 = triangle[1]?.0; let y1 = triangle[1]?.1;
    let x2 = triangle[2]?.0; let y2 = triangle[2]?.1;
    let x3 = triangle[3]?.0; let y3 = triangle[3]?.1;
        return (x1!, y1!, x2!, y2!, x3!, y3!)
}

func makeSegments(x1: Double, y1: Double, x2: Double, y2: Double, x3: Double, y3: Double ) -> (Double, Double, Double) {
    let segment12 = sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2))
    let segment23 = sqrt(pow((x3 - x2), 2) + pow((y3 - y2), 2))
    let segment13 = sqrt(pow((x3 - x1), 2) + pow((y3 - y1), 2))
        return (segment12, segment23, segment13)
}

func findPerimetr(segments:(Double, Double, Double) ) -> Double {
    return Double(segments.0 + segments.1 + segments.2)
}

perimetr()
