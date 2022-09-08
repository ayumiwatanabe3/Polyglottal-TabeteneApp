//
//  FoodList.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

struct FoodList: View {
    let foods:[Food]
    
    var body: some View {
        List{
            ForEach(foods){food in
                FoodRow(food: food)
            }
        }
    }
}

struct FoodList_Previews: PreviewProvider {
    static var previews: some View {
        FoodList(foods: Foods().foods)
    }
}
