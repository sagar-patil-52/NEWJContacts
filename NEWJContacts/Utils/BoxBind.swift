//
//  BoxBind.swift
//  KTCitySearch
//
//  Created by mmt on 19/06/21.
//

import Foundation

class BoxBind<T> {
    
    typealias Listener = (T) -> ()
    
    var value : T {
        didSet {
            listener?(value)
        }
    }
    
    var listener : Listener?
    init(value : T) {
        self.value = value
        listener?(value)
    }
    
    func bind(listener : Listener?) {
        self.listener = listener
        listener?(self.value)
    }
}
