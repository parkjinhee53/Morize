//
//  MiniGame2BVM.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/17.
//

import Foundation
//import SwiftUI
//import Combine

//class MiniGame2BVM: ObservableObject{
//    @Published var name = "haeun"
//
//}

struct MiniGame2BVM{
    var Korean : String
    var English : String
    var fileName : String
    init(Korean:String, English:String, fileName:String){
        self.Korean = Korean
        self.English = English
        self.fileName = fileName
    }
    init(){
        self.Korean = ""
        self.English = ""
        self.fileName = ""
    }
}

// Firebase 단어 사용 
var vocabularyDataSet:[MiniGame2BVM]=[
    MiniGame2BVM(Korean: "사과", English: "apple", fileName: "apple"),
    MiniGame2BVM(Korean: "좋아하다", English: "like", fileName: "like"),
    MiniGame2BVM(Korean: "싫어하다", English: "hate", fileName: "hate"),
    MiniGame2BVM(Korean: "책", English: "book", fileName: "book"),
    MiniGame2BVM(Korean: "자다", English: "sleep", fileName: "sleep")
]
