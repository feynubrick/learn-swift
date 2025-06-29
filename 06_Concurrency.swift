// async, await
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)" // 두개가 다 끝날 때까지 기다린다.
    print(greeting)
}

// 동기 코드에 비동기 함수를 호출할 때는 다음과 같이 Task를 사용한다.
Task {
    await connectUser(to: "primary")
}

// task group
// Int.self -> 타입 자체를 값으로 넘길 때. 여기서는 Int 타입을 반환할거라는 뜻으로 사용됨
let userIDs = await withTaskGroup(of: Int.self) { group in 
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserID(from: server)
        }
    }

    var results: [Int] = [];
    for await result in group {
        results.append(result)
    }
    return results
}
print("userIDs:", userIDs)

// Actors: 동시성 안정성을 보장하기 위한 기능
// 같은 인스턴스의 메서드를 호출하면, 이전에 실행중이던 같은 메서드 호출이 종료되면 그 다음에 호출된 것을 처리하도록 강제한다.
actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}
let server = ServerConnection()
let userID = await server.connect()
print("userID:", userID)
