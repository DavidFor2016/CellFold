//
//  TTModel.h
//  CellFoldDemo
//
//  Created by 李曈 on 16/9/12.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TTModel : NSObject
@property (nonatomic,strong) NSString * userIcon;

@property (nonatomic,strong) NSString * userMsg;

@property (nonatomic,assign) CGSize msgSize;

@property (nonatomic,assign) BOOL shouldShowOpenBtn;

@property (nonatomic,assign) BOOL isOpen;

@end
