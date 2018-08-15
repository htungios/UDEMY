//  
//  CoursesViewController.swift
//  UDEMY VIETNAM
//
//  Created by TungHN on 7/30/18.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

protocol CoursesViewOutput {
    func viewDidLoad(view: UIViewController)
    func didSelectCourse(course: CourseViewModel)
}

class CoursesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var output: CoursesViewOutput?
    fileprivate var _courses = [CourseViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.title = "Udemy Việt Nam"
        
        navigationController?.navigationBar.barTintColor = Constant.PRIMARY_DARK_COLOR
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white,
             NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)]
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CourseTableViewCell.self, forCellReuseIdentifier: CourseTableViewCell.reuseIdentifier)
        
        output?.viewDidLoad(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppUtility.lockOrientation(.all)
    }

    @IBAction func showMenuAction(_ sender: UIBarButtonItem) {
        self.slideMenuController()?.openLeft()
    }
}

extension CoursesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseTableViewCell.reuseIdentifier, for: indexPath) as! CourseTableViewCell
        let course = _courses[indexPath.row]
        cell.config(course: course)
        
        return cell
    }
    
}

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = _courses[indexPath.row]
        output?.didSelectCourse(course: course)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension CoursesViewController: CoursesPresenterOutput {

    func showCourses(courses: [CourseViewModel]) {
        _courses = courses
        tableView.reloadData()
    }
    
}

extension CoursesViewController: SlideMenuControllerDelegate {
    
    func leftDidClose() {
        
    }
    
}

