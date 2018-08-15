//  
//  VideoViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/3/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol VideoViewOutput {
    func viewWillAppear(view: UIViewController)
    func updateVideoStatus(view: UIViewController, video: VideoListViewModel)
    func nextVideo()
    func previousVideo()
}

class VideoViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var jumpBackwardButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var jumpForwardButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var autoNextButton: UIButton!
    @IBOutlet weak var fullscreenButton: UIButton!
    
    var output: VideoViewOutput?
    var mediaPlayer: VLCMediaPlayer = VLCMediaPlayer()
    var media = VLCMedia()
    var _setPosition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .white
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(VideoViewController.movieViewTapped(_:)))
        self.videoView.addGestureRecognizer(gesture)
        durationSlider.addTarget(self, action: #selector(sliderDidEndSliding(sender:)),
                                 for: .touchUpInside)
        
        durationSlider.addTarget(self, action: #selector(sliderBeganTracking(sender:)),
                                 for: .touchDown)

        playButton.setImage(#imageLiteral(resourceName: "ic_play"), for: .selected)
        playButton.setImage(#imageLiteral(resourceName: "ic_pause"), for: .normal)
        
        autoNextButton.setImage(#imageLiteral(resourceName: "ic_white_auto_play"), for: .normal)
        autoNextButton.setImage(#imageLiteral(resourceName: "ic_yellow_auto_play"), for: .selected)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output?.viewWillAppear(view: self)
        
        mediaPlayer.media = media
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self.videoView
        setupControlButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if (mediaPlayer.media != nil) {
            mediaPlayer.stop()
        }
        
    }
    
    fileprivate func setupControlButton() {
        controlView.isHidden = true
    }
    
    @objc func movieViewTapped(_ sender: UITapGestureRecognizer) {
        controlView.isHidden = !controlView.isHidden
    }
    
    @IBAction func playOrPauseAction(_ sender: UIButton) {
        if mediaPlayer.isPlaying {
            mediaPlayer.pause()
        } else {
            mediaPlayer.play()
        }
        
        playButton.isSelected = !playButton.isSelected
    }
    
    @IBAction func jumpBackwardAction(_ sender: UIButton) {
        mediaPlayer.jumpBackward(15)
    }
    
    @IBAction func jumpForwardAction(_ sender: UIButton) {
        mediaPlayer.jumpForward(15)
    }
    
    @IBAction func previousAction(_ sender: UIButton) {
        output?.previousVideo()
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        output?.nextVideo()
    }
    
    @IBAction func valueChangeAction(_ sender: UISlider) {
        
    }
    
    @objc fileprivate func sliderDidEndSliding(sender: UISlider) {
        _setPositionForReal()
        _setPosition = false
        mediaPlayer.play()
    }
    
    @objc fileprivate func sliderBeganTracking(sender: UISlider) {
        mediaPlayer.pause()
    }
    
    
    @IBAction func autoNextAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @objc fileprivate func _setPositionForReal() {
        if _setPosition == false {
            mediaPlayer.position = durationSlider.value
            _setPosition = true
        }
    }
    
    @IBAction func fullScreenAction(_ sender: UIButton) {
        let currentOrientation: UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        let value = currentOrientation == .portrait ? UIInterfaceOrientation.landscapeLeft.rawValue : UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
}

extension VideoViewController: VLCMediaPlayerDelegate {
    
    func mediaPlayerStateChanged(_ aNotification: Notification!) {
        let currentState = mediaPlayer.state
        if currentState == .opening {
            durationSlider.maximumValue = Float(media.length.intValue)
        }
        
        if currentState == .ended && autoNextButton.isSelected == true {
            output?.nextVideo()
        }
        
        endTimeLabel.text = media.length.stringValue
    }
    
    func mediaPlayerTimeChanged(_ aNotification: Notification!) {
        durationSlider.value = Float(mediaPlayer.position)
        startTimeLabel.text = mediaPlayer.time.stringValue
    }
    
}

extension VideoViewController: VideoPresenterOutput {

    func playVideo(video: VideoListViewModel) {
        if video.is_session == true {
            output?.nextVideo()
            
            return
        }
        
        output?.updateVideoStatus(view: self, video: video)
        durationSlider.minimumValue = 0
        
        let urlStr = Constant.API_VIDEO_HOST + video.link + Constant.SUFFIX_VIDEO
        guard let url = URL(string: urlStr) else {
            return
        }
        
        media = VLCMedia(url: url)
        mediaPlayer.media = media
        mediaPlayer.play()
    }
    
}
