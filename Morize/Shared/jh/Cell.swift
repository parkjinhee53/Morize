//
//  Cell.swift
//  Morize
//
//  Created by Jinhee on 2022/01/10.
//

import SwiftUI

struct Cell: View {
    var item: ToDoItem?
    init(_ item: ToDoItem) {
        self.item = item
    }
    var body: some View {
        HStack {
            Image(systemName: item!.imageName)
            Spacer()
            Text("\(item!.task)")
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell()
    }
}
