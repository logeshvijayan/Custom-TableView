//
//  DataManager.swift
//  customTableView
//
//  Created by logesh on 9/17/18.
//  Copyright © 2018 logesh. All rights reserved.
//

//import Foundation
//import UIKit
//
////  MARK: - Class
//class DataManager: NSObject {
//    
//    //  MARK: - Life Cycle
//    override init() {
//        super.init()
//    }
//    
//    //  MARK: - Properties
//    let defaults = UserDefaults.standard
//    
//    //  MARK: - User Defaults Getters
//    func getIndexpath(forKey:String)->String {
//        var data:IndexPath? = nil
//        if let value = defaults.dictionary(forKey: forKey) {
//       //     data = value
//        }
////        return data
//    }
//    
//    //  MARK: - User Defaults Setters
//    func setIndexpath(forKey:String, value:Any) {
//        defaults.set(value, forKey: forKey)
//        defaults.synchronize()
//    }
//}
//
////  MARK: - Class
//class SettingsManager:DataManager {
//    
//    //  MARK: - Properties
//    let singleselection:String = "singleSelection"
//    let multipleselectoin:String = "multipleSelection"
//    
//    
//    //  MARK: - Getter Methods
//    func getselectedsinlevalues()->String {
////        return self.getdata(forKey: singleselection)!
//    }
//    
//    func getselectedmultiplevalues()->String {
////        return self.getdata(forKey: multipleselectoin)!
//    }
//    
//    //  MARK: - Setter Methods
//    func setselectedvalues(value:IndexPath) {
////        self.setIndexpath(forKey: selectedData, value: value)
//    }
////    func setselectedvalues(value:IndexPath) {
////        self.setIndexpath(forKey: selectedData, value: value)
//    }
//    
//  
//}
