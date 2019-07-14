//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小川諒 on 2019/07/02.
//  Copyright © 2019 小川諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているyに値を代入して渡す
        // 画像の名前の配列(これってここでもう一回宣言しなきゃいけないの？？)
        let imageNameArray = [
            "gu",
            "choki",
            "pa",
            ]
        // 表示している画像の番号から名前を取り出し
        resultViewController.x = imageNameArray[dispImageNo]
        

    }
    
    //imageViewに対し何か行いたい時に設定
    @IBOutlet weak var imageView: UIImageView!
    //戻るボタン(遷移先)を有効化
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    //遷移元「次へ」ボタンに何か行いたい時に設定
    @IBOutlet weak var nextButtom: UIButton!
    //「次へ」ボタンを押された時の動きを定義
    @IBAction func Next(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    //遷移元「戻る」ボタンに何か行いたい時に設定
    @IBOutlet weak var prevButton: UIButton!
    //「戻る」ボタンを押された時の動きを定義
    @IBAction func Prev(_ sender: Any) {
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    ///一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "gu",
            "choki",
            "pa",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "gu") //イメージ読み込み
        imageView.image = image
        
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playButtonClicked(_ sender: UIButton) {
        //タイマーがnilかつ「再生」なら、Timerをつくる。
        //タイマーがnilでない、かつ「停止」なら、Timerをinvalidateとをよびだして、nilをいれる
        if timer == nil && self.playButton.currentTitle == "再生"{
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            self.playButton.setTitle("停止", for: .normal)
            nextButtom.isEnabled = false
            prevButton.isEnabled = false
        } else if timer != nil && self.playButton.currentTitle == "停止" {
            self.timer?.invalidate()
            timer = nil
             self.playButton.setTitle("再生", for: .normal)
            nextButtom.isEnabled = true
            prevButton.isEnabled = true
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

