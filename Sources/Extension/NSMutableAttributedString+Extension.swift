// 
// NSMutableAttributedString+Extension.swift
// tmsae
// 
// Created by 조봉기 on 2022/01/22.
// Copyright 2022 tmsae. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    open func foregroundColor(_ color: UIColor, for text: String? = nil) -> Self {
        addAttribute(.foregroundColor, value: color, range: range(of: text))
        return self
    }

    open func font(_ font: UIFont, for text: String? = nil) -> Self {
        addAttribute(.font, value: font, range: range(of: text))
        return self
    }

    private func paragraphStyle<T>(
        _ keyPath: WritableKeyPath<NSMutableParagraphStyle, T>,
        to value: T,
        range: NSRange
    ) {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle[keyPath: keyPath] = value
        addAttribute(.paragraphStyle, value: paragraphStyle, range: range)
    }

    private func range(of text: String?) -> NSRange {
        let range: NSRange

        if let text = text {
            range = (string as NSString).range(of: text)
        }
        else {
            range = NSRange(location: .zero, length: string.utf16.count)
        }

        return range
    }
}