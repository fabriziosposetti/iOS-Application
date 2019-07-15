//
//  AnimationViewController.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit
import AVFoundation

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var fadeButton: UIButton!
    var bombSoundEffect: AVAudioPlayer?
    var location = CGPoint(x: 0, y: 0)
    
    
    let fadeOutSound = "fade_out_sound.mp3"
    let fadeInSound = "fade_in_sound.mp3"

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Text.Animation.description
    }
    
    // MARK: - Actions
    
    @IBAction func didPressFade(_ sender: Any) {
        if logo.alpha == 1 {
            UIView.animate(withDuration: CONSTANTS.ANIMATION_DURATION, animations: { () -> Void in
                self.logo.alpha = 0
            })
            playSound(sound: fadeOutSound)
            fadeButton.setTitle(Text.FadeIn.description, for: .normal)
        } else {
            UIView.animate(withDuration: CONSTANTS.ANIMATION_DURATION, animations: { () -> Void in
                self.logo.alpha = 1
            })
            playSound(sound: fadeInSound)
            fadeButton.setTitle(Text.FadeOut.description, for: .normal)
        }
    }
    
    func playSound(sound: String) {
        let path = Bundle.main.path(forResource: sound, ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch let error {
            debugPrint(Text.Error.description + error.localizedDescription)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        logo.center = location
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch! = touches.first
        location = touch.location(in: self.view)
        logo.center = location
    }
    
}
