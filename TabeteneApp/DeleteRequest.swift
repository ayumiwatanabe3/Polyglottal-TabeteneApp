//
//  DeleteRequest.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/09.
//

import Foundation

func deleteRequest (deleteList: [Int]){
    
    guard let url = URL(string: "https://soloproject2nd.herokuapp.com/api/foods") else {
           print("POST API URL エラー!!")
        return
    }
    
    
    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
    request.addValue("application/json", forHTTPHeaderField: "content-type")
    
    do {
      request.httpBody = try JSONEncoder().encode(deleteList)
    } catch {
      print("不正なデータです")
    }
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if error != nil {
        print("エラー")
        return
      }
      print("DELETE成功")
    }
    task.resume()
}
