//
//  Register.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "Register.h"
#import "PlayListTableViewController.h"
#import "PooCodeView.h"

@interface Register ()

@property (nonatomic, retain) PooCodeView *codeView;
-(IBAction)pressReg:(id)sender;
-(IBAction)TeST:(id)sender;

@end

@implementation Register

@synthesize codeView = _codeView;

-(IBAction)TeST:(id)sender{
    PlayListTableViewController *detailVC = [[PlayListTableViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}

//  实现注册方法
-(IBAction)pressReg:(id)sender{
    

    //  先判断验证码
    if ([self.code.text isEqualToString:self.codeView.changeString]) {
    //  再判断邮箱的正则表达式
        if ([self validateEmail:self.email.text]) {
            //  确定用户已经填写了密码
            if ([self.password.text isEqualToString:@"请输入登录密码"]||[self.password.text isEqualToString:@""]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，注册失败！" message:@"请填写您的密码" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
                [alert show];
            }
else{
    //2.设置登录参数
    NSDictionary *dict = @{ @"email":_email.text, @"password":_password.text};
    
    NSURL *url=[[NSURL alloc]initWithString:@"http://localhost:75/ShiXiSeng/register.php"];
    
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
    
    
    NSString *Info = [dictq objectForKey:@"result"];
    NSLog(@"%@",Info);
    //  判断是否连接服务器
    if (Info == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，连接失败！" message:@"请确保您的网络已经打开" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
        [alert show];

    }
    else{
    if([Info isEqualToString:@"exist"]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，注册失败！" message:@"您的邮箱已经注册过了" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
        [alert show];
    }
    
    else if ([Info isEqualToString:@"success"]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"注册成功" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
        //[alert addButtonWithTitle:@"登录"];


        [alert show];

        
        //  登录成功进入主页
        
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
        }
    }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，注册失败！" message:@"您的邮箱格式有误" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
        [alert show];
       
    }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"对不起，注册失败！" message:@"您的验证码输入有误" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
        [alert show];

    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //  点击注册页
    if (buttonIndex == 1) {
        
        [self performSegueWithIdentifier:@"Sign" sender:self];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  验证码
    self.codeView = [[PooCodeView alloc] initWithFrame:CGRectMake(295, 124, 80, 40)];
    [self.view addSubview:self.codeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  验证邮箱
-(BOOL)validateEmail:(NSString*)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       (0 != [email rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet* tmpInvalidMutableCharSet = [tmpInvalidCharSet mutableCopy];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];
        
        /*
         *使用compare option 来设定比较规则，如
         *NSCaseInsensitiveSearch是不区分大小写
         *NSLiteralSearch 进行完全比较,区分大小写
         *NSNumericSearch 只比较定符串的个数，而不比较字符串的字面值
         */
        NSRange range1 = [email rangeOfString:@"@"
                                      options:NSCaseInsensitiveSearch];
        
        //取得用户名部分
        NSString* userNameString = [email substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];
        
        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }
        
        //取得域名部分
        NSString *domainString = [email substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];
        
        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else {
        return NO;
    }
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
