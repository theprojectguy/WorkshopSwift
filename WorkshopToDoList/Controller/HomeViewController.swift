//
//  ViewController.swift
//  WorkshopToDoList
//
//  Created by Valentin Mille on 19/05/2020.
//  Copyright © 2020 Valentin Mille. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var taskToDo: [String] = []
    @IBOutlet var addTaskTextField: UITextField!
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addButton: UIButton!
    let spacingCell: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.rowHeight = 65
        self.listTableView.allowsSelection = false
        self.listTableView.separatorStyle = .none
        self.listTableView.register(DesignTableViewCell.self, forCellReuseIdentifier: "CellDesign")
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.addButton.layer.cornerRadius = self.addButton.frame.height / 2
        // Do any additional setup after loading the view.
    }

    @IBAction func AddTaskButton(_ sender: UIButton) {
        self.insertNewTask()
    }
    
    func insertNewTask() {
        if let task = addTaskTextField.text {
            if task != "" {
                taskToDo.insert(task, at: 0)
                let indexPath = IndexPath(row: self.taskToDo.count - 1, section: 0)
                self.listTableView.beginUpdates()
                self.listTableView.insertRows(at: [indexPath], with: .fade)
                //self.listTableView.insertSections(IndexSet(integer: 0), with: .left)
                self.listTableView.endUpdates()
                addTaskTextField.text = ""
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1//self.taskToDo.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskToDo.count//1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return spacingCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDesign", for: indexPath) as! DesignTableViewCell
        cell.textLabel?.text = self.taskToDo[indexPath.section]
        
        //cell.textLabel?.text = self.taskToDo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            taskToDo.remove(at: indexPath.section)
//            tableView.deleteSections(IndexSet(arrayLiteral: indexPath.section), with: .fade)
            taskToDo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

