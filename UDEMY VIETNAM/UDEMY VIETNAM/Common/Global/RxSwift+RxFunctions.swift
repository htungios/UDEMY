//
//  RxSwift+RxFunctions.swift
//
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import RxSwift

/**
 Returns Observable with sequence .Next, .Completed or .Error, similar to just but it uses global queue
 - Parameter closure: throwable closure which returns T
 - Returns: Observable T
 */
func myJustOnGlobalQueue<T>( closure:@autoclosure @escaping () throws -> T, dispose:(() -> ())? = nil) -> Observable<T>{
    return Observable.create({ observer -> Disposable in
        let globalQueue = DispatchQueue.global(qos: .userInitiated)
        globalQueue.async {
            do {
                observer.onNext(try closure())
                observer.onCompleted()
            }catch{
                observer.onError(error)
            }
        }
        
        if let dispose = dispose{
            return Disposables.create { dispose() }
        }
        return Disposables.create()
    })
}
