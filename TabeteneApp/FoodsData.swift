//
//  FoodsData.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

//struct Food:Identifiable {
//    var id = UUID()
//    var state_delete: Bool = false
//    var name: String = ""
//    var amount: String = ""
//    var cooking_date:String = ""
//    var cooking_by:String = ""
//}
struct Response:Codable{
    var list:[Food]
}

struct Food:Codable,Identifiable {
    var id :Int
    var state_delete: Bool
    var name: String
    var amount: String
    var cooking_date:String
    var cooking_by:String
}




class Foods: ObservableObject {
    @Published var foods: [Food] = [
//        Food(id:1,state_delete: false, name: "カレー", amount: "1",cooking_date: "2022-08-25",cooking_by: "haha"),
//        Food(id:2,state_delete: false, name: "サラダ", amount: "2",cooking_date: "2022-08-26",cooking_by: "daddy"),
//        Food(id:3,state_delete: false, name: "卵焼き", amount: "3",cooking_date: "2022-08-27",cooking_by: "ayumi")
    ]
    
    init() {
        callAPI()
    }
    
    func callAPI(){
        
        guard let url = URL(string: "https://soloproject2nd.herokuapp.com/api/list") else {
               print("GET API URL エラー!!")
            return
        }
        
        URLSession.shared.dataTask(with: url){
              data, response, error in
                    
            let decoder = JSONDecoder()

            if let data = data{
                do{
                    let tasks = try decoder.decode(Response.self, from: data)
//                    tasks.list.forEach{ i in
//                        print(i.name)
//                    }
                    print(tasks.list)
                    DispatchQueue.main.async {
//                        self.foods = tasks.list
                        for food in tasks.list{
                            self.foods.append(food)
                            print(self.foods)
                        }
                           }
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}
