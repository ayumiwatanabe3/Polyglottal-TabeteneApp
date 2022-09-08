//
//  ContentView.swift
//  TabeteneApp
//
//  Created by 渡辺あゆみ on 2022/09/08.
//

import SwiftUI

struct ContentView: View {
    @State var foods : [Food]
    @State var showingPopUp = false
    
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
                        showingPopUp = true
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
                FoodList(foods: foods)
                Spacer()
                Button("更新") {
                }
                .padding()
            }
            .padding()
            
            if showingPopUp {
                PopupView(foods: $foods, isPresent: $showingPopUp)
            }
        }
    }
}

struct PopupView: View {
    @Binding var foods : [Food]
    @Binding var isPresent : Bool
    @State var foodName : String = ""
    @State var cooking_by : String = ""
    @State var amount : String = ""

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
            }.onChange(of: amount, perform: { newValue in
                print("料理名：\(foodName)、誰が：\(cooking_by)、量：\(amount)")
                PostRequest()
//                foods = Foods().foods
            })
            .padding()
        }
        .frame(width: 300, height: 400, alignment: .center)
        .background(Color.white)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(foods: Foods().foods)
    }
}
