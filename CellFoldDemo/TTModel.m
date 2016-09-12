//
//  TTModel.m
//  CellFoldDemo
//
//  Created by 李曈 on 16/9/12.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "TTModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation TTModel
-(void)setUserMsg:(NSString *)userMsg{
    _userMsg = userMsg;
    _msgSize = [userMsg boundingRectWithSize:CGSizeMake(kScreenWidth - 65, 999) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    //为什么是 设置当为40的时候 改变高度，主要是头像的高度为40，label小于头像的高度的时候 也为40
    if (_msgSize.height > 40) {
        _shouldShowOpenBtn = YES;
    }else{
        _shouldShowOpenBtn = NO;
    }
    _isOpen = NO;
}
-(CGSize)msgSize{
    if (_userMsg) {
        
    }else{
        _userMsg = @"";
    }
    _msgSize = [_userMsg boundingRectWithSize:CGSizeMake(kScreenWidth - 65, 999) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;
    return _msgSize;
}
@end
