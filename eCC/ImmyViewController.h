//
//  ImmyViewController.h
//  eCC
//
//  Created by Imran Raja on 12/06/2013.
//  Copyright (c) 2013 Imran Raja. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface ImmyViewController : UIViewController <UITextFieldDelegate>

{
	IBOutlet	UITextField	*textField1;
	IBOutlet	UITextField	*textField2;
	IBOutlet	UITextField	*textField3;
	IBOutlet	UITextField	*textField4;
	IBOutlet	UITextField	*textField5;
	IBOutlet	UITextField	*textField6;
	
	CGFloat				 animatedDistance;
}
@property (strong, nonatomic) IBOutlet UILabel *labeltest;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;


@property (weak, nonatomic) IBOutlet UILabel *ltest;
@property (nonatomic, retain) IBOutlet	UITextField	*textField1;
@property (nonatomic, retain) IBOutlet	UITextField	*textField2;
@property (nonatomic, retain) IBOutlet	UITextField	*textField3;
@property (nonatomic, retain) IBOutlet	UITextField	*textField4;
@property (nonatomic, retain) IBOutlet	UITextField	*textField5;
@property (nonatomic, retain) IBOutlet	UITextField	*textField6;


//- (IBAction) textFieldReturn:(id)sender;

- (IBAction) dismissKeyboard:(id)sender;
- (IBAction)resetAllFeilds:(UIButton *)sender;
- (IBAction)calculateCost:(UIButton *)sender;
-(IBAction)updateMytex:(id)sender;
@end