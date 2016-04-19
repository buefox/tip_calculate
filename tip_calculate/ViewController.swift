//
//  ViewController.swift
//  tip_calculate
//
//  Created by ANDYYU on 2016/4/19.
//  Copyright © 2016年 ANDYYU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var total_money: UILabel!
    @IBOutlet weak var tip_amount: UILabel!
    @IBOutlet weak var num_people: UISlider!
    @IBOutlet weak var tip_rate: UISlider!
    @IBOutlet weak var cur_tip_rate: UILabel!
    @IBOutlet weak var tax_rate: UISlider!
    @IBOutlet weak var cur_tax_rate: UILabel!
    @IBOutlet weak var raw_money: UITextField!
    @IBOutlet weak var after_tax: UILabel!
    @IBOutlet weak var per_person: UILabel!
    @IBOutlet weak var cur_people: UILabel!
    
    var init_money:Float = 0
    var tip:Float = 0.2
    var tax:Float = 0.05
    var people:Int = 10
    
    
    
    @IBAction func moneyChanged(sender: UITextField) {
        //print("\(sender.text)")
        self.init_money = Float(sender.text! as String)!
        //print("\(self.init_money)")
        self.tip_amount.text = "\(self.init_money*(self.tip))"
        self.after_tax.text = "\(self.init_money*(1+self.tax))"
        self.total_money.text = "\(self.init_money*(1+self.tax+self.tip))"
    }
    @IBAction func tipChanged(sender: UISlider) {
        self.tip = Float(Int(sender.value*100))/100
        sender.setValue(self.tip, animated: true)
        self.cur_tip_rate.text = "\(Int(self.tip*100))%"
        self.tip_amount.text = "\(self.init_money*(self.tip))"
        self.total_money.text = "\(self.init_money*(1+self.tax+self.tip))"
        self.per_person.text = "\(self.init_money*(1+self.tax+self.tip)/Float(self.people))"
    }
    @IBAction func taxChanged(sender: UISlider) {
        self.tax = Float(Int(sender.value*100))/100
        sender.setValue(self.tax, animated: true)
        self.cur_tax_rate.text = "\(Int(self.tax*100))%"
        self.after_tax.text = "\(self.init_money*(1+self.tax))"
        self.total_money.text = "\(self.init_money*(1+self.tax+self.tip))"
        self.per_person.text = "\(self.init_money*(1+self.tax+self.tip)/Float(self.people))"
        
    }
    @IBAction func peopleChanged(sender: UISlider) {
        self.people = Int(sender.value)
        self.cur_people.text = "\(self.people)"
        self.per_person.text = "\(self.init_money*(1+self.tax+self.tip)/Float(self.people))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap(_:)))
        view.addGestureRecognizer(tapGesture)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
           }
    func tap(gesture: UITapGestureRecognizer) {
        raw_money.resignFirstResponder()
    }

}

