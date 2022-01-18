//
//  SwiftUIView.swift
//  Morize
//
//  Created by Jinhee on 2022/01/10.
//

import SwiftUI

struct ToDoItem : Identifiable {
    var id = UUID()
    var task : String
    var imageName : String
    
}
struct SwiftUIView: View {
    
    var listData : [ToDoItem] = []
    init()
    {
        for index in 1...15 {
            listData.append(ToDoItem(task: "task\(index)", imageName: "command"))
        }
    }

    var body: some View {
        VStack{
            List(listData) {
                item in Cell(item)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
