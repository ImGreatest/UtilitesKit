
import SwiftUI
import UniformTypeIdentifiers
import PhotosUI

enum FormatPickerOptions: String, CaseIterable, Identifiable {
    case small
    case medium
    case large
    case mobile
    
    var id: String {
        self.rawValue
    }
}

struct ImageSizeChangerView: View {
    @State private var isOn = false
    @State private var isExpanded = false
    @State private var selectedOptions = FormatPickerOptions.small
    @State private var selectedItem: URL?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical, .horizontal], showsIndicators: true) {
                ZStack(alignment: .leading) {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        Text("Image Size Changer")
                            .padding(.leading)
                            .font(.custom("Monaco", size: 14))
                            .fontDesign(.rounded)
                            .offset(x: -5, y: 2)
                            .padding(.horizontal, 5)
                            .id("ContainerIntroduceLabel")
                        Text("Function that allows you to resize an image")
                            .padding(.horizontal, 5)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                            .offset(x: 5, y: 30)
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 5, alignment: .top)
                .offset(y: -geometry.size.height / 6)

                
                ZStack {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        HStack(spacing: 35) {
                            HStack {
                                Image(systemName: "square.resize")
                                    .frame(width: 35, height: 35)
                                Text((isOn ? "Turn Off " : "Turn On ") + "Image size changer")
                                    .font(.system(size: geometry.size.height < 600 ? 14 : 26, weight: .medium, design: .rounded))
                                    .foregroundStyle(Color(.white))
                                    .padding(.trailing)
                            }
                            .offset(x: -225)
                            .padding(.leading)
                            
                            // toggle working func
                            Toggle(isOn: $isOn, label: {
                                Text(isOn ? "On" : "Off")
                                
                            })
                            .padding(.horizontal, -25)
                        }
                        .padding(.top, -15)
                        .offset(x: geometryContainer.size.width / 2.5, y: geometry.size.height < 600 ? geometryContainer.size.height / 2 : geometryContainer.size.height / 2)
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 10, alignment: .top)
                .offset(y: -geometry.size.height / 8)
                
                ZStack {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        Picker("Selected a format ", selection: $selectedOptions) {
                            ForEach(FormatPickerOptions.allCases) { options in
                                Text(options.rawValue.capitalized).tag(options)
                            }
                        }
                        .padding(.bottom, -5)
                        .offset(x: geometryContainer.size.width / 3)
                        .frame(width: 200, height: 40)
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 10, alignment: .top)
                .offset(y: -geometry.size.height / 12)
                
                ZStack {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        HStack(spacing: 20) {
                            Button("Choose image") {
                                let panel = NSOpenPanel()
                                panel.allowedFileTypes = ["jpg", "jpeg", "png"]
                                panel.begin { result in
                                    if result == .OK {
                                        selectedItem = panel.url
                                    }
                                }
                            }
                            if let file = selectedItem {
                                // showing selected image like Image widget
                                //Image(nsImage: NSImage(contentsOf: file)!)
                                Image(systemName: "photo.artframe.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                            }
                        }
                        .offset(x: geometryContainer.size.width / 2.5, y: geometryContainer.size.height / 3)
                    }
                    .frame(width: geometry.size.width - 75, height: geometry.size.height / 8, alignment: .top)
                }
                .offset(y: -geometry.size.height / 25)
            }
            .fixedSize(horizontal: false, vertical: false)
            .tag("ScrollIntroduce")
        }
    }
}

#Preview {
    ImageSizeChangerView()
}
