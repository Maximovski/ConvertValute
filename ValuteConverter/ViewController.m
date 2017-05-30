//
//  ViewController.m
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 18.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import "ViewController.h"
#import "textFieldDelegate.h"
#import "pickerTextFieldDelegate.h"
#import "CBRParser.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fromValuteTextField;
@property (weak, nonatomic) IBOutlet UITextField *toValuteTextField;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *pickerTextField;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *toolbarTextField;

@property (weak, nonatomic) IBOutlet UITextField *fromValue;
@property (weak, nonatomic) IBOutlet UITextField *toValue;


@property (strong, nonatomic) textFieldDelegate *toolBarDelegate;
@property (strong, nonatomic) pickerTextFieldDelegate *pickerDelegate;


@property (strong, nonatomic) NSMutableArray *valutes;
@property (weak, nonatomic) UITextField *editingTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CBRParser *p = [[CBRParser alloc] init];
    NSDictionary *result = [p parse];
    self.valutes = [[NSMutableArray alloc] init];
    [self.valutes addObjectsFromArray:[result allKeys]];
    
    self.toolBarDelegate = [[textFieldDelegate alloc]initWithDelegate:self];
    self.pickerDelegate = [[pickerTextFieldDelegate alloc]initWithDelegate:self];
    
    for (UITextField *textField in self.pickerTextField){
        textField.delegate = self.pickerDelegate;
    }
    for (UITextField *textField in self.toolbarTextField){
        textField.delegate = self.toolBarDelegate;
    }
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)onClickDone{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.valutes.count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[NSAttributedString alloc] initWithString:self.valutes[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.editingTextField.text = self.valutes[row];
    
    
}
- (void)textField:(UITextField *)textField willStartEditingByDelegate:(textFieldDelegate *)delegate{
    self.editingTextField = textField;
}

@end
