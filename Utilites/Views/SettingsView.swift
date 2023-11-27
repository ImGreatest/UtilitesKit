
import SwiftUI


enum Sizes: String, CaseIterable, Identifiable {
    case small
    case medium
    case large
    case full
    
    var id: String {
        self.rawValue
    }
}

struct SettingsView: View {
    @State private var selectedSize = Sizes.small
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                GeometryReader { geometryContainer in
                    ContainerRelativeShape()
                        .fill(Color.gray)
                        .cornerRadius(10.0)
                    HStack {
                        Picker("App size x ", selection: $selectedSize) {
                            ForEach(Sizes.allCases) { sizes in
                                Text(sizes.rawValue.capitalized)
                            }
                        }
                        .frame(width: 175)
                        .padding(.horizontal, geometryContainer.size.width / 10)
                        
                        Picker("App size y ", selection: $selectedSize) {
                            ForEach(Sizes.allCases) { sizes in
                                Text(sizes.rawValue.capitalized)
                            }
                        }
                        .frame(width: 175)
                    }
                    .padding(.top, geometryContainer.size.height / 3)
                }
            }
            .frame(width: geometry.size.width - 75, height: geometry.size.height / 6, alignment: .top)
            .padding(.horizontal, geometry.size.width / 15)
            .offset(y: geometry.size.height / 3)
        }
    }
}

#Preview {
    SettingsView()
}
