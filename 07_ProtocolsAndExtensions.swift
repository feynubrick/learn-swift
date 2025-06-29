// protocol 정의
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 이 protocol 채택하기: class, enum, struct에서 사용 가능

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {  // mutating 키워드를 안썼다? 클래스의 메서드는 언제나 class 자체를 바꾸기 때문에 안쓴다.
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
print("a.simpleDescription:", a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {  // mutating 키워드를 빼먹으면 안된다.
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
print("b.simpleDescription:", b.simpleDescription)

// extension
// 이미 존재하는 타입에 기능을 더할 때 사용 한다.
// 다음은 Int 타입에 ExampleProtocol을 채택하게 만든다.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

print("7.simpleDescription:", 7.simpleDescription)

// 특정 프로토콜을 따르는 값이라는 뜻으로 다음과 같이 타입을 표시한다.
let protocolValue: any ExampleProtocol = a

print("protocolValue.simpleDescription:", protocolValue.simpleDescription)