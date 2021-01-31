//
//  ViewController.swift
//  StopWatch
//
//  Created by Mac on 2021/01/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer() //タイマーの宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func start(){
        if !timer.isValid{//タイマーが動作していなかったら
            timer = Timer.scheduledTimer(timeInterval: 0.01, //0.01s間隔で呼び出す
                                         target: self,
                                         selector: #selector(self.up), //メソッド名
                                         userInfo: nil,
                                         repeats: true) //繰り返すとき：true
            label2.text = ""
        }
    }
    
    @IBAction func stop(){
        if timer.isValid{ //タイマーが動作していたら
            timer.invalidate() //タイマーを停止する
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{ //タイマーが動作していたら
            timer.invalidate() //タイマーを停止する
        }
        count = 0
        label.text = String(format: "%.2f", count)
        label2.text = ""
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count >= 9.8 && count <= 10.2{
            label2.text = "PERFECT!"
                label2.textColor = UIColor.red
        }
        else if count >= 9.7 && count <= 10.3{
            label2.text = "GREAT"
                label2.textColor = UIColor.yellow
        }
        else if count >= 9.5 && count <= 10.5{
            label2.text = "GOOD"
                label2.textColor = UIColor.green
        }
        else{
            label2.text = "BAD"
                label2.textColor = UIColor.blue
        }
    }
}

