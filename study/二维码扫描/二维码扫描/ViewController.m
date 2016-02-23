//
//  ViewController.m
//  二维码扫描
//
//  Created by 王振 on 16/1/27.
//  Copyright © 2016年 王振. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property(nonatomic, strong)AVCaptureDevice *device;
@property(nonatomic, strong)AVCaptureDeviceInput *input;
@property(nonatomic, strong)AVCaptureMetadataOutput *output;
@property(nonatomic, strong)AVCaptureSession *session;
@property(nonatomic, strong)AVCaptureVideoPreviewLayer *preview;
@end
#define KscreenH [UIScreen mainScreen].bounds.size.height
#define KscreenW [UIScreen mainScreen].bounds.size.width

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //input
    
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    
    //output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];

//    [_output setRectOfInterest:CGRectMake((124)/KscreenH,((KscreenW-220)/2)/KscreenW,220/KscreenH,220/KscreenW)];
    
    
    //session
    _session = [[AVCaptureSession alloc]init];
    [_session
     setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input]) {
        [_session addInput:self.input];
    }
    if ([_session canAddOutput:self.output]) {
        [_session addOutput:self.output];
    }
    
    _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
    
    //preview
    _preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
//    _preview.frame = self.view.layer.bounds;
    _preview.frame = CGRectMake(50, 100, self.view.layer.bounds.size.width-100, self.view.layer.bounds.size.width-100);
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    //start
    [_session startRunning];
}
#pragma mark "AVCaptureMetadataOutputObjectsDelegate"
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    NSString *stringValue;
    if (metadataObjects.count>0) {
        [_session stopRunning];
        
        AVMetadataMachineReadableCodeObject *metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        
        NSLog(@"%@",stringValue);
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
