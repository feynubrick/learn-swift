// function
// 기본으로 label을 붙여서 인자를 넘겨야 한다.
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

// no argument label: label 이름 앞에 _ 를 붙인다.
func greet(_ person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet("John", day: "Wednesday"))

// tuple 사용하기
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print("statistics:", statistics)
print("statistics.min:", statistics.min)
print("statistics.max:", statistics.max)
print("statistics.sum:", statistics.sum)
print("statistics.0:", statistics.0)
print("statistics.1:", statistics.1)
print("statistics.2:", statistics.2)

// nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print("returnFifteen:", returnFifteen())

// function을 변수에 담아 전달하기. 함수는 first-class type
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
print("increment(7):", increment(7))

// 함수를 argument에 담아 전달하기
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
print("result:", hasAnyMatches(list: numbers, condition: lessThanTen))

// Closure: 나중에 호출될 수 있는 코드 블록
// 클로저 안에 있는 코드는 클로저가 만들어진 스코프 내의 변수, 함수에 접근할 수 있다.

// 클로저를 만드는 방법 중 하나: { (인자) -> 반환형 in 여러 줄 내용 }
print(numbers.map({ (number: Int) -> Int in 
    let result = 3 * number;
    return result
}))

// number의 타입은 이미 알려져 있다. 이럴 때는 다음과 같이 타입을 생략해도 된다.
let mappedNumbers = numbers.map({ number in 3 * number })
print("mappedNumbers:", mappedNumbers)

// 파라미터를 가리킬 때 숫자를 사용할 수 있다.
// trailing closure: 클로저가 마지막 인자라면 괄호를 생략하고 인자 바깥에 넣을 수 있다.
let sortedNumbers = numbers.sorted { $0 > $1 }
print("sortedNumbers: ", sortedNumbers)