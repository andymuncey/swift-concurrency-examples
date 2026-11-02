import Foundation //for Date

//Takes 5 seconds to run
func getX() async ->  String {
    try? await Task.sleep(nanoseconds: 5_000_000_000)
    return "X"
}

//Takes 5 seconds to run
func getY() async -> String {
    try? await Task.sleep(nanoseconds: 5_000_000_000)
    return "Y"
}

func awaitDemo(){
    Task {
        print("Running 2 x 5 second tasks simultaneously")
        let start = Date.now //store start time
        
        async let x = getX() //execution starts immediately
        async let y = getY() //execution starts immediately
        
        //must use await to access value of x / y
        let coldPlayAlbum = "\(await x)&\(await y)"
        let end = Date.now //capture end time
        
        print(coldPlayAlbum) //for context the band Coldplay have and album called X&Y
        
        let elapsed = end.timeIntervalSince(start)
        print("Took \(elapsed) seconds")
    }
}

func getAsString(x: Int) async -> String {
    try? await Task.sleep(nanoseconds: 3_000_000_000)
    return "\(x)"
}


func getAllStrings() async -> [String] {

   await withTaskGroup(of: String.self){ group in
        for i in 1...25 {
            group.addTask {
                await getAsString(x: i)
            }
        }
        var results = [String]()
        
        for await value in group {
            results.append(value)
        }
       return results
    }
   
}

func taskGroupDemo(){
    Task {
        print(await getAllStrings())
    }
}
