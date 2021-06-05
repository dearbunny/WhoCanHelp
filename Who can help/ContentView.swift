//
//  ContentView.swift
//  Who can help
//
//  Created by ROSE on 2021/6/5.
//

import SwiftUI

struct list {
    var img:String
    var name:String
    var description:String
}

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 248/255, green: 181/255, blue: 81/255, alpha: 0.3)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(red: 225/255, green: 140/255, blue: 39/255, alpha: 1)], for: .normal)
    }
    
    let capoo:[list] = [
        list(img: "cat-1", name: "棒棒", description: "是不是棒呆了"),
        list(img: "cat-2", name: "厭世", description: "覺得厭世！"),
        list(img: "cat-3", name: "我來了", description: "可愛的我來了！"),
        list(img: "cat-4", name: "小心", description: "給你我的小心心"),
        list(img: "cat-5", name: "吃自己", description: "準備吃自己")
    ]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack{
            Button(action:{
                let randIndex = 0 ..< self.capoo.count
                self.selectedIndex = randIndex.randomElement()!
            }){
                Text("🎲")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 50)
            }
            Picker(selection: $selectedIndex, label: Text("capooselect")) {
                ForEach(0..<capoo.count) { (index) in
                    Text(self.capoo[index].name).tag(index)
                    
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color(red: 247/255, green: 247/255, blue: 239/255))
            .cornerRadius(8)
            .shadow(radius: 30)
            .padding()
            Text("\(capoo[selectedIndex].description)")
            .foregroundColor(Color(red: 225/255, green: 140/255, blue: 39/255))
            .font(.system(size: 20))
            Image("\(capoo[selectedIndex].img)")
                .offset(x:-50, y:50)
                .shadow(radius: 15)
            
        }.offset(y:130)
            .background(
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .frame(width:428)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
