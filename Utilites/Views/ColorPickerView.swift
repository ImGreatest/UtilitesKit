
import SwiftUI

enum PickerOptions: String, CaseIterable, Identifiable {
    case rgb
    case hex
    case hsl
    
    var id: String {
        self.rawValue
    }
}


struct ColorPickerView: View {
    @State private var isOn = false
    @State private var isExpanded = false
    @State private var selectedOptions = PickerOptions.rgb
    
    var body: some View {
            GeometryReader { geometry in
                ScrollView([.vertical, .horizontal], showsIndicators: true) {
                    ZStack(alignment: .leading) {
                        GeometryReader { geometryContainer in
                            ContainerRelativeShape()
                                .fill(Color.gray)
                                .cornerRadius(10.0)
                            Text("Color Picker")
                                .padding(.leading)
                                .font(.custom("Monaco", size: 14))
                                .fontDesign(.rounded)
                                .offset(x: -5, y: 2)
                                .padding(.horizontal, 5)
                            Text("Simple and convenient system-level color picker")
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
                                    Image(systemName: "pencil.circle.fill")
                                        .frame(width: 35, height: 35)
                                    Text((isOn ? "Turn Off " : "Turn On ") + "Color Picker")
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
                            Picker("Selected a format ", selection: $selectedOptions) {
                                ForEach(PickerOptions.allCases) { options in
                                    Text(options.rawValue.capitalized).tag(options)
                                }
                            }
                            .padding(.bottom, -5)
                            .offset(x: geometryContainer.size.width / 3)
                            .frame(width: 200, height: 40)
                        }
                    }
                    .frame(width: geometry.size.width - 75, height: geometry.size.height / 10, alignment: .top)
                    .offset(y: -geometry.size.height / 7)
                }
                .fixedSize(horizontal: false, vertical: false)
                .tag("ScrollIntroduce")
            }
        }
}

#Preview {
    ColorPickerView()
}
