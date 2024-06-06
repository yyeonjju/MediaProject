//
//  LotteryViewController+Picker.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import UIKit


extension LotteryViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return episodeNumberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(episodeNumberList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedEpisode = episodeNumberList[row]
        pickerTextField.text = String(episodeNumberList[row])
    }
    
}
