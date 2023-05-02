import Foundation

extension String {
    static func += (lhs: inout String, rhs: Character) {
        lhs.append(rhs)
    }
}
