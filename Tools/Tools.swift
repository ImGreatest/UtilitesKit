
import SwiftUI
import Foundation

// Class with some tools for easily to manage UI obj
class Tools {
    
}

// struct with tools changes attr widgets
struct UITools {
    func changeShameImage(nameScheme: String) -> Bool {
        guard nameScheme == "dark" else {
            return false
        }
        return true
    }
}



// struct for read data from json files
struct JsonReader {
    
    func getCaption() -> String {
        // checking locate json file
        if let url = Bundle.main.url(forResource: "jsonUI", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
            // Parse the JSON data
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary {
                return json["caption"] as? String ?? ""
            }
        }
        return ""
    }
    
    func getWidth() -> Int16 {
        // checking locate json file
        if let url = Bundle.main.url(forResource: "jsonUI", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
            // Parse the JSON data
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary {
                return json["contentSizeWidth"] as? Int16 ?? 0
            }
        }
        return 0
    }
    
    func getHeight() -> Int16 {
        // checking locate json file
        if let url = Bundle.main.url(forResource: "jsonUI", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
            // Parse the JSON data
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary {
                return json["contentSizeHeight"] as? Int16 ?? 0
            }
        }
        return 0
    }
    
    func getColorScheme() -> String {
        if let url = Bundle.main.url(forResource: "jsonUI", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
            // Parse the JSON data
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary {
                return json["colorScheme"] as? String ?? ""
            }
        }
        return ""
    }
    
    // getting block json code contains all styles and schemes for ContentView view
    func getContentViewSettings() -> [String: Any] {
        if let url = Bundle.main.url(forResource: "jsonUI", withExtension: "json"), let jsonData = try? Data(contentsOf: url) {
            // Parse the JSON data
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? NSDictionary {
                return json["ContentView"] as? [String: Any] ?? ["": ""]
            }
        }
        return ["": ""]
    }
}

// struct for record data to json files
struct JsonRecorder {
    
}
