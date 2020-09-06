//
//  ViewController2.swift
//  tokei
//
//  Created by 久保　直哉 on 2020/08/29.
//  Copyright © 2020 久保　直哉. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var label: UILabel!
    var ss:Int = 0
    var mm:Int = 0
    var sss:String="00"
    var mms:String="00"
    var timer=Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func timerPlus(){
        ss=ss+1
        if ss==60{
            ss=0
            mm=mm+1
        }
        
        if ss<10{
            sss="0"+String(ss)
        }else{
            sss=String(ss)
        }
    
        if mm<10{
            mms="0"+String(mm)
        }else{
            mms=String(mm)
        }
        
        label.text=mms+":"+sss
    }
    
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timerPlus), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }

    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        ss = 0
        mm = 0
        label.text="00:00"
    }
    
}
