//
//  CBRParser.m
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 30.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import "CBRParser.h"

typedef enum : NSUInteger {
    CBRParserInProgressUnknow,
    CBRParserInProgressCharCode,
    CBRParserInProgressNominal,
    CBRParserInProgressValue,
} CBRParserInProgress;


@interface CBRParser()

@property (strong, nonatomic, readwrite) NSXMLParser *parser;
@property (strong, nonatomic) NSMutableDictionary *result;
@property (strong, nonatomic) NSString *charCode;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *nominal;

@property(nonatomic) CBRParserInProgress currentState;


@end


@implementation CBRParser

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:kCBRURL]];
        self.parser.delegate = self;
        self.result = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    switch (self.currentState) {
        case CBRParserInProgressCharCode:
            self.charCode = string;
            break;
        case CBRParserInProgressNominal:
            self.nominal = string;
            break;
        case CBRParserInProgressValue:
            self.value = string;
            break;
        default:
            break;
    }
    NSLog(@"-----%@", string);
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    if([elementName isEqualToString:@"CharCode"]){
        self.currentState = CBRParserInProgressCharCode;
    } else if ([elementName isEqualToString:@"Nominal"]){
        self.currentState = CBRParserInProgressNominal;
    } else if ([elementName isEqualToString:@"Value"]){
        self.currentState = CBRParserInProgressValue;
    } else {
        self.currentState = CBRParserInProgressUnknow;
    }
    NSLog(@"-----%@", elementName);
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if (self.currentState == CBRParserInProgressValue){
        NSInteger nominal = [self.nominal integerValue];
        double value = [[self.value stringByReplacingOccurrencesOfString:@"," withString:@"."] doubleValue];
        
        [self.result setObject:@(value/nominal) forKey:self.charCode];
    }
    self.currentState = CBRParserInProgressUnknow;
    NSLog(@"-----%@", elementName);
}


- (NSDictionary *) parse {
    [self.parser parse];
    return self.result;
}
@end
