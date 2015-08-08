//
//  ViewController.m
//  HppleDemo
//
//  Created by Vytautas Galaunia on 11/25/14.
//
//

#import "ViewController.h"
#import "TFHpple.h"
//#define kUrl @"http://i.ifeng.com/news/news?aid=100390998&mid=40S5au"
//#define kUrl @"http://wap.ifeng.com/news.jsp?aid=100413083"
//#define kUrl @"http://wap.ifeng.com/news.jsp?aid=100411051"
//#define kUrl @"http://news.ifeng.com/a/20150807/44369090_0.shtml"
//#define kUrl @"http://wap.ifeng.com/news.jsp?aid=100398490"

#define kUrl @"http://world.chinadaily.com.cn/2015-08/07/content_21526897.htm"
@interface ViewController ()
{
    UITextView *_text;
    NSMutableString *_str;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _str = [[NSMutableString alloc]init];
    [self createTextView];
    [self parserHtml];
}
- (void)createTextView{
     _text= [[UITextView alloc]initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, self.view.frame.size.height-64)];
    _text.font = [UIFont systemFontOfSize:15];
    _text.editable = NO;
    [self.view addSubview:_text];
    
}

- (void)parserHtml{
    
    NSData *htmlData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:kUrl]];
    TFHpple *xpathParser = [[TFHpple alloc]initWithHTMLData:htmlData];

    NSArray *divArray = [xpathParser searchWithXPathQuery:@"//div[@class=\"arcBox\"]"];
    
    TFHppleElement *element = [divArray objectAtIndex:0];

    [_str appendString:[element content]];

    _text.text = _str;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
