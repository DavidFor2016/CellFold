//
//  TTTableViewCell.m
//  CellFoldDemo
//
//  Created by 李曈 on 16/9/12.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "TTTableViewCell.h"
#import "TTModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface TTTableViewCell(){


}
@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (strong, nonatomic)  UILabel *msgboard;
@property (weak, nonatomic) IBOutlet UIButton *showMoreBtn;

//@property (strong, nonatomic) UILabel * moreLabel;

@end
@implementation TTTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _showMoreBtn.hidden = YES;
    _msgboard = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    _msgboard.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_msgboard];
    _msgboard.numberOfLines = 0;
    _msgboard.lineBreakMode = NSLineBreakByTruncatingTail;
}

-(void)setModel:(id)model{
    TTModel * ttmodel  = (TTModel *)model;
    _model = ttmodel;
    _headIcon.image = [UIImage imageNamed:ttmodel.userIcon];
    _msgboard.text = ttmodel.userMsg;
    _showMoreBtn.hidden = !ttmodel.shouldShowOpenBtn;
    if (!ttmodel.isOpen) {
        _msgboard.frame = CGRectMake(55, 5,kScreenWidth - 65,40);
        [_showMoreBtn setTitle:@"展开" forState:0];
    }else{
        _msgboard.frame = CGRectMake(55, 5,kScreenWidth - 65,ttmodel.msgSize.height);
        [_showMoreBtn setTitle:@"收起" forState:0];
    }
}
- (IBAction)showMore:(id)sender {
    TTModel * ttmodel  = _model;
    if (ttmodel.isOpen) {
        _ttRefreshBlock(_model,1,1);
    }else{
        _ttRefreshBlock(_model,0,1);
    }
}
-(void)doRefreshModel:(TTRefreshBlock)ttRefreshBlock{
    _ttRefreshBlock = ttRefreshBlock;
}
@end
