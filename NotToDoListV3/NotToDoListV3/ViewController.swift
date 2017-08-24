//
//  ViewController.swift
//  NotToDoListV3
//
//  Created by arturo ho on 8/6/17.
//  Copyright © 2017 Micajuine App Team. All rights reserved.
//

import UIKit


//UIViewController is parent of UIcollectionViewController, Datasource handles what goes in the cells and delegate handles when cells are touched
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{


    
    let toDoListCellid = "toDoListCellid"
    let notToDoListCellid = "notToDoListCellid"

    
    //Add pageCtonroller
    let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor.darkGray
        pc.numberOfPages = 2
        return pc
    }()
    
    //Add in a collection view
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.purple
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.white
        registerCells()
        setupViews()
        
        //Perhaps this should be frame = navagationframe something like that
        collectionView.frame = view.frame
    }
    
    fileprivate func registerCells() {
        collectionView.register(ToDoListCell.self, forCellWithReuseIdentifier: toDoListCellid)
        collectionView.register(NotToDoListCell.self, forCellWithReuseIdentifier: notToDoListCellid)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        if (indexPath.item == 0) {
            let toDoCell = collectionView.dequeueReusableCell(withReuseIdentifier: toDoListCellid, for: indexPath)
            return toDoCell
        }
        else {
           
        
            let notToDoCell = collectionView.dequeueReusableCell(withReuseIdentifier: notToDoListCellid, for: indexPath)
            
            return notToDoCell
        }
    }

    
    //Size of the Cells (we want it to fit the entire screen)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height-64)
    }
    
    
    //Control the current page for the page contorller, as well as the navagation bar title. 
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageController.currentPage = pageNumber
        
        if (pageNumber == 0) {
            navigationItem.title = "To Do List"
        }
        else {
            navigationItem.title = "Not To Do List"
        }
        
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageController)
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //ios9 constraints x,y,w,h
        
      
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        pageController.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageController.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pageController.heightAnchor.constraint(equalToConstant: 20).isActive = true
        navigationItem.title = "To Do List"
    }
 
//    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
//        
//        print ("hello")
//        collectionView.performBatchUpdates(nil, completion: nil)
//    }
}



