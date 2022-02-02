//
//  CSVDataView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

// CSV 파일로 가져오기 / 내보내기
struct CSVDataView: View {
    var body: some View {
        List{
            Section(header: Text("CSV 백업 및 복원")){
                Button(action: {
                    
                }){
                    Text("CSV 파일로 단어 가져오기")
                }
                Button(action: {
                    
                }){
                    Text("CSV파일로 단어 내보내기")
                }
            }
            Section(header: Text("도움말")){
                Button(action: {
                    
                }){
                    Text("가져오는 방법")
                }
                Button(action: {
                    
                }){
                    Text("내보내는 방법")
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct CSVDataView_Previews: PreviewProvider {
    static var previews: some View {
        CSVDataView()
    }
}
