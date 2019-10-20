//
//  ViewController.swift
//  customTableView
//
//  Created by logesh on 9/5/18.
//  Copyright © 2018 logesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataSelectorViewDelegate {

    
    var currentSelection:[String:String] = ["BL": "Brazil", "GE": "Germanay", "Au": "Australia"]
   @IBOutlet var dataSelectorView: DataSelectorView!
    var countries : [String : String] = ["IN" : "India" ,"CA" : "Canada","NY" : "NewYork","RA" : "Russia","GE" : "Germanay","AA" : " Antartica" ,"Au" : "Australia" ,"SN" :"Spain" ,"BL" : "Brazil","RN" : "Romania" ,"GR" : "Greece" ,"ND" : "Netherlands" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initScreen() {
        
        self.dataSelectorView.setupSelection(withData: countries, withTitle: "Country", withCurrentSelection: currentSelection, andSingleSelection: false)
        self.dataSelectorView.delegate = self
    }
    
    func didCancelSelection() {
        print("selection canceled")
    }
    
    func didSaveSelection(data: [String : String]) {
        currentSelection = data
        print(data)
    }
}


