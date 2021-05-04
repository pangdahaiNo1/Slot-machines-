//
//  ViewController.swift
//  slotmachineDemo
//
//  Created by 胖大海 on 2021/5/3.
//  Copyright © 2021 胖大海. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerAnimalData.count
    }
    
    //MARK-实现UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       print(self.pickerAnimalData[row] as! String)
        return self.pickerAnimalData[row] as? String
    }
    var pickerData:NSDictionary!//保存的全部数据
    var pickerItemData:NSArray!//保存的Item项数据
    var pickerAnimalData:NSArray!//保存的animalitem数据
    var pickerFoodData:NSArray!//保存的fooditem数据
    @IBAction func onClick(_ sender: Any) {
        pickerView.selectRow(Int(arc4random())%(pickerAnimalData.count), inComponent: 0, animated: true)
                pickerView.selectRow(Int(arc4random())%(pickerAnimalData.count), inComponent: 1, animated: true)
                pickerView.selectRow(Int(arc4random())%(pickerAnimalData.count), inComponent: 2, animated: true)
        //把值取出来
        let d1 = (pickerAnimalData[pickerView.selectedRow(inComponent: 0)]) as! String
        let d2 = (pickerAnimalData[pickerView.selectedRow(inComponent: 1)]) as! String
        let d3 = (pickerAnimalData[pickerView.selectedRow(inComponent: 2)]) as! String
        //判断三者是否相等
        if d1 == d2&&d1==d3{
            label.text = "Nice!"
        }
        else
        {
            label.text = "💔"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        //获取文件路径
        guard let plistPath = Bundle.main.path(forResource: "Property List", ofType: "plist") else
        {
            print("The file can not be found.")
            exit(1)
        }
        //获取属性列表文件中的全部数据
        let dict = NSDictionary(contentsOfFile: plistPath)
        self.pickerData = dict
        
        //获取全部item项数据
        self.pickerItemData = self.pickerData.allKeys as NSArray
        
        //获取animalitem数据
        self.pickerAnimalData = self.pickerData[self.pickerItemData[0] as! String] as! NSArray
        //获取fooditem数据
        self.pickerFoodData = self.pickerData[self.pickerItemData[1] as! String] as! NSArray
    }


}

