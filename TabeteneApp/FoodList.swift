//
//  FoodList.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

struct FoodList: View {
    let foods:[Food]
    @Binding var showingDeleteButton : Bool
    @Binding var deleteId : Int
    
    var body: some View {
        List{
            ForEach(foods){food in
                FoodRow(food: food)
                    .onLongPressGesture{
                        print("id:\(food.id)")
                        deleteId = food.id
                        showingDeleteButton.toggle()
                    }
            }
        }
    }
}
