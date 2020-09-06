//
//  ViewController.swift
//  tokei
//
//  Created by 久保　直哉 on 2020/08/28.
//  Copyright © 2020 久保　直哉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate,customdelegate{
    func customdeletecell(index: Int) {
            todolist.remove(at: index)
            tableView.reloadData()
    }
    
 //セルの個数を指定するメソッド
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return todolist.count
     }

 //セルの値を指定するメソッド
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //Storyboardで指定したtodoCell識別子を利用して再利用可能なセルを取得する
         let cell = tableView.dequeueReusableCell(withIdentifier: "customCell",for: indexPath) as! customCell
         //行番号に合ったToDoのタイトルを取得
         let todoTitle = todolist[indexPath.row]
     //セルのラベルにToDoのタイトルをセット
         cell.textLabel?.text=todoTitle
    cell.tag=indexPath.row
    cell.delegate=self
         return cell
     }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    

    //スワイプで消す
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //削除処理かどうか
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //ToDoリストから削除
            todolist.remove(at: indexPath.row)
            //セルを削除
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    


    @IBOutlet weak var tableView: UITableView!
    
    var todolist=[String]()
    
    @IBOutlet weak var time: UILabel!
    @IBAction func restart(_ segue: UIStoryboardSegue) {
      //処理
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        date()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (date), userInfo: nil, repeats: true)
        
        
    }

    @IBAction func button(_ sender: Any) {
        
    }



    @IBAction func kiroku(_ sender: Any) {
        if case time.text = time.text{
            todolist .append(time.text!)
            tableView.reloadData()
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        todolist.removeAll()
        tableView.reloadData()
    }
    
    
    @objc func date(){
        /// DateFomatterクラスのインスタンス生成
        let dateFormatter = DateFormatter()
        /// カレンダー、ロケール、タイムゾーンの設定（未指定時は端末の設定が採用される）
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.timeZone = TimeZone(identifier:  "Asia/Tokyo")
        /// 変換フォーマット定義（未設定の場合は自動フォーマットが採用される）
        dateFormatter.dateFormat = "yyyy年M月d日(EEEE) H時m分s秒"
        /// データ変換（Date→テキスト）
        let dateString = dateFormatter.string(from: Date())
        time.text=dateString
    }
    
    
}

