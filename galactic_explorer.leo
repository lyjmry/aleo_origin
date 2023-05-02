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

// 创建天体
function create_celestial_body(name: String, kind: String, energy: u32, mass: f64, radius: f64) -> CelestialBody {
    let id = rand::random
// 创建星系
function create_galaxy() -> Galaxy {
    Galaxy {
        nfts: Vec::new(),
        cards: Vec::new(),
        currency: 0,
    }
}

// 向星系中添加天体
function add_celestial_body(galaxy: &mut Galaxy, body: CelestialBody) {
    galaxy.nfts.push(body);
}

// 从星系中移除天体
function remove_celestial_body(galaxy: &mut Galaxy, body_index: usize) {
    galaxy.nfts.remove(body_index);
}

// 显示星系中的天体列表
function list_celestial_bodies(galaxy: &Galaxy) {
    for body in &galaxy.nfts {
        println!("ID: {}, 名称: {}, 类型: {}, 能量: {}", body.id, body.name, body.kind, body.energy);
    }
}

// 显示玩家拥有的卡片列表
function list_cards(galaxy: &Galaxy) {
    for card in &galaxy.cards {
        println!("ID: {}, 类型: {}, 稀有度: {:?}", card.id, card.card_type, card.rarity);
    }
}

// 使用黑洞卡
function use_black_hole_card(galaxy: &mut Galaxy, card_index: usize, target_index: usize) -> bool {
    let card = &galaxy.cards[card_index];

    if card.card_type != CardType::BlackHole {
        return false;
    }

    let black_hole_energy = card.rarity as u32 * 100;
    let target_body = &galaxy.nfts[target_index];

    if target_body.energy <= black_hole_energy * 2 {
        remove_celestial_body(galaxy, target_index);
        return true;
    }

    false
}

// 使用逃逸卡
function use_escape_card(galaxy: &mut Galaxy, card_index: usize, target_index: usize) -> bool {
    let card = &galaxy.cards[card_index];

    if card.card_type != CardType::Escape {
        return false;
    }

    let escape_success_rate = card.rarity as u32 * 10;
    let random_number = generate_random_number(1, 100);

    if random_number <= escape_success_rate {
        remove_celestial_body(galaxy, target_index);
        return true;
    }

    false
}

// 使用探测卡
function use_detection_card(galaxy: &Galaxy, card_index: usize) -> Vec<usize> {
    let card = &galaxy.cards[card_index];

    if card.card_type != CardType::Detection {
        return Vec::new();
    }

    let mut black_holes: Vec<usize> = Vec::new();

    for (index, body) in galaxy.nfts.iter().enumerate() {
        if body.kind == CelestialBodyKind::BlackHole {
            black_holes.push(index);
        }
    }

    black_holes
}

// 使用隐匿卡
function use_stealth_card(galaxy: &mut Galaxy, card_index: usize, target_index: usize) -> bool {
    let card = &galaxy.cards[card_index];

    if card.card_type != CardType::Stealth {
        return false;
    }

    let stealth_duration = card.rarity as u32 * 10;
    let target_body = &mut galaxy.nfts[target_index];
    target_body.stealth_duration = stealth_duration;

    true
}

// 检查一个天体是否处于隐形状态
function is_stealthed(celestial_body: &CelestialBody) -> bool {
    celestial_body.stealth_duration > 0
}

// 逐渐减少所有天体的隐形时间
function decrease_stealth_durations(galaxy: &mut Galaxy) {
    for celestial_body in galaxy.nfts.iter_mut() {
        if celestial_body.stealth_duration > 0 {
            celestial_body.stealth_duration -= 1;
        }
    }
}
