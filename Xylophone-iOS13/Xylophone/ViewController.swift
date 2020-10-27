import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        //Printing start when the button is pressed
        print ("Start")
        
        //Playing the sound
        playSound(soundName: sender.currentTitle!)
        
        //Decreasing the opacity of the button
        sender.alpha = 0.5
        
        //Delay the opacity returning back time by 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            //Print End
            print ("End")
            
            //After .2 second delay increase the opacity back
            sender.alpha = 1
        }
        
        }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
