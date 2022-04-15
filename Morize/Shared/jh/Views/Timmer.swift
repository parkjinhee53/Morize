//
//  Timer.swift
//  Morize
//
//  Created by Jinhee on 2022/01/13.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Timmer: View {
    
    @State var counter: Int = 0
    var countTo: Int = 10
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(Color.green, lineWidth: 25)
                )
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from: 0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 25,
                                    lineCap: .round,
                                    lineJoin: .round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color.orange : Color.red)
                            ).animation(
                                Animation.easeInOut(duration: 0.2)
                            )
                    )
                Clock(counter: counter, countTo: countTo)
            }
        } // end vstack
        .onReceive(timer) { time in
            if(self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
    func completed() -> Bool {
        return progress() == 1
    }

    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 30))
                .fontWeight(.black)
        }
    }
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct Timmer_Previews: PreviewProvider {
    static var previews: some View {
        Timmer()
    }
}
