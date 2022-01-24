//
//  AccountManagement.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

// 계정관리

struct AccountManagement: View {
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? "사용자"
    
    var body: some View {
        VStack{
            VStack{
                profileImage()
                Text(UserName)
                    .bold()
                    .font(.title)
            }
        }
        
    }
}

// 프로필 이미지
struct profileImage: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.green)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            Image("porfile")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct AccountManagement_Previews: PreviewProvider {
    static var previews: some View {
        AccountManagement()
    }
}
