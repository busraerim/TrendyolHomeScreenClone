//
//  Models.swift
//  TrendyolCloneApp
//
//  Created by Büşra Erim on 10.01.2025.
//

import Foundation

public enum SectionStyle {
    case littleSquare
    case verticalRectangle
    case horizontalRectangle
    case nonSliderRectangle
    case notificationSection
}

struct SectionModel {
    var itemCount: Int
    var sectionStyle: SectionStyle
}
