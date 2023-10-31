
import SwiftUI

// Class with some tools for easily to manage UI obj
class Tools {
    
}

// struct with tools changes attr widgets
struct UITools {
    func changeShameImage(imageScheme: inout String) -> String {
        guard imageScheme == "moon" else {
            return "moon"
        }
        return "sun"
    }
}
