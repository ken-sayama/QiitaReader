//
//  ArticleViewController.swift
//  QiitaReader
//
//  Created by 佐山絢 on 2018/05/11.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationItem.title = "Show Article"
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }

}
