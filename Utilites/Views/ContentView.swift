
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
    @State private var tag: Int8? = 1
    
    @State private var isHovering: Bool = false
    @State private var isHoveringMenu: Bool = false
    @State private var isHoveringSecondMenu: Bool = false
    @State private var isHoveringThirdMenu: Bool = false
    @State private var isHoveringFourMenu: Bool = false
    @State private var isHoveringFiveMenu: Bool = false
    
    @State private var isDarkScheme: Bool = UITools().changeShameImage(nameScheme: JsonReader().getColorScheme())
    
    var body: some View {
        NavigationStack {
            NavigationSplitView {
                
                // Links to anothers views
                GeometryReader { geometry in
                    
                    // Button to link on Color Picker page
                    Button {
                        tag = 2
                    } label: {
                        NavigationLink(destination: ColorPickerView(), tag: 2, selection: $tag) {
                            HStack {
                                Text("Color picker")
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                    .onAppear {
                        // Hotkey
                    }
                    .onHover { _ in
                        // onHover action
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
                    // Cancel this able
                    Button {
                        tag = 1
                    } label: {
                        NavigationLink(destination: ContentView(), tag: 1, selection: $tag) {
                            HStack {
                                Text("Review page")
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .onAppear {
                        hotkey.keyDownHandler = {
                            print("second")
                        }
                    }
                    .onHover { _ in
                        isHovering.toggle()
                    }
                    .id("ReviewPage")
                    
                    // Button to link on Settings view
                    Button {
                        tag = 3
                    } label: {
                        NavigationLink(destination: SettingsView(), tag: 3, selection: $tag) {
                            HStack {
                                Text("Settings page")
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                    .onAppear {
                        // hotkey
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .offset(y: 90)
                    
                    // Button to link on Color Picker view
                    Button {
                        tag = 4
                    } label: {
                        NavigationLink(destination: ImageSizeChangerView(), tag: 4, selection: $tag) {
                            HStack {
                                Text("Image Changer")
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                    .onAppear {
                        // hotkey
                    }
                    .onHover { _ in
                        //
                    }
                    .id("Image Changer")
                    .frame(width: geometry.size.width)
                    .offset(y: 150)
                    
                    // Button to link on Text Cleaner Style view
                    Button {
                        tag = 5
                    } label: {
                        NavigationLink(destination: TextStyleCleanerView(), tag: 5, selection: $tag) {
                            HStack {
                                Text("Text Cleaner")
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                            }
                        }
                    }
                    .onAppear {
                        // hotkey
                    }
                    .onHover { _ in
                        //
                    }
                    .id("Text Cleaner")
                    .frame(width: geometry.size.width)
                    .offset(y: 195)
                    .onHover { _ in
                        
                    }
                }
            } detail: {
                GeometryReader { geometry in
                    ScrollView([.vertical, .horizontal], showsIndicators: true) {
                        ZStack(alignment: .leading) {
                            GeometryReader { geometryContainer in
                                ContainerRelativeShape()
                                    .fill(Color.gray)
                                    .cornerRadius(10.0)
                                Text("Entry")
                                    .padding(.leading)
                                    .font(.custom("Monaco", size: 14))
                                    .fontDesign(.rounded)
                                    .offset(x: -5, y: 2)
                                    .padding(.horizontal, 5)
                                Text("Utilites Kit is a set of small programs that can speed up work on macOS.")
                                    .padding(.horizontal, 5)
                                    .font(.system(size: 14, weight: .light, design: .rounded))
                                    .offset(x: 5, y: 30)
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
                                    .font(.system(size: geometry.size.height < 600 ? 18 : 32, weight: .medium, design: .rounded))
                                    .offset(x: -5, y: 2)
                                    .id("ContainerLinksLabel")
                                HStack {
                                    
                                    //  Link to GitHub
                                    Link(destination: URL(string: "https://github.com/ImGreatest/UtilitesKit")!, label: {
                                        Text("GitHub")
                                            .font(.system(size: geometry.size.height < 600 ? 12 : 26, weight: .medium, design: .rounded))
                                            .foregroundStyle(Color(.white))
                                            .padding(.trailing)
                                            .id("ContainerLinksGitHub")
                                    })
                                    .offset(x: -25)
                                    
                                    // Link to documentation
                                    Link(destination: URL(string: "https://github.com")!, label: {
                                        Text("Documentation")
                                            .font(.system(size: geometry.size.height < 600 ? 12 : 26, weight: .medium, design: .rounded))
                                            .foregroundStyle(Color(.white))
                                            .padding(.trailing)
                                            .id("ContainerLinksDocumentation")
                                            .onAppear {
                                                
                                            }
                                    })
                                    .offset(x: geometry.size.height < 600 ? 25 : 75)
                                }
                                .padding(.top, -15)
                                .offset(x: geometryContainer.size.width / 2.5, y: geometry.size.height < 600 ? geometryContainer.size.height / 2 : geometryContainer.size.height / 2)
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
                Button {
                    tag = 8
                } label: {
                    NavigationLink(destination: ContentView(), tag: 8, selection: $tag) {
                        HStack {
                            Label("", systemImage: "house.circle")
                                .foregroundStyle(.gray)
                        }
                        .frame(width: 25, height: 25)
                        .background(Color.clear)
                    }
                    .frame(width: 30, height: 30)
                }
                .help("Settings")
                .id("SettingsButton")
                Button(action: {isDarkScheme.toggle()}) {
                    Label("Change scheme", systemImage: isDarkScheme ? "sun.max" : "moon.circle")
                        .foregroundStyle(isDarkScheme ? .white : .gray)
                    
                }
                .help("Change scheme")
                .id("ChangeSchemeButton")
            }
        }
        .toolbarColorScheme(isDarkScheme ? .dark : nil)
        .background {
            if !isDarkScheme {
                Color.white
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
