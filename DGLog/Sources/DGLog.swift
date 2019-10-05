import Foundation

/// DGLogConfig
public enum DGLogConfig {
    public static var isVisible = true
    public static var isVisibleDate = true
    public static var isVisibleFile = true
    public static var isVisibleFunction = true
    public static var isVisibleLine = true
    public static var isVisibleMessage = true
    public static var dateFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "MM/dd/yyyy HH:mm:ss.SSS"
        return result
    }()
}

/// DGLog
///
/// - Parameters:
///   - items: Zero or more items to print.
///   - file: file name
///   - function: function name
///   - line: line number
/// - Returns: log description
@discardableResult
public func DGLog(_ items: Any ..., file: String = #file, function: String = #function, line: Int = #line) -> String {
    
    #if DEBUG
    typealias config = DGLogConfig
    
    var arr = [String]()
    
    if config.isVisibleDate {
        arr.append(DGLogConfig.dateFormatter.string(from: Date()))
    }
    if config.isVisibleFile, config.isVisibleFunction {
        arr.append("[\(URL(fileURLWithPath: file).lastPathComponent) \(function)]")
    } else if config.isVisibleFile, !config.isVisibleFunction {
        arr.append("[\(URL(fileURLWithPath: file).lastPathComponent)]")
    } else if !config.isVisibleFile, config.isVisibleFunction {
        arr.append("[\(function)]")
    }
    if config.isVisibleLine {
        arr.append("(\(line))")
    }
    if config.isVisibleMessage {
        let message = items.map({ String(describing: $0) }).joined(separator: " ")
        // newline check
        let isExistNewlines = message.first { (c) -> Bool in
            var isContain = false
            for unicodeScalar in c.unicodeScalars {
                if CharacterSet.newlines.contains(unicodeScalar) {
                    isContain = true
                    break
                }
            }
            return isContain
        } != nil
        let front = isExistNewlines ? "\n" : ""
        arr.append(front + message)
    }
    if config.isVisible {
        let total = arr.joined(separator: " ")
        print(total)
        return total
    } else {
        return ""
    }
    #else
    return ""
    #endif
}
