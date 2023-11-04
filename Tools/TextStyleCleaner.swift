
import AppKit
import HotKey

// class clear style of the text from clipboard
class TextStyleCleaner {
    private var _pasteBoard: NSPasteboard
    
    init(pasteBoard: NSPasteboard) {
        self._pasteBoard = pasteBoard
        
    }
    
    // getter/setter
    var pasteBoard: NSPasteboard {
        get {
            return _pasteBoard
        }
        set {
            _pasteBoard = newValue
        }
    }
    
    func clearStyleText() {
        if let clipboardObj = self._pasteBoard.string(forType: .string) {
            let plain = String(clipboardObj)
            self._pasteBoard.setString(plain, forType: .string)
            print("done")
        }
    }
    
    func hotKey() {
        let hotkey = HotKey(key: .a, modifiers: [.command, .shift])
        hotkey.keyDownHandler = {
            print("hello world")
        }
    }
}
