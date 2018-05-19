//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by David Ilenwabor on 5/18/18.
//  Copyright © 2018 DJTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(_ sender: AnyObject) {
            
            self.recordingButton.alpha = 0.0
            
        
            UIView.animate(withDuration: 2.0, animations: {
                self.recordingButton.alpha = 0.0
            }) { (finished) in
                
                UIView.animate(withDuration: 2.0, animations: {
                    self.recordingButton.alpha = 1.0
                    
                })
        }	
    
    }
    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording button was pressed")
    }
}


