//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

fileprivate let soundFormat : String = "wav"

class ViewController: UIViewController {

    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        guard let soundName = sender.titleLabel?.text else { return }
        
        playSound(soundName, format: soundFormat)
    }
    
    private func playSound(_ soundName: String, format: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: format)
        else { return }
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

