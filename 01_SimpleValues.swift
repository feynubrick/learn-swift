// 상수 선언은 let으로
let label = "The width is "
let width = 90

// 변수 선언은 var로
var abc = "abc"
abc = "def"
print("abc:", abc)

// Swift는 강타입 언어다.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// 자바스크립트, 파이썬과는 달리 타입을 명시적으로 변환해줘야 함
let widthLabel = label + String(width)

print("widthLabel:", widthLabel)

// 문자열 다루기
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)

// 여러 줄 사용하기
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """
print("quotation: \(quotation)")

// 배열과 딕셔너리
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"
print("array:", fruits)
fruits.append("blueberries")
print("array:", fruits)


var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print("dictionary: \(occupations)")

let emptyArray: [String] = []
let emptyDictioanry: [String: Float] = [:]
print("emptyArray:", emptyArray)
print("emptyDictionary:", emptyDictioanry)