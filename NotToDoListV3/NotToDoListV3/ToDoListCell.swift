//
//  ToDoListCell.swift
//  NotToDoListV3
//
//  Created by arturo ho on 8/18/17.
//  Copyright © 2017 Micajuine App Team. All rights reserved.
//

import UIKit

class ToDoListCell: UICollectionViewCell {
    
    
    var tdlArray = ["Do Homework", "Walk Dog", "Study"]
    let tdlCell = "tdlCell"
    
    
    
    let addButton: UIButton = {
        let ab = UIButton(type: .system)
        ab.setTitle("Add Item", for: .normal)
        ab.setTitleColor(UIColor.darkGray, for: .normal)
        ab.setTitleColor(UIColor.gray, for: .highlighted)
        ab.setTitleColor(UIColor.gray, for: .selected)
        ab.translatesAutoresizingMaskIntoConstraints = false
        return ab
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter To Do Task"
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let lineSpace: UIView = {
        let ls = UIView()
        ls.backgroundColor = UIColor.lightGray
        ls.translatesAutoresizingMaskIntoConstraints = false
        return ls
    }()
    
    let addBar: UIView = {
        let ab = UIView()
        ab.backgroundColor = UIColor.white
        ab.translatesAutoresizingMaskIntoConstraints = false
        return ab
    }()
    
    lazy var tableViewList: UITableView = {
        let tb = UITableView()
        tb.dataSource = self
        tb.delegate = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableViewList.register(UITableViewCell.self, forCellReuseIdentifier: tdlCell)
        setUpViews()
    
        backgroundColor = UIColor.orange
    }
    
    
    
    func handleButtonClicked() {
        guard let text: String = textField.text else {
            print ("guard issue")
            return
        }
        
        
        if text != "" {
            textField.text = ""
            tdlArray.append(text)
            self.tableViewList.reloadData()
        }
    }
    
    func setUpViews() {
        //Can't have this inside the creation of it... weird
        addButton.addTarget(self, action: #selector(handleButtonClicked), for: .touchUpInside)
        
        addSubview(addBar)
        addSubview(addButton)
        addSubview(textField)
        addSubview(lineSpace)
        addSubview(tableViewList)
        
        
        //ios 9 x,y,w,h
        
        addBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        addBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        addBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addBar.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
        addButton.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 16).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: 16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        lineSpace.topAnchor.constraint(equalTo: addBar.bottomAnchor).isActive = true
        lineSpace.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineSpace.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lineSpace.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        tableViewList.topAnchor.constraint(equalTo: lineSpace.bottomAnchor).isActive = true
        tableViewList.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableViewList.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableViewList.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension ToDoListCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            tdlArray.remove(at: indexPath.row)
            tableViewList.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tdlArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tdlCell, for: indexPath)
        cell.textLabel?.text = tdlArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

    
    
