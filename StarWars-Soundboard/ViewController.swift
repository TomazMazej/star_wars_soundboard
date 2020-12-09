//
//  ViewController.swift
//  StarWars-Soundboard
//
//  Created by Tomaz Mazej on 09/12/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let soundFileNames = ["VaderBreathing", "ChewyRoar", "Jabba", "R2D2"]
    var audioPlayers = [AVAudioPlayer]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for sound in soundFileNames{
            do{
                let url = NSURL(fileURLWithPath: Bundle.main.path(forResource: sound, ofType: "wav")!)
                let audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
                
                audioPlayers.append(audioPlayer)
            }
            catch{
                audioPlayers.append(AVAudioPlayer())
            }
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
    }
}

