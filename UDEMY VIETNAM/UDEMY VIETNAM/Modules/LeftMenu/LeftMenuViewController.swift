//  
//  LeftMenuViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 8/9/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit
import SDWebImage
import ImageSlideshow

protocol LeftMenuViewOutput {
    func viewDidLoad(view: UIViewController)
    func showPromotion(view: UIViewController)
}

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleImage: UILabel!
    
    var output: LeftMenuViewOutput?
    var coursesViewController: UIViewController?
    fileprivate var _medias = [MenuImageModel]()
    fileprivate var _index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupImageSlide()
        
        output?.viewDidLoad(view: self)
    }
    
    fileprivate func setupTableView() {
        tableView.bounces = false
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.reuseIdentifier)
    }
    
    fileprivate func setupImageSlide() {
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.underScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideshow.pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { [weak self] page in
            if let media = self?._medias[page] {
                self?.titleImage.text = media.text
                self?._index = page
            }
        }

        slideshow.contentScaleMode = .scaleAspectFit
    }
    
}

extension LeftMenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MenuTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.menuImage.image = #imageLiteral(resourceName: "ic_book")
            cell.titleLabel.text = "Các khoá học của tôi"

        default:
            cell.menuImage.image = #imageLiteral(resourceName: "ic_send")
            cell.titleLabel.text = "Đăng xuất"
        }
        
        return cell
    }
    
}

extension LeftMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let titleLabel = UILabel()
        
        view.addSubview(titleLabel)
        
        view.addConstraints(withFormat: "H:|-15-[v0]-10-|", views: titleLabel)
        view.addConstraints(withFormat: "V:|-10-[v0]-10-|", views: titleLabel)
        
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.text = "Cá nhân"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 40
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.slideMenuController()?.closeLeft()
        default:
            self.slideMenuController()?.closeLeft()
            self.dismiss(animated: false, completion: nil)
        }
    }
    
}

extension LeftMenuViewController: LeftMenuPresenterOutput {
    
    func showImages(data: [MenuImageModel]) {
        _medias = data
        var links = Array<SDWebImageSource>()
        for media in data {
            let imageTemp = SDWebImageSource(urlString: media.image, placeholder: nil)
            if let imageSource = imageTemp {
                links.append(imageSource)
            }
        }
        
        if let firstMedia = data.first {
            titleImage.text = " " + firstMedia.text
        }
        
        slideshow.setImageInputs(links)
        
        if links.count == 0 {
            let image = UIImageView(frame: slideshow.frame)
            image.image = nil
            image.contentMode = .scaleAspectFit
            self.view.addSubview(image)
        }
    }
    
}
