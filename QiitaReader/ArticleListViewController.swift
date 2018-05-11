//
//  ArticleListViewController.swift
//  QiitaReader
//
//  Created by 佐山絢 on 2018/05/11.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var articles: [[String: String?]] = []
    let table = UITableView()
    var selectURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "記事一覧"
        
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        
        getArticles()
    }
    
    func getArticles() {
        Alamofire.request("https://qiita.com/api/v2/items")
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                let json = JSON(object)
                json.forEach { (_, json) in
                    let article: [String: String?] = [
                        "title": json["title"].string,
                        "url": json["url"].string
                    ]
                    self.articles.append(article)
                }
                self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article["title"]!
        cell.detailTextLabel?.text = article["url"]!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択解除
        //tableView.deselectRow(at: indexPath, animated: true)
        let test = articles[indexPath.section]
        print("\(test)")
        
        //ここに遷移処理を書く
        //self.present(SecondViewController(), animated: true, completion: nil)
    }

}
