//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 小川諒 on 2019/07/02.
//  Copyright © 2019 小川諒. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 画像を読み込み
        let image = UIImage(named: x)
        
        // Image Viewに読み込んだ画像をセット
        ResultImageView.image = image
        
    }
    @IBOutlet weak var ResultImageView: UIImageView!
    
    var x = ""

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
