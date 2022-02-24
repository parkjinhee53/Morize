import SwiftUI

//보여주고싶은 뷰 하나를 생성한다
struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}
 
struct testView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.black)
        .cornerRadius(30)
        .font(.system(size: 30))
        
        .sheet(isPresented: $showingSheet) {
         //sheet에 표시될 뷰를 할당
            SecondView()
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
