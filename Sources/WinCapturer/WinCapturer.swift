// The Swift Programming Language
// https://docs.swift.org/swift-book

import AppKit

public extension NSWindow {
    public func screenshot() -> NSImage? {
        let windowID = self.windowNumber
        
        let imageOptions: CGWindowImageOption = [.boundsIgnoreFraming, .bestResolution]
        let image = CGWindowListCreateImage(.null, .optionIncludingWindow, CGWindowID(windowID), imageOptions)
        
        if let cgImage = image {
            return NSImage(cgImage: cgImage, size: self.frame.size)
        }
        return nil
    }
    
    public func saveScreenshotTo(file: String, onResult: ((Error?) -> Void)? = nil) {
        if let screenshot = self.screenshot() {
            let fileURL = URL(fileURLWithPath: file)
            if let tiffData = screenshot.tiffRepresentation,
               let bitmapImageRep = NSBitmapImageRep(data: tiffData),
               let pngData = bitmapImageRep.representation(using: .png, properties: [:]) {
                do {
                    try pngData.write(to: fileURL)
                    onResult?(nil)
                } catch let error {
                    onResult?(error)
                }
            }
        }
    }
}
