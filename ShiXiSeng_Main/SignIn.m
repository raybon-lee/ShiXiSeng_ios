//
//  SignIn.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/6.
//  Copyright (c) 2015年 jackson. All rights reserved.
//


#import "SignIn.h"

#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "JobTable.h"
#import "SampleViewController.h"

@interface SignIn ()

@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong ,nonatomic) IBOutlet UITextField *password;

-(IBAction)signin:(id)sender;

@end

@implementation SignIn

//  设置引导页
- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    page1.bgImage = [UIImage imageNamed:@"1"];
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.desc = @"“找真爱”—实习僧只为你们两的不期而遇";
    page2.bgImage = [UIImage imageNamed:@"2"];
    
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    page3.bgImage = [UIImage imageNamed:@"3"];
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showBasicIntroWithBg {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.desc = @"“找真爱”—实习僧只为你们两的不期而遇";
    
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showBasicIntroWithFixedTitleView {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.desc = @"“找真爱”—实习僧只为你们两的不期而遇";
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"original"]];
    intro.titleView = titleView;
    intro.backgroundColor = [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f]; //iOS7 dark blue
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showCustomIntro {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.titlePositionY = 180;
    page2.desc = @"“找真爱”—实习僧只为你们两的不期而遇";
    page2.descPositionY = 160;
    
    page2.imgPositionY = 70;
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.titlePositionY = 220;
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    page3.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page3.descPositionY = 200;
    
    page3.imgPositionY = 100;
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    intro.backgroundColor = [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f]; //iOS7 orange
    
    intro.pageControlY = 100.0f;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setBackgroundImage:[UIImage imageNamed:@"skipButton"] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake((320-230)/2, [UIScreen mainScreen].bounds.size.height - 60, 230, 40)];
    [btn setTitle:@"SKIP NOW" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    intro.skipButton = btn;
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showIntroWithCustomView {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    page1.bgImage = [UIImage imageNamed:@"1"];
    
    
    UIView *viewForPage2 = [[UIView alloc] initWithFrame:self.view.bounds];
    UILabel *labelForPage2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 300, 30)];
    labelForPage2.text = @"Some custom view";
    labelForPage2.font = [UIFont systemFontOfSize:32];
    labelForPage2.textColor = [UIColor whiteColor];
    labelForPage2.backgroundColor = [UIColor clearColor];
    labelForPage2.transform = CGAffineTransformMakeRotation(M_PI_2*3);
    [viewForPage2 addSubview:labelForPage2];
    EAIntroPage *page2 = [EAIntroPage pageWithCustomView:viewForPage2];
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    page3.bgImage = [UIImage imageNamed:@"3"];
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}

- (void)showIntroWithSeparatePagesInit {
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
    
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.desc = @"新旅程—实习僧带你进入职业生涯";
    page1.bgImage = [UIImage imageNamed:@"1"];
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.desc = @"“找真爱”—实习僧只为你们两的不期而遇";
    page2.bgImage = [UIImage imageNamed:@"2"];
    
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.desc = @"携手共进－实习僧带你进入\r\n暑期实习、名企实习、创业公司、NGO";
    page3.bgImage = [UIImage imageNamed:@"3"];
    
    
    [intro setPages:@[page1,page2,page3]];
}

- (void)introDidFinish {
    NSLog(@"Intro callback");
}

-(IBAction)test:(id)sender{
   SampleViewController  *jobt = [[SampleViewController alloc] initWithNibName:@"jacosn" bundle:nil];
    [self addChildViewController:jobt];
}
//  登录事件
-(IBAction)signin:(id)sender{
    
    
    //2.设置登录参数
    NSDictionary *dict = @{ @"username":_email.text, @"password":_password.text};
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://localhost:75/ShiXiSeng/login.php"];
  
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *js =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
  
    
    NSLog(@"json=%@",js);
    NSMutableData *postBody=[NSMutableData data];
    [postBody appendData:  [[NSString stringWithFormat: @"json=%@",js]
       dataUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url
                                                             cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                         timeoutInterval:20.0f];
    [request setHTTPMethod: @"POST"];
    [request setValue: @"application/x-www-form-urlencoded" forHTTPHeaderField:@"json"];
    [request setHTTPBody:postBody];
    NSError *error = nil;
    NSHTTPURLResponse* urlResponse = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
            returningResponse:&urlResponse error:&error];

    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"结果：%@",result);
    NSData *data = [result dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dictq = (NSDictionary *)json;
    
    
    if (result == nil) {
        
        NSLog(@"请输入密码！");
    }
    
        NSString *Info = [dictq objectForKey:@"result"];
        NSLog(@"%@",Info);
        
        if ([Info isEqualToString:@"success"]) {
            NSLog(@"Contragulations!");
            //  登录成功进入主页
            [self performSegueWithIdentifier:@"home" sender:self];
            //  保存用户的登录信息
            //获取userDefault单例
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            
            //登陆成功后把用户名和密码存储到UserDefault
            NSString *username = self.email.text;
            NSString *password = self.password.text;
            [userDefaults setObject:username forKey:@"name"];
            [userDefaults setObject:password forKey:@"password"];
            [userDefaults synchronize];
        
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，登录失败！" message:@"您的帐号或密码错误" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
            
            [alert addButtonWithTitle:@"注册"];
            [alert show];
            NSLog(@"登录失败！");
        }
        
   
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //  点击注册页
    if (buttonIndex == 1) {
       
        [self performSegueWithIdentifier:@"register" sender:self];    }
    
}
//+ (NSString*)dictionaryToJson:(NSDictionary *)dic
//
//{
//    
//    NSError *parseError = nil;
//    
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
//    
//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    
//}
- (void)viewDidLoad {


    [super viewDidLoad];
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    if([userDefaults objectForKey:@"FirstLoad"] == nil) {
        [userDefaults setBool:NO forKey:@"FirstLoad"];
        //显示引导页
        [self showIntroWithCrossDissolve];
        NSLog(@"用户已经登录");
    }
    // Do any additional setup after loading the view.

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
