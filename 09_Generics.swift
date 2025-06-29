// angle bracket을 사용한다.
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

let result = makeArray(repeating: "knock", numberOfTimes: 4)
print("result:", result)

// function, method, class, enum, struct에 모두 사용 가능
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
print("possibleInteger:", possibleInteger)

// body 전에 where 를 써서 요구사항 목록을 명시한다.
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

print("anyCommonElements([1, 2, 3], [3]):", anyCommonElements([1, 2, 3], [3]))