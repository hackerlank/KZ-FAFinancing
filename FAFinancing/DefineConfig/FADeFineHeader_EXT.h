//
//  FADeFineHeader_EXT.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/9.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#ifndef FADeFineHeader_EXT_h
#define FADeFineHeader_EXT_h

//*********************** 请求错误的描述 ***************
#define _des_(c, des)\
    if (code == c) {\
        return @ #des;\
    }
static inline NSString * error_from_code(NSInteger code) {
    _des_(999, 服务器异常...)
    
    
    
    return nil;
}
#undef _des_
//*********************** END ***********************




#endif /* FADeFineHeader_EXT_h */
