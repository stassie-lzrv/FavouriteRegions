//
//  ObservableWrapper.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation

@propertyWrapper
final class Observable<Value> {
    private var onTodoItemsChange: ((Value) -> Void)? = nil
    
    var wrappedValue: Value {
        didSet {
            onTodoItemsChange?(wrappedValue)
        }
    }
    
    var projectedValue: Observable<Value> {
        return self
    }
        
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    func bind(action: @escaping (Value) -> Void) {
        self.onTodoItemsChange = action
    }
}
