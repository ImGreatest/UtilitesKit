

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("SettingsView")
            .onAppear {
                print(getOpenWindows())
            }
    }
}

#Preview {
    SettingsView()
}
