//
//  FoodRow.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

struct FoodRow: View {
    let food:Food
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                            Text(food.name)
                                .fontWeight(.bold)

                            Text(food.cooking_date)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                            Text("\(food.amount)人分")
                                .fontWeight(.bold)

                            Text(food.cooking_by)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
            
        }
    }
}

struct FoodRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodRow(food: Foods().foods[0])
    }
}
