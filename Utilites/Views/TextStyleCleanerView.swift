
import SwiftUI
import AppKit

enum PickerOptionsTextStyle: String, CaseIterable, Identifiable {
    case rgb
    case hex
    case hsl
    
    var id: String {
        self.rawValue
    }
}

struct TextStyleCleanerView: View {
    @State private var isOn = false
    @State private var isExpanded = false
    @State private var selectedOptions = PickerOptionsTextStyle.rgb
    
    @State private var textCopyField = "Text"
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView([.vertical, .horizontal], showsIndicators: true) {
                ZStack(alignment: .leading) {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        Text("Text Style Cleaner")
                            .padding(.leading)
                            .font(.custom("Monaco", size: 14))
                            .fontDesign(.rounded)
                            .offset(x: -5, y: 2)
                            .padding(.horizontal, 5)
                        Text("Clear text styles - a quick way to get text unstyled and in a given size, as well as apply a font")
                            .padding(.horizontal, 5)
                            .font(.system(size: 14, weight: .light, design: .rounded))
                            .offset(x: 5, y: 30)
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 5, alignment: .top)
                .offset(y: -geometry.size.height / 4)

                
                ZStack {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        HStack(spacing: 35) {
                            HStack {
                                Image(systemName: "note.text")
                                    .frame(width: 35, height: 35)
                                Text((isOn ? "Turn Off " : "Turn On ") + "Text Style Cleaner")
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
                .offset(y: -geometry.size.height / 5)
                
                ZStack {
                    GeometryReader { geometryContainer in
                        ContainerRelativeShape()
                            .fill(Color.gray)
                            .cornerRadius(10.0)
                        HStack(spacing: 15) {
                            TextField("", text: $textCopyField)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .offset(y: geometryContainer.size.height / 3)
                                .frame(width: geometryContainer.size.width / 2)
                                .padding(.horizontal, 5)
                                .onAppear {
                                    // getting text from clipboard
                                    if let textPasteboard = NSPasteboard.general.string(forType: .string) {
                                        textCopyField = textPasteboard
                                    }
                                }
                            Button(action: {
                                // writing text to clipboard
                                let textFromField = NSPasteboard.general
                                textFromField.clearContents()
                                textFromField.setString(textCopyField, forType: .string)
                            }, label: {
                                Image(systemName: "doc.text.fill")
                            })
                            .offset(y: geometryContainer.size.height / 3)
                        }
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 10, alignment: .top)
                .offset(y: -geometry.size.height / 7)
            }
            .fixedSize(horizontal: false, vertical: false)
        }
    }
}

#Preview {
    TextStyleCleanerView()
}
