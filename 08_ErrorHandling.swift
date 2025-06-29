// 아무 타입이나 Error 프로토콜을 따르게 해서 에러를 나타낼 수 있다.
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 에러 던지기 (throw)
// 함수가 에러를 던질 수 있다고 명시해야 함. 안하면 에러 못던짐
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// 에러 잡기 (do-catch)
do {
    // let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner") // 에러를 던질 수 있다고 되어 있는 함수를 사용할 때는 try를 사용해야 함.
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error) // 에러 이름을 명시하지 않는 한, error라는 이름의 변수에 에러 객체가 담겨 온다.
}

// 에러 잡기 (try?)
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
print("printerFailure == nil:", printerFailure == nil)
// 함수가 에러를 던지면 에러는 무시되고 결과는 nil이 된다.

// defer
// 함수 내의 모든 코득사 실행되고 반환하기 직전에 실행되는 코드를 만들 수 있다. finally 처럼 에러가 나도 실행한다.
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}

if fridgeContains("banana") {
    print("Found a banana")
}
print("fridgeIsOpen:", fridgeIsOpen)