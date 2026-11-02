import Foundation


//example of async code using completion handlers
func step1(completion: @escaping (String) -> Void) {
    DispatchQueue.global().async() {
        completion("Step 1 complete")
    }
}

func step2(input: String, completion: @escaping (String) -> Void) {
    DispatchQueue.global().async() {
        completion("\(input) → Step 2 complete")
    }
}

func step3(input: String, completion: @escaping (String) -> Void) {
    DispatchQueue.global().async(){
        completion("\(input) → Step 3 complete")
    }
}


// Pyramid of doom using completion handlers
// uncomment for demo then re-comment as uses exit()

func threeStepCodeUsingPyramid(){
    step1 { result1 in
        step2(input: result1) { result2 in
            step3(input: result2) { result3 in
                print(result3)
               // exit(0)
            }
        }
    }
}
    

//async - await version - normal looking methods
func step1() async -> String {
    return "Step 1 complete"
}

func step2(input: String) async -> String {
    return "\(input) → Step 2 complete"
}

func step3(input: String) async -> String {
    return "\(input) → Step 3 complete"
}


func threeStepCodeUsingAwait(){
    Task {
        let result1 = await step1()
        let result2 = await step2(input: result1)
        let result3 = await step3(input: result2)
        print(result3)
    }
    print("some other work")    
}
