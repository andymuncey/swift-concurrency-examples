import Foundation

runAndWait{threeStepCodeUsingPyramid()}
runAndWait{threeStepCodeUsingAwait()}
runAndWait{awaitDemo()}
runAndWait{taskGroupDemo()}


func runAndWait(function: () -> Void){
    print("Press enter to continue")
    function()
    _ = readLine()
}
