//
//  ViewController.m
//  proto_01
//
//  Created by DKS on 2014/08/18.
//  Copyright (c) 2014年 DKS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeLabel;
@property (weak, nonatomic) IBOutlet UITextField *purposeTextbox;
@property (weak, nonatomic) IBOutlet UILabel *limitLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectDate;
@property (weak, nonatomic) IBOutlet UILabel *myPurpose;
@property (weak, nonatomic) IBOutlet UILabel *toDate;
@property (weak, nonatomic) IBOutlet UILabel *leftDate;
@property (weak, nonatomic) IBOutlet UILabel *calcDate;
- (IBAction)dateCalc:(UIDatePicker *)sender;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *todayLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.purposeTextbox.delegate = self;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
/*    self.toDay.text = [formatter stringFromDate:[NSDate date]]; */
    
    /*　今日の日付ラベル　目標の日付ラベル、目標の日付ラベルも、NSDate 形式で定義*/
    self.date.text = [formatter stringFromDate:[NSDate date]];
    self.toDate.text = [formatter stringFromDate:[NSDate date]];
    self.calcDate.text =  @"0";



    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    self.myPurpose.text = self.purposeTextbox.text;
    return NO;
}

- (IBAction)dateCalc:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    self.toDate.text = [formatter stringFromDate:sender.date];
    
    NSDate *sinceDate = [formatter dateFromString:self.date.text];
    
    NSTimeInterval secs = [sender.date timeIntervalSinceDate:sinceDate];
    
    NSInteger numDays = round(secs/(60*60*24));
    
    self.calcDate.text = [NSString stringWithFormat:@"%d",numDays];
    
}
@end
