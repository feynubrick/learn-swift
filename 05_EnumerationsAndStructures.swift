// Enum
// rawValue: 0부터 시작해서 다음 값이 정의될 때마다 1씩 증가한다.
// rawValue에 String, Float 등을 할당할 수도 있다.
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}

print("ace:", Rank.ace, Rank.ace.rawValue)
print("jack:", Rank.jack, Rank.jack.rawValue)
print("seven:", Rank.seven, Rank.seven.rawValue)

// 생성자(initializer)에 rawValue를 넣어서 인스턴스를 만드는 방법도 있다.
// 만약 rawValue로 못찾으면 n이 된다.
if let convertedRank = Rank(rawValue: 3) {
    let threeDesc = convertedRank.simpleDescription()
    print("threeDesc:", threeDesc)
}

if let convertedRank = Rank(rawValue: 100) {
    let hundredDesc = convertedRank.simpleDescription()
    print("hundredDesc:", hundredDesc)
} else {
    print("nil")
}

// rawValue 자체가 의미 없는 경우도 있다. 이럴 때는 값을 굳이 제공 안해도 된다.
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartDesc = hearts.simpleDescription()
print("heartDesc:",heartDesc)
print("heartDesc: \(hearts)")

// enum인데 상수가 아니라 경우에 따라 다르게 값이 결정되도록 만들 수도 있다.
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure... \(message)")
}

// struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
print("threeOfSpades:", threeOfSpades.simpleDescription())