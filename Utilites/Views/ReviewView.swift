

import SwiftUI

struct ReviewView: View {
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
                    }
                }
                .frame(width: geometry.size.width - 75, height: geometry.size.height / 2, alignment: .top)
                .offset(y: -geometry.size.height / 20)
            }
            .fixedSize(horizontal: false, vertical: false)
        }
    }
}

#Preview {
    ReviewView()
}
