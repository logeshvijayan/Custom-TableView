//
//  CustomCell.swift
//  customTableView
//
//  Created by logesh on 9/9/18.
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

    func setupCell(text:String, isSelected:Bool) {
        self.textLabel?.text = text
        self.accessoryType = isSelected ? UITableViewCellAccessoryType.checkmark : UITableViewCellAccessoryType.none
    }
}
