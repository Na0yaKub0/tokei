//
//  ViewController3.swift
//  tokei
//
//  Created by 久保　直哉 on 2020/08/29.
//  Copyright © 2020 久保　直哉. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController3: UIViewController {
    @IBOutlet weak var label: UILabel!
    var ss:Int = 0
    var mm:Int = 0
    var sss:String="00"
    var mms:String="00"
    var timer=Timer()
    @IBOutlet weak var test: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func timerminus(){
        test.value=test.value-1
        
        ss=Int(test.value)%60
        mm=Int(test.value)/60
        
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
        
        if test.value == 0{
            AudioServicesPlaySystemSoundWithCompletion(1005){
                
            }
            let alertController = UIAlertController(title: "STOP",message:"STOPを押して下さい",preferredStyle:UIAlertController.Style.alert)
            let STOP = UIAlertAction(title: "STOP", style: UIAlertAction.Style.default){(action:UIAlertAction)in
                
                self.timer.invalidate()

            }
              alertController.addAction(STOP)
            present(alertController, animated:true, completion:nil)
        }
    }
    
    @IBAction func test(_ sender: Any) {
        ss=Int(test.value)%60
        mm=Int(test.value)/60
        
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (timerminus), userInfo: nil, repeats: true)

    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }

    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        test.value=0
        label.text="00:00"
    }

}
