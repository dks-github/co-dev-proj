//
//  ViewController.m
//  proto_01
//
//  Created by DKS on 2014/08/18.
//  Copyright (c) 2014年 DKS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/*ボタンやラベルを定義*/
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

/* 実際の動作を定義*/
@implementation ViewController

/*アプリが読み込まれたら実行するメソッッド(関数) */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.purposeTextbox.delegate = self;

    
    /*setDateFormate はyyyy/MM/dd ですよ、と定義*/
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
/*    self.toDay.text = [formatter stringFromDate:[NSDate date]]; */
    
    /*　目標の日付ラベル、目標の日付ラベルはsetDateFromat(=yyyy/MM/DD) 形式で定義*/
    self.date.text = [formatter stringFromDate:[NSDate date]];
    self.toDate.text = [formatter stringFromDate:[NSDate date]];
    
    /*計算結果については、0 を代入*/
    self.calcDate.text =  @"0";



    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* テキストフィールドで、リターンキーが押されたら、の処理 */
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    /*↑の関数と併せて、「リターン押されたら、編集終了？　YES」となる。
     つまり、キーボードを下げる処理がこれで完成*/
    [self.view endEditing:YES];
    /* テキストフィールドの内容を、ラベルmyPurpose に代入*/
    self.myPurpose.text = self.purposeTextbox.text;
    return NO;
}

/*日数計算  デートピッカーで日付が選ばれた契機で処理が走る*/
- (IBAction)dateCalc:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    /*目標の日付を、toDate にテキストとして代入(ストリングスに変換して代入)*/
    self.toDate.text = [formatter stringFromDate:sender.date];
    
    /*siceDate に今日の日付を一旦代入 (日付形式のまま)*/
    NSDate *sinceDate = [formatter dateFromString:self.date.text];
    
    /*timeIntervalSinceDate　機能をつかって、sinceDateと目標の間の日数計算*/
    NSTimeInterval secs = [sender.date timeIntervalSinceDate:sinceDate];
    
    /*numDays を使って秒単位の計算から日単位の計算に*/
    NSInteger numDays = round(secs/(60*60*24));
    
    /* calcDate ラベルに計算で得られた日数を代入 */
    self.calcDate.text = [NSString stringWithFormat:@"%d",numDays];
    
}
@end
