//
//  SZSimpleTestViewController.swift
//  SZ_RxSwift_SimpleDemo
//
//  Created by yanl on 2018/2/8.
//  Copyright © 2018年 yanl. All rights reserved.
//

import UIKit
import RxSwift

class SZSimpleTestViewController: SZBaseViewController {

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "简单测试"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
//        testNever()
        
//        testEmpty()
        
//        testJust()
        
//        testOf()
        
//        testFrom()
        
//        testCreate()
        
//        testRange()
        
        testRepeatElement()
    }
}

/// MARK: - 私有方法
extension SZSimpleTestViewController {
    
    /*
     http://www.codertian.com/2016/11/27/RxSwift-ru-keng-ji-read-document/
     
     Observable和Observer
     理解了观察者模式这两个概念就很好理解了，Observable就是可被观察的，也就是我们说的宝宝，他也是事件源。而Observer就是我们的观察者，也就是当收到事件的时候去做某些处理的爸爸妈妈。观察者需要去订阅(subscribe)被观察者，才能收到Observable的事件通知消息。
     
     创建和订阅被观察者
     下面创建被观察者其实就是创建一个Obserable的sequence，就是创建一个流，然后就可以被订阅subscribe，这样被观察者发出事件消息，我们就能做相应的处理
     
     DisposeBag
     DisposeBag其实就相当于iOS中的ARC，会在适当的时候销毁观察者，相当于内存管理者吧。
     
     subscribe
     subscribe是订阅sequence发出的事件，比如next事件，error事件等。而subscribe(onNext:)是监听sequence发出的next事件中的element进行处理，他会忽略error和completed事件。相对应的还有subscribe(onError:) 和 subscribe(onCompleted:)
     */
    
    /*
     never
     
     never就是创建一个sequence，但是不发出任何事件信号。
     
     运行结果：不会打印任何东西
     */
    func testNever() {
        
//        let neverSequence = Observable<String>.never()
//
//        let neverSequenceSubscription
        
        Observable<String>.never().subscribe { _ in
            
            print("This will never be printed")
            
        }.disposed(by: disposeBag)
    }
    
    /*
     empty
     
     empty就是创建一个空的sequence,只能发出一个completed事件
     
     运行结果：completed
     */
    func testEmpty() {
        
        Observable<Int>.empty().subscribe { event in
            
            print(event)
            
        }.disposed(by: disposeBag)
    }
    
    /*
     just
     
     just是创建一个sequence只能发出一种特定的事件，能正常结束
     */
    func testJust() {
        
        Observable.just("RED").subscribe { (event) in
            
            print(event)
            
        }.disposed(by: disposeBag)
    }
    
    /*
     of
     
     of是创建一个sequence能发出很多种事件信号
     */
    func testOf() {

        /*
         打印结果；
         
         🐶
         🐱
         🐦
         🐻
         */
        Observable.of("🐶", "🐱", "🐦", "🐻").subscribe(onNext: { element in
            
            print(element)
            
        }).disposed(by: disposeBag)
        
        /*
         去掉onNext，结果会是这样子:
         
         next(🐶)
         next(🐱)
         next(🐦)
         next(🐻)
         completed
         
         也正好对应了我们subscribe中，subscribe只监听事件。
         */
        Observable.of("🐶", "🐱", "🐦", "🐻").subscribe { (event) in
            
            print(event)
            
        }.disposed(by: disposeBag)
    }
 
    /*
     from
     
     from就是从集合中创建sequence，例如数组，字典或者Set
     */
    func testFrom() {
        
        Observable.from(["🐶", "🐱", "🐦", "🐻"]).subscribe(onNext: {
            
            print($0)
            
        }).disposed(by: disposeBag)
    }
    
    /*
     create
     
     我们也可以自定义可观察的sequence，那就是使用create
     
     create操作符传入一个观察者observer，然后调用observer的onNext，onCompleted和onError方法。返回一个可观察的obserable序列。
     */
    func testCreate() {
        
        let myJust = { (element: String) -> Observable<String> in
            
            return Observable.create({ observe in
                
                observe.onNext(element)
                observe.onCompleted()
                
                return Disposables.create()
            })
        }
        
        myJust("RED").subscribe {
            
            print($0)
            
        }.disposed(by: disposeBag)
    }
    
    /*
     range
     
     range就是创建一个sequence，他会发出这个范围中的从开始到结束的所有事件
     */
    func testRange() {
        
        Observable.range(start: 1, count: 10).subscribe { event in
            
            print(event)
            
        }.disposed(by: disposeBag)
    }
    
    /*
     repeatElement
     
     创建一个sequence，发出特定的事件n次
     */
    func testRepeatElement() {
        
        Observable.repeatElement("RED").take(3).subscribe({ event in
            
            print(event)
            
        }).disposed(by: disposeBag)
        
        Observable.repeatElement("🔴")
            .take(3)
            .subscribe(onNext: {
                
                print($0)
                
            }).disposed(by: disposeBag)
    }
    
}























