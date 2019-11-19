//
//  GreekKeyboard.swift
//  KeyboardKitDemoKeyboard
//
//  Created by Li Xi on 19/11/2019.
//

import KeyboardKit

/**
 This demo keyboard mimicks an English symbolic keyboard.
 */
struct GreekKeyboard: DemoKeyboard {
    
    init(in viewController: KeyboardViewController) {
        actions = type(of: self).actions(in: viewController)
    }
    
    let actions: KeyboardActionRows
}

private extension GreekKeyboard {
    
    static func actions(in viewController: KeyboardViewController) -> KeyboardActionRows {
        return KeyboardActionRows
            .from(characters)
            .addingSideActions()
            .appending(bottomActions(leftmost: switchAction, for: viewController))
    }
    
    static var characters: [[String]] = [
        ["𝛼", "𝛽", "𝛾", "𝛿", "𝜀", "𝜁", "𝜂", "𝜃", "𝜅", "𝜆", "𝜒"],
        ["𝜇", "𝜈", "𝜉", "𝜋", "𝜌", "𝜎", "𝜏", "𝜑", "𝜙", "𝜓", "𝜔"],
        ["𝝙", "𝚪", "𝚲", "𝛀", "𝚿", "𝚽", "𝚷"]
    ]
    
    static var switchAction: KeyboardAction {
        return .switchToKeyboard(.alphabetic(uppercased: false))
    }
}

private extension Sequence where Iterator.Element == KeyboardActionRow {
    
    func addingSideActions() -> [Iterator.Element] {
        var actions = map { $0 }
        actions[2].insert(.switchToKeyboard(.numeric), at: 0)
        actions[2].insert(.none, at: 1)
        actions[2].append(.none)
        actions[2].append(.backspace)
        return actions
    }
}
