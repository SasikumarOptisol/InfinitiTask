//
//  ViewController.swift
//  InfinitiTask
//
//  Created by Mac-OBS-06 on 23/11/19.
//  Copyright © 2019 OptisolBusinessSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlets
    @IBOutlet weak var tbl_vw: UITableView!
    
    //Variable Creation
    let imageNames = ["garage","kitchen","home","garden"]
    let optionsNames = ["Garage cleaning","Kitchen cleaning","Home floor cleaning","Garden Cleaning"]
    var selcIndexpath = [IndexPath]()
    
    //MARK :  VC Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Cleaning Service"
        self.tbl_vw.allowsSelection = true
        self.tbl_vw?.register(UINib(nibName: "CustomeCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tbl_vw.isScrollEnabled = false
        self.tbl_vw.tableFooterView = UIView(frame: CGRect.zero)

    }
    
    //Custome Functions
    func showAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    //MARK :  Button Actions
    
    @IBAction func btnAction_Proceed(_ sender: UIButton) {
        switch selcIndexpath.count {
        case 0:
            self.showAlert(title: "Error", message: "Please select atleast one option from the list.")
        case 1:
            self.showAlert(title: "Success", message: "You have selected \(self.selcIndexpath.count) option.")
        case 4:
            self.showAlert(title: "Error", message: "You are allowed select only three option.")
        default:
            self.showAlert(title: "Success", message: "You have selected \(self.selcIndexpath.count) options.")
        }
    }
}

//MARK :  UITableView DataSource

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomeCell
        if selcIndexpath.contains(indexPath) {
            cell.imgvw_checkbox.image =  UIImage(named: "check")
        }else{
            cell.imgvw_checkbox.image =  UIImage(named: "uncheck")
        }
        cell.selectionStyle = .none
        cell.lbl_option.text = optionsNames[indexPath.row]
        cell.imgvw_option.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
}

//MARK :  UITableView Delegates
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        if let index = selcIndexpath.firstIndex(where: {$0 == indexPath}) {
            self.selcIndexpath.remove(at: index)
        }else{
            self.selcIndexpath.append(indexPath)
        }
        print("self.selcIndexpath?:",self.selcIndexpath)
        self.tbl_vw.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if UIScreen.main.bounds.size.height < 736.0 {
            return 60
        } else {
            return 80
        }
    }
}

