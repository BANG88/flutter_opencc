//
//  ViewController.m
//  OpenCC
//
//  Created by zhenian on 12/5/15.
//  Copyright © 2015 zhenian. All rights reserved.
//

#import "ViewController.h"
#import "OpenCCService.h"

@interface ViewController ()
@property(nonatomic, strong) OpenCCService *openCCService;
@property(nonatomic, strong) IBOutlet UITextView *showTextView;
@property(nonatomic, strong) IBOutlet UITextView *writeTextView;
@property(nonatomic, strong) IBOutlet UITextView *textView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.openCCService = [[OpenCCService alloc]initWithConverterType:OpenCCServiceConverterTypeS2T];
    NSString *str =  @" 说明：\n 1. 这个例子只是简体转繁体的。其它转换，请参考 OpenCCServiceConverterType 这个 ENUM 定义的词典。 \n 2. 由于 OpenCC 官方的 ocd 词典足有 4.3M 大，在iPhone 4, iPhone 4s, iPhone 5s, iPhone 5 下会消耗很大内存。故使用 txt 格式词典。 \n 3. 接口很简单。具体请参考 OpenCCService。 swift 直接调用 OpenCCService 即可。";
    self.textView3.text = str;
    self.showTextView.text = [self.openCCService convert:@"燕燕于飞差池其羽之子于归远送于野"];
    self.writeTextView.text = @"燕燕于飞差池其羽之子于归远送于野";
}

- (void)textViewDidChange:(UITextView *)textView {
    self.showTextView.text = [self.openCCService convert:self.writeTextView.text];
    [self.showTextView setContentOffset: CGPointMake(0,0) animated:NO]; // hack
    [self.showTextView setContentOffset:self.writeTextView.contentOffset animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.showTextView.contentOffset = scrollView.contentOffset;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.showTextView.text = @"";
    self.writeTextView.text = @"";
    self.textView3.text = @"";
}

-(void)updateViewConstraints{
    [super updateViewConstraints];
}

-(void)dealloc {
    self.openCCService = nil;
}

@end
