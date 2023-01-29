import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var howLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        howLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            howLabel.text = "Done!"
            player = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!)
            player.play()
        }
    }
}
