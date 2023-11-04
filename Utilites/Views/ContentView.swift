
import SwiftUI
import AppKit
import TipKit
import HotKey

// Description a main screen application
struct ContentView: View {
    
    func helloWorld() -> Void {
        print("hello world")
    }
    
    let hotKeyController = HotKeyController(baseHotkey: "m", modificatorHotkey: [.command])
    let hotkey = HotKey(key: .a, modifiers: [.command])
    
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var schemeImage: String = "moon"
    @State private var isHovering: Bool = false
    
    private var uitool = UITools()
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                
                // Links to anothers views
                GeometryReader { geometry in
                    Button(action: {print("pressed")}) {
                        NavigationLink("Review", destination: ReviewView())
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
                    .onAppear {
                        hotkey.keyDownHandler = {
                            print("second")
                        }
                    }
                }
            } detail: {
                GeometryReader { geometry in
                    ScrollView([.vertical, .horizontal], showsIndicators: true) {
                        ZStack {
                            ContainerRelativeShape()
                                .fill(Color.gray)
                                .cornerRadius(10.0)
                                .id("ContainerIntroduce")
                            Text("Introduce")
                                .padding(.leading)
                                .font(.title3)
                                .id("ContainerIntroduceLabel")
                            Text("Text")
                                .font(.subheadline)
                                .id("ContainerIntroduceDescription")
                        }
                        .frame(width: geometry.size.width - 75, height: geometry.size.height / 5, alignment: .top)
                        .offset(y: -geometry.size.height / 3)
                        .help("Introduce")
                        ZStack {
                            ContainerRelativeShape()
                                .fill(Color.gray)
                                .cornerRadius(10.0)
                                .id("ContainerLinks")
                            Text("Links")
                                .padding(.leading)
                                .font(.subheadline)
                                .id("ContainerLinksLabel")
                            Text("GitHub")
                                .font(.subheadline)
                                .padding(.trailing)
                                .id("ContainerLinksGitHub")
                        }
                    }
                    .fixedSize(horizontal: false, vertical: false)
                    .tag("ScrollIntroduce")
                }
            }
        }
        .toolbar {
            ToolbarItemGroup {
                Button(action: {}) {
                    NavigationLink(destination: SettingsView()) {
                        Label("Settings", systemImage: "gear")
                            .background(Color.clear)
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

#Preview {
    ContentView()
}
