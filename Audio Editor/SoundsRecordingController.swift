//
//  SoundsRecordingController.swift
//  Pitch Perfect
//
//  Created by David Ilenwabor on 5/18/18.
//  Copyright © 2018 DJTech. All rights reserved.
//

import UIKit
import AVFoundation

class SoundsRecordingController: UIViewController {
    
    var audioRecorder : AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false //disables stop recording button
        stopLabel.isHidden = true //Hide Stop Label
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Did appear called")
    }


    @IBAction func recordAudio(_ sender: AnyObject) {
        
        stopRecordingButton.isEnabled = true //enables stopRecording button
        stopLabel.isHidden = false
        recordingButton.isEnabled = false
        recordingLabel.text = "Recording in Progress"
            
            self.recordingButton.alpha = 0.0
            
        
            UIView.animate(withDuration: 2.0, animations: {
                self.recordingButton.alpha = 0.0
            }) { (finished) in
                
                UIView.animate(withDuration: 2.0, animations: {
                    self.recordingButton.alpha = 1.0
                    //fade in button
                })
        }
    
    }
    @IBAction func stopRecording(_ sender: UIButton	) {
        stopRecordingButton.isEnabled = false
        stopLabel.isHidden = true
        recordingButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        
    }
}


