//
//  ImmyViewController.m
//  eCC
//
//  Created by Imran Raja on 12/06/2013.
//  Copyright (c) 2013 Imran Raja. All rights reserved.
//
#import "ImmyViewController.h"

@interface ImmyViewController ()

@end
@implementation ImmyViewController


@synthesize labeltest;
@synthesize ltest;
@synthesize textField1;
@synthesize textField2;
@synthesize textField3;
@synthesize textField4;
@synthesize textField5;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize textField6;
@synthesize label6;


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField1 resignFirstResponder];
	[textField2 resignFirstResponder];
	[textField3 resignFirstResponder];
	[textField4 resignFirstResponder];
	return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.textField1.delegate = self;
	self.textField2.delegate = self;
	self.textField3.delegate = self;
	self.textField4.delegate = self;
	self.textField5.delegate = self;
	self.textField6.delegate = self;
	
	self.textField5.enabled = NO;
	
	self.label1.text = [NSString stringWithFormat:NSLocalizedString(@"Enter the amount you pay for 1 kilowatt per hour (kWh) of electricity", check)];
	
	self.label2.text = [NSString stringWithFormat:NSLocalizedString(@"Enter the wattage of the device", check)];// @"hello me apps"];
	self.label3.text = [NSString stringWithFormat:NSLocalizedString(@"Enter how many hours a day you wish to use it", check)];// @"hello me apps"];
	self.label4.text = [NSString stringWithFormat:NSLocalizedString(@"Enter how many days you wish to use it", check)];// @"hello me apps"];
	self.label5.text = [NSString stringWithFormat:NSLocalizedString(@"Total cost for running this device", check)];// @"hello me apps"];
	self.label6.text = [NSString stringWithFormat:NSLocalizedString(@"Enter the number of devices", check)];// @"hello me apps"];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	textField1.text = [defaults objectForKey:@"user_name"];
	textField6.text = [defaults objectForKey:@"devices"];
	[defaults synchronize];
	
	if (self.textField1) {
		
        NSNumberFormatter *nFormatter = [[NSNumberFormatter alloc] init];
        [nFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
        self.ltest.text = [nFormatter stringFromNumber:[NSNumber numberWithFloat: [self.textField1.text doubleValue] /100]];
		
		
	}
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(updateMytex:)
	 name:UIApplicationWillEnterForegroundNotification
	 object:nil];
	
}


-(IBAction)updateMytex:(id)sender{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults synchronize];
	
	textField1.text = [defaults objectForKey:@"user_name"];
	
	NSNumberFormatter *nFormatter = [[NSNumberFormatter alloc] init];
	
	[nFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	
	self.ltest.text = [nFormatter stringFromNumber:[NSNumber numberWithFloat: [self.textField1.text doubleValue] /100]];
	
	textField6.text = [defaults objectForKey:@"devices"];
	
}

- (IBAction) dismissKeyboard:(id)sender
{
	[textField1 resignFirstResponder];
	[textField2 resignFirstResponder];
	[textField3 resignFirstResponder];
	[textField4 resignFirstResponder];
	[textField5	resignFirstResponder];
	[textField6 resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






// This code handles the scrolling when tabbing through input fields
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 140;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
	CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
	CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
	CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	if (heightFraction < 0.0)
	{
		heightFraction = 0.0;
	}
	else if (heightFraction > 1.0)
	{
		heightFraction = 1.0;
	}
	UIInterfaceOrientation orientation =
	[[UIApplication sharedApplication] statusBarOrientation];
	if (orientation == UIInterfaceOrientationPortrait ||
		orientation == UIInterfaceOrientationPortraitUpsideDown)
	{
		animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
	}
	else
	{
		animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
	}
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y -= animatedDistance;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
	[UIView commitAnimations];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	self.textField1.text = [defaults objectForKey:@"user_name"];
	self.textField6.text = [defaults objectForKey:@"devices"];
	
}


//- (void)textFieldDidEndEditing:(UITextField *)textField
//{

//}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{    // First, create the text that will end up in the input field if you'll return YES:
	
	NSString *resultString = [textField.text stringByReplacingCharactersInRange:range withString:string];
	// Now, validate the text and return NO if you don't like what it'll contain.
	// You accomplish this by trying to convert it to a number and see if that worked.
	
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	NSNumber* resultingNumber = [numberFormatter numberFromString:resultString];
	
	//[numberFormatter release];
	
	return resultingNumber != nil;   }


- (void)textFieldDidEndEditing:(UITextField *)textField

{
	
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y += animatedDistance;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	[self.view setFrame:viewFrame];
	[UIView commitAnimations];
	
	
	if (textField == self.textField1) {
        NSNumberFormatter *nFormatter = [[NSNumberFormatter alloc] init];
        [nFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
        self.ltest.text = [nFormatter stringFromNumber:[NSNumber numberWithFloat: [self.textField1.text doubleValue] /100]];
		NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
		[defaults setObject:textField.text forKey:@"user_name"];
		
	}
	
	if (textField == self.textField6) {
		NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
		[defaults setObject:textField.text forKey:@"devices"];
		
		
		
	}
	
}


- (IBAction)calculateCost:(UIButton *)sender {
	
	
	NSString *rate = self.textField1.text;
	NSString *wat = self.textField2.text;
	
	NSString *device = self.textField6.text;
	
	NSString *hours = self.textField3.text;
	NSString *Days = self.textField4.text;
	
	double dnumb = [device doubleValue];
	double num1 = [rate doubleValue];
	double num2 = [wat doubleValue];
	double num3 = [hours doubleValue];
	double num4 = [Days doubleValue];
	
	
	num1 = num1 /100;
	double appKw = num2 / 1000;
	double costKwph = appKw *num1;
	costKwph = costKwph * dnumb;
	
	double tCost = ((num4 * num3) * costKwph);
	
	
	
	if (num2 == 0||  num1 <= 0.000|| num3 == 0 || num4 == 0) {
		self.textField5.text = 0;
		
		
		//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"oops" message:@"you must fill in all fields" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"oops",@"titleKey")
														message:NSLocalizedString(@"you must fill in all fields",@"messageKey")
													   delegate:self
											  cancelButtonTitle:NSLocalizedString(@"cancel",@"cancelKey")
											  otherButtonTitles:nil];
		
		
		[alert show];}
	//}else
	
	
	//	tCost ;
	
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	
	[numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
	[numberFormatter setMaximumFractionDigits:3];
	
	
	
	NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:tCost]];
	
	
	
	
	self.textField5.text = [NSString stringWithFormat:@"%@",numberAsString];
	//	self.textField5.text = [NSString stringWithFormat:NSLocalizedString(@"%@", numberAsString)];
	
	
}


- (IBAction)resetAllFeilds:(UIButton *)sender {
	self.textField1.text = 0;
	self.textField2.text = 0;
	self.textField3.text = 0;
	self.textField4.text = 0;
	self.textField5.text = 0;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]
	 
	 removeObserver: self
	 name: UIApplicationWillEnterForegroundNotification
	 object: nil];
	
}
@end