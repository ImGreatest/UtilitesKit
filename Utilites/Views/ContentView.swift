
import SwiftUI
import AppKit
import TipKit
import HotKey

// Description a main screen application
struct ContentView: View {
    private var jsonSettings = JsonReader()
    private let jsonScheme = JsonReader().getColorScheme()
    let hotKeyController = HotKeyController(baseHotkey: "m", modificatorHotkey: [.command])
    let hotkey = HotKey(key: .a, modifiers: [.command])
    
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isHovering: Bool = false
    @State private var isDarkScheme: Bool = UITools().changeShameImage(nameScheme: JsonReader().getColorScheme())
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                
                // Links to anothers views
                GeometryReader { geometry in
                    
                    // Button to link on Color Picker page
                    Button(action: {}) {
                        NavigationLink("Color Picker", destination: ColorPickerView())
                            .font(.custom("Monaco", size: 14))
                            .fontDesign(.rounded)
                    }
                    .onAppear {
                        // Hotkey
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
                    .offset(y: 50)
                    .background { GeometryReader { geometrySize in
                        Color.clear
                            .onAppear {
                        
                            }
                    }
                    }
                    .id("ColorPickerLink")
                    
                    // Button to link on Review page
                    Button(action: {print("pressed")}) {
                        NavigationLink( "Review Page", destination: ReviewView())
                            .background {
                                Color.clear
                            }
                            .font(.custom("Monaco", size: 14))
                            .fontDesign(.rounded)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .onAppear {
                        hotkey.keyDownHandler = {
                            print("second")
                        }
                    }
                    .id("ReviewPage")
                    
                }
            } detail: {
                GeometryReader { geometry in
                    ScrollView([.vertical, .horizontal], showsIndicators: true) {
                        ZStack(alignment: .leading) {
                            GeometryReader { geometryContainer in
                                ContainerRelativeShape()
                                    .fill(Color.gray)
                                    .cornerRadius(10.0)
                                    .id("ContainerIntroduce")
                                Text("Introduce")
                                    .padding(.leading)
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                                    .offset(x: -5, y: 2)
                                    .id("ContainerIntroduceLabel")
                                Text("Text")
                                    .font(.subheadline)
                                    .offset(x: 5, y: 30)
                                    .id("ContainerIntroduceDescription")
                            }
                        }
                        .frame(width: geometry.size.width - 75, height: geometry.size.height / 5, alignment: .top)
                        .offset(y: -geometry.size.height / 4)
                        .padding(.bottom, geometry.size.height / 8)
                        .help("Introduce")
                        ZStack {
                            GeometryReader { geometryContainer in
                                ContainerRelativeShape()
                                    .fill(Color.gray)
                                    .cornerRadius(10.0)
                                    .id("ContainerLinks")
                                Text("Links")
                                    .padding(.leading)
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                                    .offset(x: -5, y: 2)
                                    .id("ContainerLinksLabel")
                                HStack {
                                    
                                    //  Link to GitHub
                                    Link(destination: URL(string: "https://github.com/ImGreatest/UtilitesKit")!, label: {
                                        Text("GitHub")
                                            .font(.system(size: 14, weight: .medium, design: .rounded))
                                            .foregroundStyle(Color(.white))
                                            .padding(.trailing)
                                            .id("ContainerLinksGitHub")
                                    })
                                    .offset(x: -25)
                                    
                                    // Link to documentation
                                    Link(destination: URL(string: "https://github.com")!, label: {
                                        Text("Documentation")
                                            .font(.system(size: geometryContainer.size.height > 1000 ? 14 : 26, weight: .medium, design: .rounded))
                                            .foregroundStyle(Color(.white))
                                            .padding(.trailing)
                                            .id("ContainerLinksDocumentation")
                                            .onAppear {
                                                print(geometryContainer.size.height)
                                            }
                                    })
                                    .offset(x: 25)
                                }
                                .padding(.top, -15)
                                .offset(x: geometryContainer.size.width / 2.5, y: 30)
                            }
                        }
                        .frame(width: geometry.size.width - 75, height: geometry.size.height / 10, alignment: .top)
                        .offset(y: -geometry.size.height / 5)
                        .help("Links")
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
                Button(action: {isDarkScheme.toggle()}) {
                    Label("Change scheme", systemImage: isDarkScheme ? "sun.max" : "moon")
                        .foregroundStyle(isDarkScheme ? .white : .black)
                }
                .help("Change scheme")
            }
        }
        .environment(\.colorScheme, isDarkScheme ? .dark : .light)
        .preferredColorScheme(.dark)
        .navigationTitle("\(jsonSettings.getCaption())")
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
