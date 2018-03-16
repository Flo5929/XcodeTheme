//: Playground - noun: a place where people can play

import Foundation
struct Product {
    var name: String
    var price: Double
    
    func isAffordable(_ amount:Double) -> Bool {
        return self.price <= amount
    }
    func hasSamePrice(than product:Product) -> Bool {
        return product.price == self.price
    }
}
var wallet: Double = 2
var banana = Product(name: "Banana", price: 0.15)
var apple = Product(name: "Apple", price: 0.35)

var selectedProduct: Product?
if banana.isAffordable(wallet) {
    let message = String(format: "I can buy %@", banana.name)
    print(message)
}
if banana.hasSamePrice(than: apple) {
    print("I can buy a banana for the price on an Apple !")
}

if selectedProduct != nil {
    print("I've selected a product :D")
}



