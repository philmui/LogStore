import Foundation

public struct LogStore {
    static var log: [String] = []
}

public func printLog(_ logString: String) {
    print(logString)
    
    let timestamp = Utilities.getTimestamp()
    LogStore.log.append("\(timestamp): \(logString)")
}
