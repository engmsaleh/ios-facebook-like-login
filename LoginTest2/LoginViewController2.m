//
//  ViewController.m
//  LoginTest2
//
//  Created by Raul Ramirez on 4/15/13.
//  Copyright (c) 2013 tmrk. All rights reserved.
//

#import "LoginViewController2.h"

@interface LoginViewController2 () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *loginTable;
@property (weak, nonatomic) IBOutlet UIImageView *tmrkLogoLabel;

@end

@implementation LoginViewController2


-(void)setLoginTable:(UITableView *)loginTable{
    _loginTable=loginTable;
    _loginTable.delegate=self;
    _loginTable.dataSource=self;
}

-(void) awakeFromNib{
//    [self.view layoutIfNeeded];
}
- (void)viewDidLoad
{
    [super viewDidLoad];


    NSLog(@"%f",self.tmrkLogoLabel.frame.origin.x);
    NSLog(@"%f",self.tmrkLogoLabel.frame.origin.y);
    NSLog(@"%f",self.tmrkLogoLabel.frame.size.width);
    NSLog(@"self.view.center.x %f",self.view.center.x);
    NSLog(@"self.view.center.y %f",self.view.center.y);
    
    
    NSLog(@"self.view.bounds %f %f %f %f",
          self.view.bounds.origin.x,
          self.view.bounds.origin.y,
          self.view.bounds.size.width,
          self.view.bounds.size.height);
    
    CGFloat w=1024.000000;
    CGFloat h=748.000000;
    if([[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationPortrait ||
       [[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationMaskPortraitUpsideDown){
        NSLog(@"vertical");
//        CGFloat temp = w;
        w=768.000000;
        h=1004.000000;
    }else{
//        CGFloat temp = w;
//        w=h;
//        h=temp;
        NSLog(@"horizontal");
    }
    
    
    NSLog(@"self.view.center.y %f",self.view.bounds.origin.x);
    NSLog(@"self.view.center.x %f",self.view.center.x);
//    CGPoint point = CGPointMake(1, 1);
//    [self.tmrkLogoLabel convertPoint:point fromView:nil];
//    NSLog(@"%f",point.x);
//    self.tmrkLogoLabel.center = self.view.center;
    
//    325
//    105
    
    
    CGPoint centerPoint = CGPointMake(
                                 w/2,
                                 h/2);
//    self.tmrkLogoLabel.center = centerPoint;
//    self.loginTable.center=centerPoint;
//    self.loginTable.frame=viewRect;
//    self.tmrkLogoLabel.frame = viewRect;
    CGRect viewRect2 = CGRectMake(self.tmrkLogoLabel.frame.origin.x,
                                  self.tmrkLogoLabel.frame.origin.y-150,
                                  self.tmrkLogoLabel.frame.size.width,
                                  self.tmrkLogoLabel.frame.size.height);

//    self.loginTable.center= self.view.center;
    //Make sure not to set your storyboard layout to autolayout
    UIViewAnimationOptions opts = UIViewAnimationOptionCurveEaseInOut ;
    [UIView animateWithDuration:0.7
            delay:1.0
            options:opts
            animations:^{
                        self.tmrkLogoLabel.frame = viewRect2; // move to new
                        [self.view layoutIfNeeded];
                    }
            completion:^(BOOL finished){
                [UIView animateWithDuration:.5 animations:^{
                             [self.loginTable setAlpha:1.0];
                             [self.view layoutIfNeeded];

                     }];
            }];
//
    }

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    CGFloat w=1024.000000;
    CGFloat h=748.000000;
    //    NSLog(<#NSString *format, ...#>)
    
    if( toInterfaceOrientation == UIInterfaceOrientationPortrait||
       toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        w=768.000000;
        h=1004.000000;
//        NSLog(@"fromInterfaceOrientation == UIInterfaceOrientationPortrait");
    }else{

    }
    
    CGPoint centerPoint = CGPointMake(
                                      w/2,
                                      h/2);
    self.tmrkLogoLabel.center = centerPoint;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    CGFloat w=1024.000000;
    CGFloat h=748.000000;
//    NSLog(<#NSString *format, ...#>)
    
    if( fromInterfaceOrientation == UIInterfaceOrientationPortrait||
       fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
        NSLog(@"fromInterfaceOrientation == UIInterfaceOrientationPortrait");
    }else{
        w=768.000000;
        h=1004.000000;
    }
    if([[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationPortrait ||
       [[UIApplication sharedApplication] statusBarOrientation]==UIInterfaceOrientationMaskPortraitUpsideDown){
        NSLog(@"vertical");
        //        CGFloat temp = w;

    }else{
        
    }
    //    CGPoint point = CGPointMake(1, 1);
    //    [self.tmrkLogoLabel convertPoint:point fromView:nil];
    //    NSLog(@"%f",point.x);
    //    self.tmrkLogoLabel.center = self.view.center;
    
    //    325
    //    105
    
    
//    CGPoint centerPoint = CGPointMake(
//                                      w/2,
//                                      h/2);
//    self.tmrkLogoLabel.center = centerPoint;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"LoginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UITextField *loginField = (UITextField *)[cell viewWithTag:100];
    UIImageView *image = (UIImage *)[cell viewWithTag:101];
    if(indexPath.row==0){
        loginField.placeholder=@"Username";
    }else if(indexPath.row==1){
        loginField.placeholder=@"Domain";
    }
    else{
        loginField.placeholder=@"Password";
        image.hidden=false;
    }
    cell.textLabel.text=@"";
    return cell;
}


@end
