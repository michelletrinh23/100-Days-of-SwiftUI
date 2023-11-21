//
//  Order.swift
//  CupcakeCorner
//
//  Created by Michelle Trinh on 11/19/23.
//

import Foundation


class Order: ObservableObject, Codable {
    enum CodingKeys: String, CodingKey {
        case type, quantity, specialRequestEnabled, extraFrosting, addSprinkles, deliveryAddress, name, streetAddress, city, zip
    }
    
    static let deliveryAddressKey = "DeliveryAddress"
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var deliveryAddress: String = "" {
        didSet {
            saveDeliveryAddress()
        }
    }

    @Published var type = 0
    @Published var quantity = 3

    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
               zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2

        // complicated cakes cost more
        cost += (Decimal(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
    
    init() {
        if let savedAddress = UserDefaults.standard.string(forKey: Order.deliveryAddressKey) {
            self.deliveryAddress = savedAddress
        }
    }
    
    func saveDeliveryAddress() {
        UserDefaults.standard.set(deliveryAddress, forKey: Order.deliveryAddressKey)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        specialRequestEnabled = try container.decode(Bool.self, forKey: .specialRequestEnabled)
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        deliveryAddress = try container.decode(String.self, forKey: .deliveryAddress)
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(specialRequestEnabled, forKey: .specialRequestEnabled)
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        try container.encode(deliveryAddress, forKey: .deliveryAddress)
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
}

