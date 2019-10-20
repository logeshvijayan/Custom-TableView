//
//  DataSelectorCell.swift
//  customTableView
//
//  Created by logesh on 10/5/18.
//  Copyright © 2018 logesh. All rights reserved.
//

import UIKit

//  MARK: - Class
class DataSelectorCell: UITableViewCell {
    
    //  MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //  MARK: - Public Methods
    func setupCell(text:String, isSelected:Bool) {
        self.textLabel?.text = text
        self.accessoryType = isSelected ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
    }
}

