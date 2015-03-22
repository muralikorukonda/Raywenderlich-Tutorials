//
//  ViewController.m
//  TipCalc
//
//  Created by Murali Korukonda on 6/5/14.
//  Copyright (c) 2014 Murali Korukonda. All rights reserved.
//

#import "ViewController.h"
#import "TipCalc.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *amountBeforeTaxTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *perPersonLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UISlider *taxSlider;
@property (weak, nonatomic) IBOutlet UISlider *personCountSlider;

@property (strong) TipCalc *tipCalc;
@property (strong) NSArray *textFields;
- (IBAction)tipPercentageChanged:(id)sender;
- (IBAction)taxPercentageChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipCalc = [[TipCalc alloc] initWithAmountBeforeTax:25.00 andTipPercentage:0.2 andTaxPercentage:0.1];
    self.amountBeforeTaxTextField.text = [NSString stringWithFormat:@"%0.2f",self.tipCalc.amountBeforeTax ];
    self.tipPercentageSlider.value =self.tipCalc.tipPercentage;
    self.taxSlider.value =self.tipCalc.taxPercentage;
    //self.tipPercentageTextField.text = [NSString stringWithFormat:@"%0.2f",self.tipCalc.tipPercentage];
    self.textFields = @[self.amountBeforeTaxTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)calcTip{
    self.tipCalc.tipPercentage = [self.tipPercentageSlider value];
    self.tipCalc.taxPercentage = [self.taxSlider value];
    self.tipCalc.amountBeforeTax =[self.amountBeforeTaxTextField.text floatValue];
    [self.tipCalc calculateTip];
    //self.resultLabel.text = [NSString stringWithFormat:@"Your tip: %0.2f.", self.tipCalc.tipAmount];
    
    self.resultLabel.text = [NSString stringWithFormat:@"Amount after tax: %0.2f Your tip:%0.2f Your total bill:%0.2f.", self.tipCalc.taxAmount,self.tipCalc.tipAmount,self.tipCalc.totalAmount];
    
    self.perPersonLabel.text = [NSString stringWithFormat:@"Amount per person:%0.2f.",self.tipCalc.totalAmount/self.personCountSlider.value];
    
}
- (IBAction)buttonTapped:(id)sender {
    [self calcTip];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    int i = [self.textFields indexOfObject:textField];
    if (i < [self.textFields count] - 1) {
        UITextField *nextTextField =
        self.textFields[i+1];
        [nextTextField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
        [self calcTip];
    }
    return TRUE;
}

- (IBAction)tipPercentageChanged:(id)sender {
    [self calcTip];
}

- (IBAction)taxPercentageChanged:(id)sender {
    [self calcTip];
}
@end
