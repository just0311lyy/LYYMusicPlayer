//
//  LYYMusicLoginViewController.m
//  LYYMusicPlayer
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LYYMusicLoginViewController.h"
#import "UIColor+Art.h"
@interface LYYMusicLoginViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *heardImgView;
@property (weak, nonatomic) IBOutlet UIView *enterView;

@property (weak, nonatomic) IBOutlet UITextField *accountTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;

@end

@implementation LYYMusicLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHex:0xE7EBF1];
    // 键盘即将弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘即将隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
   
}

- (IBAction)hideKeyBoard:(id)sender {
    
    [self.accountTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
}


- (void)keyboardWillShow:(NSNotification *)note{
    
    //键盘弹出需要的时间
    CGFloat duration = [note.userInfo [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 动画
    [UIView animateWithDuration:duration animations:^{
        // 键盘高度
        CGFloat keyboardHeight = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        //enterView的底部距顶端距离
        CGFloat enterViewBottom = self.enterView.frame.origin.y + self.enterView.frame.size.height;
        //enterView的底部和键盘的高度差
        CGFloat height =enterViewBottom -(self.view.frame.size.height - keyboardHeight);
        if (height < 0) height =0;
        
        self.view.transform = CGAffineTransformMakeTranslation(0, -height);

    }];
    
}

- (void)keyboardWillHide:(NSNotification *)note{
    
    //键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //动画
    [UIView animateWithDuration:duration animations:^{
        
        self.view.transform = CGAffineTransformIdentity;
    }];

}

-(void)removeKeyboardNotification{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

#pragma mark - memoryManger

-(void)dealloc{
    
    [self removeKeyboardNotification];
}



- (IBAction)login:(id)sender {
    
    
   
}





@end
