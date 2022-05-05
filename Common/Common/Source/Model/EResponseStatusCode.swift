//
//  EResponseStatusCode.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public enum EResponseStatusCode: Int {

    case eSuccess = 0
    
    case eExtendResultOutFilter = 10
    case eTooFewResultInFilter = 11
    case eNoMoreResult = 12
    
    case eLoginFail = 101
    case eWrongOldPassword = 102
    case eBadNewPasswordFormat = 103
    
    case eMemberNotExist = 104
    case ePurchaseFail = 105
    
    case eRequestError = 400
    case eForbidden = 403
    case eInternalError = 500
    
    case eUnknownRequest = -200

}
