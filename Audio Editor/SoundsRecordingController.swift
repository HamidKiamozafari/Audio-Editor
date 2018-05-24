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
        setUpAnimation()
        initializeRecorder()
        
        
    
    }
    @IBAction func stopRecording(_ sender: UIButton	) {
        stopRecordingButton.isEnabled = false
        stopLabel.isHidden = true
        recordingButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        
    }
    
    func setUpAnimation(){
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
    
    func initializeRecorder() {
        let directory =  NSSearchPathForDirectoriesInDomains(.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as String
        let recordingName = "myRecording.wav"
        let pathArray = [directory, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))//filepath is an optional URL
        print(filePath!)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }

}


