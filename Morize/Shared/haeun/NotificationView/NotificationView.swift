//
//  NotificationView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/07.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack{
            Text("알림설정")
            SwiftUI.List{
                Section(header: Text("알림 설정")){
                    GroupedRow()
                }
            }.listStyle(.grouped)
                
        }
            //            Button(action: { self.setNotification() }) {
//                Text("알림을 보내주세요")
//            }
    }
}

struct GroupedRow: View {
    func setNotification(){
        let manager = NotificationManager()
        manager.requestPermission()
        manager.addNotification(title: "Morize")
        manager.schedule()
        //        manager.scheduleNotifications()
    }
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        Toggle(isOn: $toggleIsOn, label: {
            Text("알림 활성화")
        }).onChange(of: toggleIsOn){ value in
                self.setNotification()
                print(value)
            }
    }
}
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
