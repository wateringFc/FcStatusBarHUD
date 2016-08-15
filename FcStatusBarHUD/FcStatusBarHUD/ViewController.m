//
//  ViewController.m
//  FcStatusBarHUD
//
//  Created by 方存 on 16/8/15.
//  Copyright © 2016年 健康宝. All rights reserved.
//

#import "ViewController.h"
#import "FcStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)click:(UIButton *)sender
{
    switch (sender.tag) {
        case 10:
        {
            [FcStatusBarHUD showSuccess:@"加载成功"];
        }
            break;
        case 20:
        {
            [FcStatusBarHUD showError:@"加载失败"];
        }
            break;
        case 30:
        {
            [FcStatusBarHUD showLoading:@"正在处理中"];
        }
            break;
        case 40:
        {
            [FcStatusBarHUD hide];
        }
            break;
        case 50:
        {
            [FcStatusBarHUD showMessage:@"普通文字"];
//            [FcStatusBarHUD showMessage:@"测试文字加图" image:[UIImage imageNamed:@"error"]];
        }
            break;
            
        default:
            break;
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
