import SwiftUI

struct ExportView: View {
    @State private var isExporting = false
    @State private var ipaFile: URL?
    
    var body: some View {
        Button {
            Task { await self.export() }
        } label: {
            Label("Export IPA", systemImage: "square.and.arrow.up")
                .imageScale(.large)
        }
        .buttonStyle(.borderedProminent)
        .hoverEffect()
        .fileMover(
            isPresented: self.$isExporting,
            file: self.ipaFile
        ) { result in
            print("Exported IPA:", result)
        }
    }
    
    private func export() async {
        do {
            let url = try await exportIPA()
            self.ipaFile = url
            self.isExporting = true
        } catch {
            print("Could not export .ipa:", error)
        }
    }
}

struct ExportView_Previews : PreviewProvider {
    static var previews: some View {
        ExportView()
    }
}
