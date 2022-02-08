//
//  iCloudDataView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

struct iCloudDataView: View {
    var body: some View {
        // 다른 앱에서 가져온 정보라서 수정해야 됨.
        VStack{
            Text("동기화 기능을 사용합니다.")
            Text("다른 iOS기기들과 실시간으로 동기화 되며, 동기화가 완료된 데이터는 앱을 삭제해도 자동으로 복원됩니다.")
            Text("그러나 기기 환경 및 네트워크 환경에 다라 동기화가 되지 않거나 지연될 수 있습니다.")
            Text("동기화가 완료되지 않은 상태에서 앱을 삭제하면 기존 데이터가 손실될 수 있습니다.")
            Text("이 경우를 대비해 수시로 CSV를 통해 수동 백업을 권장합니다.")
        }
        // icloud파일 동기화 토글로 기능만들기
    }
}

struct iCloudDataView_Previews: PreviewProvider {
    static var previews: some View {
        iCloudDataView()
    }
}
