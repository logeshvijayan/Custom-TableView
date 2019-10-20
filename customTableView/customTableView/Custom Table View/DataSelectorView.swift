//
//  CustomView.swift
//  customTableView
//
//  Created by logesh on 9/5/18.
//  Copyright © 2018 logesh. All rights reserved.
//

import UIKit

//  MARK: - Protocol
protocol DataSelectorViewDelegate {
    func didSaveSelection(data:[String:String])
    func didCancelSelection()
}

//  MARK: - Class
class DataSelectorView: UIView {

    //  MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var cancelButton: UIButton!
    @IBOutlet private var saveButton: UIButton!
    @IBOutlet private var dataSearchBar: UISearchBar!
    @IBOutlet private var dataTableView: UITableView!

    //  MARK: - Properties
    private var dataSouce = [String : String]()
    private var dataFiltered = [String : String]()
    private var dataSelected = [String : String]()
    private var isSingleSelection : Bool = false
    private var dataKeys = [String]()
    private var dataValues = [String]()
    var delegate:DataSelectorViewDelegate?

    //  MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initScreen()
    }
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initScreen()
    }
    
    //  MARK: - Outlet Action Methods
    @IBAction func saveSelection(_ sender: Any) {
        self.delegate?.didSaveSelection(data: self.dataSelected)
    }
    
    @IBAction func cancelSelection(_ sender: Any) {
        self.delegate?.didCancelSelection()
    }

    //  MARK: - Public Methods
    func setupSelection(withData dataSource:[String:String], withTitle title:String, withCurrentSelection dataSelected:[String:String], andSingleSelection isSingleSelection: Bool = true) {
        self.dataSouce = dataSource
        self.dataSelected = dataSelected
        self.isSingleSelection = isSingleSelection
        self.titleLabel.text = title
        self.manageData()
    }

    //  MARK: - Private Methods
    private func initScreen()
    {
        Bundle.main.loadNibNamed("DataSelectorView", owner: self, options: nil)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
        self.setupTitleBar()
        self.setupTableView()
        self.setupSearchBar()
    }

    private func setupTitleBar() {
        self.cancelButton.setTitle("Cancel", for: .normal)
        self.saveButton.setTitle("Save", for: .normal)
        self.titleLabel.text = ""
    }
    
    private func manageData() {
        self.dataFiltered = self.dataSouce
        if let text = self.dataSearchBar.text {
            if !text.isEmpty {
                self.dataFiltered = self.dataSouce.filter({$0.value.lowercased().contains(text.lowercased())})
            }
        }
        self.dataKeys = [String](dataFiltered.keys).sorted()
        self.dataValues = [String](dataFiltered.values).sorted()
        self.dataTableView.reloadData()
    }

    private func isSelected(data:String)->Bool {
        for item in self.dataSelected {
            if item.value == data {
                return true
            }
        }
        return false
    }
    
    private func getKey(data:String)->String {
        for item in self.dataSouce {
            if item.value == data {
                return item.key
            }
        }
        return ""
    }
    
    private func addData(data:String) {
        for item in self.dataSouce {
            if item.value == data {
                self.dataSelected[item.key] = item.value
            }
        }
    }
    
    private func removeData(data:String){
        let key = self.getKey(data: data)
        self.dataSelected = self.dataSelected.filter{$0.key != key}
    }
    
    private func manageSelection(index:Int) {
        let data = self.dataValues[index]
        if isSingleSelection {
            self.dataSelected.removeAll()
            self.addData(data: data)
        }
        else {
            if isSelected(data: data) {
                self.removeData(data: data)
            }
            else {
                self.addData(data: data)
            }
        }
        self.dataTableView.reloadData()
    }

}


//  MARK: - Search Bar Extension
extension DataSelectorView:UISearchBarDelegate {
    //  MARK: - Search Bar Delegate Methods
    private func setupSearchBar() {
        self.dataSearchBar.delegate = self
    }
    
    internal func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    internal func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    internal func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.manageData()
    }
    
    internal func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dataSearchBar.endEditing(true)
        self.dataSearchBar.showsCancelButton = false
        self.dataSearchBar.text = ""
        self.manageData()
    }
    
    internal func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        dataSearchBar.endEditing(true)
        dataSearchBar.showsCancelButton = false
    }
}

//  MARK: - Table View Extension
extension DataSelectorView: UITableViewDelegate, UITableViewDataSource {
    
    //  MARK: - Table View Data Source Methods
    private func setupTableView() {
        self.dataTableView.register(DataSelectorCell.self, forCellReuseIdentifier: "DataCell")
        self.dataTableView.dataSource = self
        self.dataTableView.delegate = self
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataValues.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataSelectorCell
        let data = self.dataValues[indexPath.row]
        let isSelected = self.isSelected(data: data)
        dataCell.setupCell(text: data, isSelected: isSelected)
        return dataCell
    }
    
    //  MARK: - Table View Delegate Methods
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.manageSelection(index: indexPath.row)
    }
}
