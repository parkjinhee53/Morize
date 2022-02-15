//
//  NotificationView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/02/07.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationmode
    
    func setNotification(){
        let manager = NotificationManager()
        manager.requestPermission()
        manager.addNotification(title: "Morize")
        manager.schedule()
        //        manager.scheduleNotifications()
    }
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Button {
                    print("asdf")
                    self.presentationmode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                }
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 0))
                Spacer()
                VStack {
                    Text("알림창")
                    Button(action: { self.setNotification() }) {
                        Text("알림을 보내주세요")
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
