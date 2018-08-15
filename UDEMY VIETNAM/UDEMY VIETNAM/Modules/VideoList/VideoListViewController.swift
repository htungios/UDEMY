//  
//  VideoListViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/31/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

protocol VideoListViewOutput {
    func viewWillAppear(view: UIViewController)
    func updateVideoStatus(view: UIViewController, video: VideoListViewModel)
    func playVideo(from view: UIViewController, index: Int, videos: [VideoListViewModel])
}

class VideoListViewController: UIViewController {

    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var output: VideoListViewOutput?
    fileprivate var _videoList = [VideoListViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white
        
        tableView.register(SessionCourseTableViewCell.self, forCellReuseIdentifier: SessionCourseTableViewCell.reuseIdentifier)
        tableView.register(LessonCourseTableViewCell.self, forCellReuseIdentifier: LessonCourseTableViewCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
        
        AppUtility.lockOrientation(.portrait)
        
        output?.viewWillAppear(view: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }

}

extension VideoListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let video = _videoList[indexPath.row]
        if video.is_session {
            let cell = tableView.dequeueReusableCell(for: indexPath) as SessionCourseTableViewCell
            cell.config(video: video)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath) as LessonCourseTableViewCell
            cell.config(video: video)
            return cell
        }
    }
    
}

extension VideoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = _videoList[indexPath.row]
        output?.updateVideoStatus(view: self, video: video)
        output?.playVideo(from: self, index: indexPath.row, videos: _videoList)
    }
    
}

extension VideoListViewController: VideoListPresenterOutput {

    func showCourseImage(imageURL: String) {
        let url = URL(string: imageURL)
        courseImageView.sd_setImage(with: url, placeholderImage: nil)
    }
    
    func showVideoList(videos: [VideoListViewModel]) {
        _videoList = videos
        tableView.reloadData()
    }
    
}
