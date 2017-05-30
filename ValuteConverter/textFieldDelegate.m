//
//  textFieldDelegate.m
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 25.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import "textFieldDelegate.h"

@implementation textFieldDelegate

- (instancetype)initWithDelegate:(id<DoneProtocol, UIPickerViewDelegate, UIPickerViewDataSource>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"ХВАТИТ!"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(onClickDone:)];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                   target:nil
                                                                                   action:nil];
    
    toolBar.items = @[flexibleSpace, doneItem];
    [toolBar sizeToFit];
    
    textField.inputAccessoryView = toolBar;
    

    return YES;

}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self.delegate textField:textField willStartEditingByDelegate:self];
}

-(void)onClickDone:(id)sender{
    [self.delegate onClickDone];
}

@end
