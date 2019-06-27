//
//  GenericPicker.swift
//  iRumi
//
//  Created by Israel Matias on 6/26/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import UIKit
import Foundation

protocol GenericPickerDelegate{
    func selectRow(tag: Int)
}

class GenericPicker: UITextField {
    
    var picker: UIPickerView! = UIPickerView()
    
    var titlesArray: NSMutableArray = []
    var dataArray: NSMutableArray = []
    
    var selectedIndex: Int = -1
    var newIndex: Int = 0
    
    var genericPickerDelegate: GenericPickerDelegate!
    var pickerTag: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.picker.delegate = self
        self.picker.dataSource = self
        self.inputView = self.picker
        
    }
    
    func initPicker(){
        let title = self.titlesArray[0] as! String
        self.text = title
        self.selectedIndex = 0
        self.picker.reloadAllComponents()
        self.genericPickerDelegate.selectRow(tag: self.pickerTag)
    }

}

extension GenericPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.titlesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = self.titlesArray[row] as! String
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let title = self.titlesArray[row] as! String
        self.text = title
        self.selectedIndex = row
        self.genericPickerDelegate.selectRow(tag: self.pickerTag)
    }
    
    func initializeInputAccessoryBar() {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y:0, width: self.frame.size.width, height: 30))
        
        let doneButton = UIBarButtonItem(title: "Esta seguro?", style: .done, target: self, action: #selector(GenericPicker.dismissPicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.sizeToFit()
        
        toolBar.tintColor = UIColor.black
        toolBar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = toolBar
    }
    
    @objc func dismissPicker() {
        
        self.endEditing(true)
    }
    
}
