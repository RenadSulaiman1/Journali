import Foundation

struct Journal: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date = Date()
    var isBookmarked: Bool = false
}
