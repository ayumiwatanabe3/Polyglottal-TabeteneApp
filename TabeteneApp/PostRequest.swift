//
//  PostRequest.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import Foundation

struct Insert:Codable {
    var name: String
    var amount: String
    var cooking_date:String
    var cooking_by:String
}

func PostRequest(name : String, amount : String, cooking_date : String, cooking_by : String)  {
    
    let insertData = Insert(name: name, amount: amount ,cooking_date: cooking_date, cooking_by: cooking_by)
    
    guard let url = URL(string: "https://soloproject2nd.herokuapp.com/api/foods") else {
           print("POST URL error")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    
    do {
      request.httpBody = try JSONEncoder().encode(insertData)
    } catch {
      print("不正なデータです")
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if error != nil {
        print("POST error")
        return
      }
      print("POST成功")
    }
    task.resume()
}
