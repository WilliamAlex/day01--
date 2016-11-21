//
//  ViewController.swift
//  day01-秒表
//
//  Created by Alex William on 2016/11/21.
//  Copyright © 2016年 WilliamAlex. All rights reserved.
//
/**
 思路: 当点击"开始计时"按钮时, 创建一个定时器,让计数器每隔0.1秒就加0.1. 当点击"暂停按钮"时,就销毁定时器,如果是点击了"重设按钮",那么就重新初始化计数器为0.
 */

import UIKit

class ViewController: UIViewController {

    // 重设
    @IBOutlet weak var reSetButt0n: UIButton!
    
    // 计数器
    @IBOutlet weak var retainCountLabel: UILabel!
    
    // 开始计时
    @IBOutlet weak var playBtn: UIButton!
    
    // 停止计时
    @IBOutlet weak var puseBtn: UIButton!
    
    // 初始化计数器为0
    var counter = 0.0
    
    // 创建一个定时器
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 默认重设按钮和暂停按钮都是不能点击的
        reSetButt0n.isEnabled = false
        puseBtn.isEnabled = false
        
        // 将计数器上的数字展示到label上
        retainCountLabel.text = String(counter)
    }

    // 开始计时
    @IBAction func playButton(_ sender: UIButton) {
        
        // 点击"开始计时按钮"后,计时按钮不能点击, 暂停按钮以及重设按钮是可以交互的
        playBtn.isEnabled = false
        puseBtn.isEnabled = true
        reSetButt0n.isEnabled = true
        
        // 创建定时器
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        
        counter += 0.1
        
        // 一定要设置下面这句, 规范计数的长度,否则会变得很长
        retainCountLabel.text = String(format: "%.1f", counter)
    }
    
    // 暂停计时
    @IBAction func puseButton(_ sender: UIButton) {
        
        playBtn.isEnabled = true
        puseBtn.isEnabled = false
        timer.invalidate()
    }
    
    // 重设
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate()
        counter = 0.0
        retainCountLabel.text = String(counter)
        playBtn.isEnabled = true
        puseBtn.isEnabled = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

