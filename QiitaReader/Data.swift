//
//  Data.swift
//  QiitaReader
//
//  Created by 佐山絢 on 2018/05/11.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Data{
    var articles: [[String: String?]] = []
    
    func getArticles(){
        Alamofire.request("https://qiita.com/api/v2/items").responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            
            let json = JSON(object)
            json.forEach{(_, data) in
                //print(data["title"])
                //print(data["user"]["id"])
                let article: [String: String?] = [
                    "userId": data["user"]["id"].string,
                    "title": data["title"].string
                ]
                self.articles.append(article)
            }
        }
    }
}
