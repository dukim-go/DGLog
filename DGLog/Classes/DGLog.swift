import Foundation

public struct DGLogConfig {
    public static var isVisible = true
    public static var isVisibleDate = true
    public static var isVisibleFile = true
    public static var isVisibleFunction = true
    public static var isVisibleLine = true
    public static var isVisibleMessage = true
}

@discardableResult
public func DGLog(_ message: String = "",
                  args: CVarArg ...,
    function: String = #function,
    file: String = #file,
    line: Int = #line) -> String {
    
    #if DEBUG
    #else
    #endif
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let date = formatter.string(from: Date())
    let fileName = URL(fileURLWithPath: file).lastPathComponent
    let prefix = "\(date) [\(fileName) \(function)](\(line))"
    let body = String(format: "\(message)", args)
    let suffix = ""
    let result = prefix + body + suffix
    
    print(result)
    
    return result
}
