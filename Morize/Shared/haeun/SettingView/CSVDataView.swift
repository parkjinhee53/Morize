//
//  CSVDataView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI
import UniformTypeIdentifiers

// CSV 파일로 가져오기 / 내보내기
struct CSVDataView: View {
    @State private var document: TextFile = TextFile(message: "Hello, World!")
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false
    var body: some View {
        VStack {
            //            GroupBox(label: Text("Message:")) {
            //                TextEditor(text: $document.message)
            //            }
            Text("CSV 백업 및 복원")
                .padding(10)
            HStack {
                Spacer()
                Button(action: { isImporting = true }, label: {
                    Text("CSV 파일로\n 단어 가져오기")
                }).fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.plainText],
                    allowsMultipleSelection: false
                ) { result in
                    do {
                        guard let selectedFile: URL = try result.get().first else { return }
                        guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                        
                        document.message = message
                    } catch {
                        // Handle failure.
                    }
                }
<<<<<<< HEAD
                
                Spacer()
                
                Button(action: { isExporting = true }, label: {
                    Text("CSV파일로\n 단어 내보내기")
                }).fileExporter(
                    isPresented: $isExporting,
                    document: document,
                    contentType: .plainText,
                    defaultFilename: "Message"
                ) { result in
                    if case .success = result {
                        // Handle success.
                    } else {
                        // Handle failure.
                    }
                }
                
                Spacer()
            }
            
//            List{
//                Text("도움말")
//                Section(header: Text("가져오는 방법")){
//                    Text("dddddd")
//                }
//                Section(header: Text("내보내는 방법")){
//                    Text("dddddd")
//                }
//            }.listStyle(SidebarListStyle())
=======
//                List{
//                    Text("도움말")
//                    Section(header: Text("가져오는 방법")){
//                        Text("dddddd")
//                    }
//                    Section(header: Text("내보내는 방법")){
//                        Text("dddddd")
//                    }
//                }.listStyle(SidebarListStyle())
>>>>>>> main
        }
    }
}

struct TextFile: FileDocument {
    // 시스템에 일반 텍스트만 지원함.
    static var readableContentTypes = [UTType.plainText]
    
    // 기본적으로 문서는 비어있음.
    var message: String
    
    // 초기화 과정 비어있는 새 문서를 생성.
    init(message: String) {
        self.message = message
    }
    
    // 이전에 저장된 데이터를 가져옴.
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let stringg = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = stringg
    }
    
    // 데이터를 사용할 때 호출 됨.
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

struct CSVDataView_Previews: PreviewProvider {
    static var previews: some View {
        CSVDataView()
    }
}
