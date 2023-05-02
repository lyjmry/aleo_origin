// galactic_explorer.leo

// 定义卡片稀有度
pub enum Rarity {
    Common,
    Rare,
    Epic,
    Legendary,
}

// 定义卡片类型
pub struct EggCard {
    pub id: usize,
    pub card_type: String,
    pub rarity: Rarity,
    pub used: bool,
}

// 定义天体结构体
pub struct CelestialBody {
    pub id: usize,
    pub name: String,
    pub kind: String,
    pub energy: u32,
    pub mass: f64,
    pub radius: f64,
}

// 定义星系结构体
pub struct Galaxy {
    pub nfts: Vec<CelestialBody>,
    pub cards: Vec<EggCard>,
    pub currency: u32,
}

// 计算两个天体间的引力关系
function calculate_gravitational_force(body1: &CelestialBody, body2: &CelestialBody) -> f64 {
    const G: f64 = 6.67430e-11;
    let distance = (body1.radius + body2.radius).powf(2.0);
    (G * body1.mass * body2.mass) / distance
}

// 购买卡片
function purchase_card(galaxy: &mut Galaxy, card: EggCard) {
    let price = match card.rarity {
        Rarity::Common => 10,
        Rarity::Rare => 50,
        Rarity::Epic => 100,
        Rarity::Legendary => 200,
    };

    if galaxy.currency >= price {
        galaxy.cards.push(card);
        galaxy.currency -= price;
    } else {
        println!("货币不足，无法购买卡片");
    }
}

// 出售卡片
function sell_card(galaxy: &mut Galaxy, card_index: usize) {
    let price = match galaxy.cards[card_index].rarity {
        Rarity::Common => 5,
        Rarity::Rare => 25,
        Rarity::Epic => 50,
        Rarity::Legendary => 100,
    };

    galaxy.currency += price;
    galaxy.cards.remove(card_index);
}

// 使用卡片
function use_card(galaxy: &mut Galaxy, card_index: usize) {
    let card = &mut galaxy.cards[card_index];

    if !card.used {
        match &card.card_type[..] {
            "黑洞卡" => {
                // 实现黑洞卡逻辑
            }
            "逃逸卡" => {
                // 实现逃逸卡逻辑
            }
            "隐秘卡" => {
                // 实现隐秘卡逻辑
            }
            "探测卡" => {
                // 实现探测卡逻辑
            }
            _ => {
                println!("未知卡片类型");
            }
        }

        card.used = true;
    } else {
        println!("卡片已被使用");
    }
}
