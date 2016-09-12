//
//  ViewController.m
//  CellFoldDemo
//
//  Created by 李曈 on 16/9/12.
//  Copyright © 2016年 lt. All rights reserved.
//

#import "ViewController.h"
#import "TTTableViewCell.h"
#import "TTModel.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kCellID @"TTCell"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{

}
@property(nonatomic,strong) UITableView * mainTableView;

@property(nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _dataArray = @[].mutableCopy;
    [self createUI];
    [self getDataFromNet];
}
//模拟数据
-(void)getDataFromNet{
    NSArray * text = @[@"《红楼梦》开篇以神话形式介绍作品的由来，说女娲炼三万六千五百零一块石补天，只用了三万六千五百块，剩余一块未用，弃在青埂峰下。剩一石自怨自愧，日夜悲哀。一僧一道见它形体可爱，便给它镌上数字，携带下凡。不知过了几世几劫，空空道人路过，见石上刻录了一段故事，便受石之托，抄写下来传世。辗转传到曹雪芹手中，经他批阅十载、增删五次而成书。",@"阅金陵十二钗正册、副册、又副册判词",@"书中故事发生在京城贾府，为宁国公、荣国公之家宅。据冷子兴演说，宁国公长孙名贾敷，八九岁上死了；次贾敬袭官，而一味好道，把世袭的官爵让给了儿子贾珍，自己出家修道；贾珍无法无天，寻欢作乐，生贾蓉，儿媳秦可卿。荣国公长孙名贾赦，生贾琏，儿媳王熙凤；次贾政；女贾敏，嫁林如海，中年而亡，仅遗一女林黛玉。贾政娶王夫人，生长子贾珠，娶了妻（李纨），生了子（贾兰），一病就死了；生女元春，入宫为妃；次又得子，衔玉而诞，玉上有字，因名贾宝玉。人人都以为贾宝玉来历不小，贾母尤其溺爱",@"贾宝玉长到七八岁，聪明绝人，然生性钟爱女子，常说“女儿是水作的骨肉，男人是泥作的骨肉”。人人皆以为他将来不过是个色鬼，贾政也不大喜欢他，对他管教甚严，因为都不知他是正邪两赋而来",@"阅金陵十二钗正册、副册、又副册判词",@"金陵十二钗36位女儿，除了贾府本家的几位姑娘、奶奶和丫鬟外，还有亲戚家的女孩，如黛玉、宝钗，都寄居于贾府，史湘云也是常客，妙玉则在大观园栊翠庵修行",@"故事起始于贾敏病逝，贾母怜惜黛玉无依傍，又多病，于是接到贾府抚养。黛玉小贾宝玉一岁。后又有王夫人外甥女薛宝钗也到贾府，大贾宝玉二岁，长得端方美丽。贾宝玉在孩提之间，性格纯朴，深爱二人无偏心，黛玉便有些醋意，宝钗却浑然不觉。贾宝玉与黛玉同在贾母房中坐卧，所以比别的姊妹略熟惯些",@"一天，贾宝玉在秦可卿卧房午睡，梦入太虚幻境，遇警幻仙子，阅金陵十二钗正册、副册、又副册判词，有图有诗，只是不解其意。警幻命仙女演奏新制《红楼梦》套曲十四支，其收尾一支名《飞鸟各投林》，词云“落了片白茫茫大地真干净”。然而贾宝玉仍不解，警幻更将妹妹可卿许配与他，二人难分难解，入迷津而惊醒。",@"阅金陵十二钗正册、副册、又副册判词",@"元春被选为贵妃，荣国府愈加贵盛，为之建造大观园，迎接省亲，家人团圆，极天伦之乐。贾宝玉长到十二三岁，在外结交秦钟、蒋玉函，在内则周旋于姊妹中表以及丫鬟如袭人、晴雯、平儿、紫鹃等之间，亲昵且敬爱她们，极尽小心谨慎，深恐违逆她们的心意，所爱的女儿多，自己身心劳倦，而忧患也与日俱增。一次听紫鹃说黛玉要回原籍（苏州）去，贾宝玉便唬傻了，闹得满宅惊慌，直到紫鹃说明缘由才好了",@"阅金陵十二钗正册、副册、又副册判词"];
    for (int i = 0 ; i < 10; i ++) {
        TTModel * model = [TTModel new];
        NSInteger randNum = arc4random()%4 + 1;
        model.userIcon = [NSString stringWithFormat:@"%ld",(long)randNum];
        model.userMsg = text[i];
        [_dataArray addObject:model];
    }
}

-(void)createUI{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20,kScreenWidth,kScreenHeight - 20) style:UITableViewStylePlain];
    [self.view addSubview:_mainTableView];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [_mainTableView registerNib:[UINib nibWithNibName:@"TTTableViewCell" bundle:nil] forCellReuseIdentifier:kCellID];
    [_mainTableView setTableFooterView:[UIView new]];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
    [cell doRefreshModel:^(id model, NSInteger rowNum, NSInteger sectionNum) {
        TTModel * ttmodel = (TTModel *)model;
        ttmodel.isOpen = !ttmodel.isOpen;
        //刷新选中的某一行
        [_dataArray replaceObjectAtIndex:indexPath.row withObject:ttmodel];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }];
    return cell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTModel * model = _dataArray[indexPath.row];
    if (model.isOpen) {
        //如果是打开的状态  就显示实际需要的高度
       return model.msgSize.height + 40;
    }else{
        //如果需要显示 展开的按钮 就返回80的高度  如果不需要 就返回60的高度
        if (model.shouldShowOpenBtn) {
            return 80;
        }else{
            return 60;
        }
       
    }
}
#pragma mark -TTRefreshCellDelegate
-(void)refreshCellHeght{
    NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:0];
    [_mainTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
