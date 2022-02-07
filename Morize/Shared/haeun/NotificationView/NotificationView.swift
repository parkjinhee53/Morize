//
//  NotificationView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/07.
//

import SwiftUI

struct NotificationView: View {
    func setNotification(){
        let manager = NotificationManager()
        manager.requestPermission()
        manager.addNotification(title: "Morize")
        manager.schedule()
//        manager.scheduleNotifications()
    }
    
    var body: some View {
        VStack {
            Text("알림창")
            Button(action: { self.setNotification() }) {
                Text("알림을 보내주세요")
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
