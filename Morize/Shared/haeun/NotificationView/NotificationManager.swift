//
//  NotificationManager.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/07.
//

import Foundation
import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class NotificationManager {
    var notifications = [Notification]()
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // We have permission!
                }
        }
    }
    
    func addNotification(title: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }
    
    func schedule() -> Void {
        UNUserNotificationCenter.current().getNotificationSettings {
            settings in
            switch settings.authorizationStatus{
            case .notDetermined:
                self.requestPermission()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
    func scheduleNotifications() -> Void {
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = UNNotificationSound.default
            content.subtitle = "Morize와 단어를 외울 시간입니다."
            
            // 알림을 push할 시간 설정 -> 사용자가 설정하게 만들기
//            var date = DateComponents()
//            date.hour = 8
//            date.minute = 30
            
            // 알림 트리거 (지정도니 날짜 및 시간에 알림)
//            let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            // 일단 누르면 알림이 가게끔 만듦.
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (30*60), repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }
}
