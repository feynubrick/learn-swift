// class 정의
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// instance 만들기
var shape = Shape()
shape.numberOfSides = 7
print("shapeDescription:", shape.simpleDescription())


// 생성자 활용
class NamedShape {
    var numberOfSides: Int
    var name: String

    init(name: String, numberOfSides: Int) {
        self.name = name
        self.numberOfSides = numberOfSides
    }

    func simpleDescription() -> String {
        return "\(self.name) is a shape with \(self.numberOfSides) sides."
    }
}

var namedShape = NamedShape(name: "Square", numberOfSides: 4)
print("description:", namedShape.simpleDescription())

// 상속
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name, numberOfSides: 4)
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
var square = Square(sideLength: 5.2, name: "test square")
print("area:", square.area())
print("simpleDescription:", square.simpleDescription())

// getter and setter
// setter에서 새 값은 별도로 명시하지 않으면 newValue라는 이름을 갖고 있다.
// set (이름) { ... } 으로 명시할 수 있음
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name, numberOfSides: 3)
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
        // OR:
        // set (input) {
        //     sideLength = input / 3.0
        // }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print("perimeter:", triangle.perimeter)
triangle.perimeter = 9.9
print("sideLength:", triangle.sideLength)

// 새 값을 업데이트하기 전후에 뭔가를 해야한다면, willSet, didSet을 사용하면 된다.
// 해당 값이 변할 때마다 호출된다. 하지만 initializer는 제외된다.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet  {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size * 2, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print("triangleAndSquare.square.sideLength:",triangleAndSquare.square.sideLength)
print("triangleAndSquare.triangle.sideLength:",triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print("triangleAndSquare.triangle.sideLength:",triangleAndSquare.triangle.sideLength)


// ?. 으로 nil일 때 호출하지 않기
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
