//
//  TTTableViewCell.h
//  CellFoldDemo
//
//  Created by 李曈 on 16/9/12.
//  Copyright © 2016年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TTRefreshBlock)(id model,NSInteger rowNum,NSInteger sectionNum);

@interface TTTableViewCell : UITableViewCell

@property (nonatomic,strong) id model;

@property (nonatomic,copy) TTRefreshBlock ttRefreshBlock;

-(void)doRefreshModel:(TTRefreshBlock)ttRefreshBlock;
@end
