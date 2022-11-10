//
//  DecimalUtil.swift
//  Bankey
//
//  Created by MEP LAB 01 on 04/10/22.
//

import Foundation

extension Decimal{
    var doubleValu: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
