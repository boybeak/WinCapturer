# WinCapturer
A library for capturing window for macOS

```swift
// 获取用户主目录路径
let homeDirectory = NSHomeDirectory()

// 构建 Downloads 目录路径
let downloadsPath = "\(homeDirectory)/Downloads/translator.png"

// 调用方法保存截图到指定路径
window.saveScreenshotTo(file: downloadsPath) { error in
}
```
