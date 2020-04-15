//
//  ViewController.swift
//  DownloadProgressBar
//
//  Created by Sharif Rafi on 1/4/20.
//  Copyright © 2020 Sharif Rafi. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {
    
    var minValue = 0
    let maxValue = 100
    var downloader = Timer()
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var detailContainerView: UIView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var parcentageLabel: UILabel!
    
    @IBOutlet weak var downloadCompleteLabel: UILabel!
    
    
    

    @IBAction func startDownloadButton(_ sender: UIButton) {
        
        startButton.isEnabled = false
        downloader = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(DownloadViewController.updatert)), userInfo: nil, repeats: true)
        progressBar.setProgress(0, animated: false)
        self.detailContainerView.isHidden = false
    }
    
    @objc func updatert() {
        
        if minValue != maxValue{
            minValue += 1
            parcentageLabel.text = "\(minValue)" + " %"
            progressBar.progress = Float(minValue) / Float(maxValue)
        }
        else{
            startButton.isEnabled = true
            minValue = 0
            downloader.invalidate()
            self.detailContainerView.isHidden = true
            self.downloadCompleteLabel.isHidden = false
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //progressBar.setProgress(0, animated: false)
        startButton.layer.cornerRadius = 15
        self.detailContainerView.isHidden = true
        self.downloadCompleteLabel.isHidden = true
    }
}

