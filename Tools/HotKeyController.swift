import AppKit
import Cocoa
import HotKey

class HotKeyController: ObservableObject {
    private var _baseHotkey: String
    private var _modificatorHotkey: [NSEvent.ModifierFlags]
    //private var _setFunc: () -> Void
    
    
    init(baseHotkey: String, modificatorHotkey: [NSEvent.ModifierFlags]) {
        self._baseHotkey = baseHotkey
        self._modificatorHotkey = modificatorHotkey
        //self._setFunc = setFunc
    }
    
    // setter and getter for baseHotKey variable
    var baseHotkey: String {
        get {
            return self._baseHotkey
        }
        
        set {
            self._baseHotkey = newValue
        }
    }
    
    // setter and getter for modificatorHotkey variable
    var modificator: [NSEvent.ModifierFlags] {
        get {
            return self._modificatorHotkey
        }
        
        set {
            self._modificatorHotkey = newValue
        }
    }

    func setHotKey(action: @escaping () -> Void) {
        var modifierFlags = NSEvent.ModifierFlags()
        
        if self._modificatorHotkey.contains(.capsLock) {
            modifierFlags.insert(.capsLock)
        }
        if self._modificatorHotkey.contains(.option) {
            modifierFlags.insert(.option)
        }
        if self._modificatorHotkey.contains(.command) {
            modifierFlags.insert(.command)
        }
        if self._modificatorHotkey.contains(.shift) {
            modifierFlags.insert(.shift)
        }
        if self._modificatorHotkey.contains(.control) {
            modifierFlags.insert(.control)
        }
        
        let key = Key(string: _baseHotkey)
        let hotkey = HotKey(key: key!, modifiers: modifierFlags)
        hotkey.keyDownHandler = {
            action()
        }
    }
}
