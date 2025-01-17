
public struct Item: Equatable, Codable {
    var id: String
    var category: Category
    var name: String
    var ingredients: String
    var toppings: [Topping]
    var imageName: String
    var isHit: Bool
    var itemSize: ItemSize
    var isHeader: Bool

    public init(id: String, category: Category = .pizza, name: String, ingredients: String, toppings: [Topping] = [], imageName: String, itemSize: ItemSize, isHit: Bool = false, isHeader: Bool = false) {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.toppings = toppings
        self.imageName = imageName
        self.itemSize = itemSize
        self.isHit = isHit
        self.isHeader = isHeader
        self.category = category
    }

    func hasOneSize() -> Bool {
        itemSize.oneSize != nil
    }

    func getCorrectPrice() -> Int {
        let isOneSize = hasOneSize()
        let price = isOneSize ? getPrice(size: .oneSize) : getPrice(size: .medium)
        return price
    }

    func getCorrectSize() -> Size {
        let isOneSize = hasOneSize()
        let size: Size = isOneSize ? .oneSize : .medium
        return size
    }

    func getCorrectWeight() -> Int {
        let isOneSize = hasOneSize()
        let weight = isOneSize ? (itemSize.oneSize?.weight ?? 0) : (itemSize.medium?.weight ?? 0)
        return weight
    }

    func getCorrectDough() -> String? {
        if !hasOneSize() {
            let dough: Dough = .basic
            return dough.displayName
        } else {
            return nil
        }
    }

    func getPrice(size: Size) -> Int {
        let price =
            switch size {
            case .oneSize: itemSize.oneSize?.price
            case .small: itemSize.small?.price
            case .medium: itemSize.medium?.price
            case .large: itemSize.large?.price
            }
        return price ?? 0
    }

    func getWeight(size: Size) -> Int {
        let weight =
            switch size {
            case .oneSize: itemSize.oneSize?.weight
            case .small: itemSize.small?.weight
            case .medium: itemSize.medium?.weight
            case .large: itemSize.large?.weight
            }
        return weight ?? 0
    }
}
