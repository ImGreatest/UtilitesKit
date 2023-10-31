
import SwiftUI
import AppKit

// Description a main screen application
struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var schemeImage: String = "moon"
    @State private var isHovering: Bool = false
    
    private var uitool = UITools()
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                
                // Links to anothers views
                GeometryReader { geometry in
                    Button(action: {}) {
                        NavigationLink("Review", destination: ReviewView())
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
                }
            } detail: {
                ScrollView([.vertical, .horizontal]) {
                    ForEach(0..<100) {
                        Text("\($0)")
                    }
                }
                .defaultScrollAnchor(.top)
            }
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {}) {
                        NavigationLink(destination: SettingsView()) {
                            Label("Settings", systemImage: "gear")
                        }
                        .frame(width: 30, height: 30)
                        .background(Color.clear)
                        .padding()
                    }
                    .help("Settings")
                    Button(action: {}) {
                        Label("Change scheme", systemImage: "\(schemeImage)")
                    }
                    .help("Change scheme")
                }
            }
            .preferredColorScheme(colorScheme)
            .navigationTitle("Utilites Kit")
            .onAppear {
                if let window = NSApplication.shared.windows.first {
                    window.setContentSize(NSSize(width: 800, height: 600))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

