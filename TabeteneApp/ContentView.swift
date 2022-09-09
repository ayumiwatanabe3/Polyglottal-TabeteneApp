//
//  ContentView.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var foodsclass: Foods

    @State var showingPopUp = false
    @State var reload :Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("食べてね😋")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .frame(width: 180.0, height: 80.0)
                    Spacer()
                    Button(action: {
                        print("Button")
                        if showingPopUp {
                            showingPopUp = false
                        }else{
                            showingPopUp = true}
                    }) {
                        Text("＋")
                            .bold()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                FoodList(foods: foodsclass.foods)
                Spacer()
                Button("更新") {
                    print("更新ボタンを押したよ")
                    reload = reload+1
                    print(reload)
                    print(foodsclass.foods)
                    showingPopUp = false
                    foodsclass.callAPI()
                }
                .padding()
            }
            .padding()
            
            if showingPopUp {
                PopupView(isPresent: $showingPopUp,reload:$reload)
            }
        }
    }
}

struct PopupView: View {
    @EnvironmentObject var foodsclass: Foods

    @Binding var isPresent : Bool
    @Binding var reload : Int
    @State var foodName : String = ""
    @State var cooking_by : String = ""
    @State var amount : String = ""
    @State var cooking_date : String = ""

    var body: some View {
        VStack(alignment: .center){
            TextField("どんな料理？", text: $foodName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)
            TextField("だれが作った？", text: $cooking_by)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 250)
            HStack {
                Text("なん人分？:").foregroundColor(Color.gray)
                Picker("なん人分？:",selection: $amount, content: {
                    Text("選択してください").tag("選択してください")
                    Text("1人分").tag("1")
                    Text("2人分").tag("2")
                    Text("3人分").tag("3")
                    Text("4人分").tag("4")
                })
                    .pickerStyle(.menu)
            }
            Button("登録"){
                isPresent = false
                reload = reload+1
                print(reload)
                foodsclass.callAPI()

//                cooking_date = Date()
            }.onChange(of: amount, perform: { newValue in
                print("料理名：\(foodName)、誰が：\(cooking_by)、量：\(amount)")
                PostRequest( name: foodName, amount: amount, cooking_date: cooking_date, cooking_by:cooking_by)
//                InsertFoodsArray(name: foodName, amount: amount, cooking_date: cooking_date, cooking_by: cooking_by)
            })
            .padding()
        }
        .frame(width: 300, height: 400, alignment: .center)
        .background(Color.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
