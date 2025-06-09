//
//  ProductsCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//
import Foundation
struct ProductsCodeRU {
    var prefix: String
    var lower: String
    var products: [String]
    var code: String
    
    init(prefix: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        
        self.products = [
"""
{
  \(lower)_title: 'Грибной крем-суп',
  \(lower)_desc: 'Нежнейший и ароматный крем-суп, подается вместе с гренками',
  \(lower)_image: require('./images/\(lower)_1.png'),
},
""",
"""
{
  \(lower)_title: 'Грибной крем-суп',
  \(lower)_desc: 'Нежнейший и ароматный крем-суп, подается вместе с гренками',
  \(lower)_image: require('./images/\(lower)_1.png'),
},
""",
"""
{
  \(lower)_title: 'Бургер со свининой',
  \(lower)_desc: 'Подается с картофелем фри и соусом на выбор',
  \(lower)_image: require('./images/\(lower)_2.png'),
},
""",
"""
{
  \(lower)_title: 'Цыпленок табака',
  \(lower)_desc: 'Классический цыпленок табака, томленный в вишнево-мятном соусе',
  \(lower)_image: require('./images/\(lower)_3.png'),
},
""",
"""
{
  \(lower)_title: 'Суп “Морской бриз”',
  \(lower)_desc: 'Насыщенный ароматный суп с мидиями, креветками и кальмарами',
  \(lower)_image: require('./images/\(lower)_4.png'),
},
""",
"""
{
  \(lower)_title: 'Крем-брюле',
  \(lower)_desc: 'Сливочный нежный десерт со свежими ягодами',
  \(lower)_image: require('./images/\(lower)_5.png'),
},
""",
"""
{
  \(lower)_title: 'Веганский торт',
  \(lower)_desc: 'Без глютена на кокосовом молоке, с ароматной фисташкой',
  \(lower)_image: require('./images/\(lower)_6.png'),
},
""",
"""
{
  \(lower)_title: 'Манговый чиз',
  \(lower)_desc: 'Ароматный легкий десерт, с нотками мяты и манго',
  \(lower)_image: require('./images/\(lower)_7.png'),
},
""",
"""
{
  \(lower)_title: 'Бананы в темпуре',
  \(lower)_desc: 'Низкокалорийный десерт, покрытый темным шоколадом',
  \(lower)_image: require('./images/\(lower)_8.png'),
},
""",
"""
{
  \(lower)_title: 'Лимонад',
  \(lower)_desc: 'Освежающий  ароматный лимонад',
  \(lower)_image: require('./images/\(lower)_9.png'),
},
""",
"""
{
  \(lower)_title: 'Авторские чаи',
  \(lower)_desc: 'Цитрусовый/Облепиховый/Молочный/Мятный',
  \(lower)_image: require('./images/\(lower)_10.png'),
},
""",
"""
{
  \(lower)_title: 'Молочный коктейль',
  \(lower)_desc: 'В составе - молоко, мороженое, кофейный сироп.',
  \(lower)_image: require('./images/\(lower)_11.png'),
},
""",
"""
{
  \(lower)_title: 'Бамбл',
  \(lower)_desc: 'Холодный напиток на основе апельсинового сока и эспрессо',
  \(lower)_image: require('./images/\(lower)_12.png'),
},
""",
"""
{
  \(lower)_title: 'Цыпленок табака',
  \(lower)_desc: ' со сливочным соусом из лесных грибов',
  \(lower)_image: require('./images/\(lower)_13.png'),
},
""",
"""
{
  \(lower)_title: 'Свиной стейк',
  \(lower)_desc: 'с морковным соусом и микрозеленью',
  \(lower)_image: require('./images/\(lower)_14.png'),
},
""",
"""
{
  \(lower)_title: 'Стейк из лосося',
  \(lower)_desc: 'с томатами,спаржей,на картофельной подушке',
  \(lower)_image: require('./images/\(lower)_15.png'),
},
""",
"""
{
  \(lower)_title: 'Стейк из телятины',
  \(lower)_desc: 'сделанный на гриле, с розмарином и соусом на выбор',
  \(lower)_image: require('./images/\(lower)_16.png'),
},
""",
"""
{
  \(lower)_title: 'Дорадо',
  \(lower)_desc: 'в кисло-сладком соусе с овощами',
  \(lower)_image: require('./images/\(lower)_17.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с теплым лососем',
  \(lower)_desc: 'с сулугуни, апельсином, и зеленью',
  \(lower)_image: require('./images/\(lower)_18.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с жареным камамбером ',
  \(lower)_desc: 'клубникой,и микрозеленью',
  \(lower)_image: require('./images/\(lower)_19.png'),
},
""",
"""
{
  \(lower)_title: 'Греческий салат',
  \(lower)_desc: 'с творожным сыром и бальзамическим соусом',
  \(lower)_image: require('./images/\(lower)_20.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с прошутто и грушей',
  \(lower)_desc: 'с хрустящми гренками и базиликом',
  \(lower)_image: require('./images/\(lower)_21.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с телятиной ',
  \(lower)_desc: 'с ягодами и кисло-сладким соусом',
  \(lower)_image: require('./images/\(lower)_22.png'),
},
""",
"""
{
  \(lower)_title: 'Фисташковое парфе',
  \(lower)_desc: 'с ягодами и мятой',
  \(lower)_image: require('./images/\(lower)_23.png'),
},
""",
"""
{
  \(lower)_title: 'Бельгийские вафли',
  \(lower)_desc: 'со сливочным мороженым',
  \(lower)_image: require('./images/\(lower)_24.png'),
},
""",
"""
{
  \(lower)_title: 'Красный бархат',
  \(lower)_desc: 'с вишневой начинкой и шоколадом',
  \(lower)_image: require('./images/\(lower)_25.png'),
},
""",
"""
{
  \(lower)_title: 'Медовик ягодный',
  \(lower)_desc: 'в сливочном креме, с сезонными ягодами',
  \(lower)_image: require('./images/\(lower)_26.png'),
},
""",
"""
{
  \(lower)_title: 'Мильфей',
  \(lower)_desc: 'карамельно-сливочный, со свежими ягодами',
  \(lower)_image: require('./images/\(lower)_27.png'),
},
""",
"""
{
  \(lower)_title: 'Боул вегатерианский',
  \(lower)_desc: 'батат,авокадо,шпинат, капуста цветная,спаржа, капуста краснокочанная помидор ',
  \(lower)_image: require('./images/\(lower)_28.png'),
},
""",
"""
{
  \(lower)_title: 'Боул с курицей и авокадо',
  \(lower)_desc: 'курица,авокадо,морковь,лук,нут',
  \(lower)_image: require('./images/\(lower)_29.png'),
},
""",
"""
{
  \(lower)_title: 'Цезарь',
  \(lower)_desc: 'салат айсберг,курица,пармезан,черри',
  \(lower)_image: require('./images/\(lower)_30.png'),
},
""",
"""
{
  \(lower)_title: 'Салат закусочный',
  \(lower)_desc: 'авокадо,микрозелень,свекла,томаты,шпинат',
  \(lower)_image: require('./images/\(lower)_31.png'),
},
""",
"""
{
  \(lower)_title: 'Куриный рулет с овощами',
  \(lower)_desc: 'куриное филе, микс овощей, кисло-сладкий соус, кунжут',
  \(lower)_image: require('./images/\(lower)_32.png'),
},
""",
"""
{
  \(lower)_title: 'Утиная грудка на тыквенной подушке',
  \(lower)_desc: 'утка, тыква, зелень, бальзамический соус',
  \(lower)_image: require('./images/\(lower)_33.png'),
},
""",
"""
{
  \(lower)_title: 'Телятина в соусе карри',
  \(lower)_desc: 'телятина, грибы, соус карри, зелень',
  \(lower)_image: require('./images/\(lower)_34.png'),
},
""",
"""
{
  \(lower)_title: 'Лосось запеченный',
  \(lower)_desc: 'лосось, лимонный сок, томаты',
  \(lower)_image: require('./images/\(lower)_35.png'),
},
""",
"""
{
  \(lower)_title: 'Тыквенный мусс',
  \(lower)_desc: 'тыква, сезонные ягоды, ягодный сироп',
  \(lower)_image: require('./images/\(lower)_36.png'),
},
""",
"""
{
  \(lower)_title: 'Десерт “Рафаэлло”',
  \(lower)_desc: 'бисквит,сливочный крем, кокосовая стружка',
  \(lower)_image: require('./images/\(lower)_37.png'),
},
""",
"""
{
  \(lower)_title: 'Шоколадные маффины',
  \(lower)_desc: 'маффин, с крем-чизом и ягодами',
  \(lower)_image: require('./images/\(lower)_38.png'),
},
""",
"""
{
  \(lower)_title: 'Торт “Ежевичный вечер”',
  \(lower)_desc: 'мусс из ягод ежевики и  вишни,  со сливочным кремом',
  \(lower)_image: require('./images/\(lower)_39.png'),
},
""",
"""
{
  \(lower)_title: 'Коктейль “Беллини”',
  \(lower)_desc: 'вино игристое, персиковое пюре',
  \(lower)_image: require('./images/\(lower)_40.png'),
},
""",
"""
{
  \(lower)_title: 'Коктейль “Кровавая Мэри”',
  \(lower)_desc: 'водка, томатный сок, сельдерей, лед',
  \(lower)_image: require('./images/\(lower)_41.png'),
},
""",
"""
{
  \(lower)_title: 'Коктейль “Виски-кола”',
  \(lower)_desc: 'виски, кола, лимон, лед',
  \(lower)_image: require('./images/\(lower)_42.png'),
},
""",
"""
{
  \(lower)_title: 'Коктейль “Дайкири”',
  \(lower)_desc: 'белый ром, лайм, сахарный сироп',
  \(lower)_image: require('./images/\(lower)_43.png'),
},
""",
"""
{
  \(lower)_title: 'Стейк из свинины ',
  \(lower)_desc: 'запеченный на гриле стейк в сочетании с кукурузой и спаржей',
  \(lower)_image: require('./images/\(lower)_44.png'),
},
""",
"""
{
  \(lower)_title: 'Цыплята в остром соусе',
  \(lower)_desc: 'подаются на овощах с микрозеленью',
  \(lower)_image: require('./images/\(lower)_45.png'),
},
""",
"""
{
  \(lower)_title: 'Крем-суп с грибами',
  \(lower)_desc: 'сливочно-грибной насыщенный вкус',
  \(lower)_image: require('./images/\(lower)_46.png'),
},
""",
"""
{
  \(lower)_title: 'Паста 4 сыра',
  \(lower)_desc: 'сливочная паста с сырами: гауда, пармезан, с голубой плесенью, горгонзолла',
  \(lower)_image: require('./images/\(lower)_47.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с куриной грудкой',
  \(lower)_desc: 'заправленный йогуртовым соусом с черникой и листьями салата',
  \(lower)_image: require('./images/\(lower)_48.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Грезы”',
  \(lower)_desc: 'сыр фета, маслины, томаты, апельсин, семена льна, оливковое масло',
  \(lower)_image: require('./images/\(lower)_49.png'),
},
""",
"""
{
  \(lower)_title: 'Салат с уткой и морковью',
  \(lower)_desc: 'подается с базиликом и бальзамическим соусом',
  \(lower)_image: require('./images/\(lower)_50.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Оливия”',
  \(lower)_desc: 'телятина, кукуруза, руккола, соевый соус, моцарелла',
  \(lower)_image: require('./images/\(lower)_51.png'),
},
""",
"""
{
  \(lower)_title: 'Восточные трубочки',
  \(lower)_desc: 'в ассортименте начинки: фисташка, сливочная, шоколадная',
  \(lower)_image: require('./images/\(lower)_52.png'),
},
""",
"""
{
  \(lower)_title: 'Ягодный бриз',
  \(lower)_desc: 'хрустящее шоколадное пироженое, украшенное ягодами и мятой',
  \(lower)_image: require('./images/\(lower)_53.png'),
},
""",
"""
{
  \(lower)_title: 'Сырники “по-домашнему”',
  \(lower)_desc: 'нежнейшие сырники с ягодами,сгущенкой и миндальными хлопьями',
  \(lower)_image: require('./images/\(lower)_54.png'),
},
""",
"""
{
  \(lower)_title: 'Медовик сметанный',
  \(lower)_desc: 'ароматный мягкий десерт, с натуральным медом',
  \(lower)_image: require('./images/\(lower)_55.png'),
},
""",
"""
{
  \(lower)_title: 'Боул с фасолью',
  \(lower)_desc: 'фасоль, морковь, курица, лук, семена кунжута',
  \(lower)_image: require('./images/\(lower)_56.png'),
},
""",
"""
{
  \(lower)_title: 'Креветки Гуакомоле',
  \(lower)_desc: 'креветки на гриле в сочетании с мексиканским соусом',
  \(lower)_image: require('./images/\(lower)_57.png'),
},
""",
"""
{
  \(lower)_title: 'Филе трески ',
  \(lower)_desc: 'нежная закуска, подающаяся с чесночным соусом и микрозеленью',
  \(lower)_image: require('./images/\(lower)_58.png'),
},
""",
"""
{
  \(lower)_title: 'Рулетики из лосося',
  \(lower)_desc: 'с овощами на гриле',
  \(lower)_image: require('./images/\(lower)_59.png'),
},
""",
"""
{
  \(lower)_title: 'Рапаны в сливочном соусе',
  \(lower)_desc: 'с добавлением чеснока и черри',
  \(lower)_image: require('./images/\(lower)_60.png'),
},
""",
"""
{
  \(lower)_title: 'Мидии в чесночном соусе',
  \(lower)_desc: 'с добавлением вина',
  \(lower)_image: require('./images/\(lower)_61.png'),
},
""",
"""
{
  \(lower)_title: 'Сковородка с бараниной',
  \(lower)_desc: 'с овощами и кисло-сладким соусом',
  \(lower)_image: require('./images/\(lower)_62.png'),
},
""",
"""
{
  \(lower)_title: 'Сковородка с курицей',
  \(lower)_desc: 'с овощами в сливках',
  \(lower)_image: require('./images/\(lower)_63.png'),
},
""",
"""
{
  \(lower)_title: 'Бефстроганоф из говядины',
  \(lower)_desc: 'с томатной заливкой и овощами',
  \(lower)_image: require('./images/\(lower)_64.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Морской коктейль”',
  \(lower)_desc: 'креветки, кальмары,рапаны,мидии',
  \(lower)_image: require('./images/\(lower)_65.png'),
},
""",
"""
{
  \(lower)_title: 'Цезарь с семгой',
  \(lower)_desc: 'семга, салат, пармезан, сухарики',
  \(lower)_image: require('./images/\(lower)_66.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Нисуаз”',
  \(lower)_desc: 'тунец, болгарский перец, яйца, помидоры',
  \(lower)_image: require('./images/\(lower)_67.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Бостон”',
  \(lower)_desc: 'грудка в кляре. мандарин,салат, гранат',
  \(lower)_image: require('./images/\(lower)_68.png'),
},
""",
"""
{
  \(lower)_title: 'Салат “Корейский”',
  \(lower)_desc: 'морковь,маслины,лук,курица,зелень',
  \(lower)_image: require('./images/\(lower)_69.png'),
},
""",
"""
{
  \(lower)_title: 'Сулугуни в панировке',
  \(lower)_desc: 'с томатным соусом',
  \(lower)_image: require('./images/\(lower)_70.png'),
},
""",
"""
{
  \(lower)_title: 'Сырная тарелка',
  \(lower)_desc: 'с 4 видами сыров и виноградом',
  \(lower)_image: require('./images/\(lower)_71.png'),
},
""",
"""
{
  \(lower)_title: 'Мясная тарелка',
  \(lower)_desc: 'с 4 видами колбасы и мяса и оливками',
  \(lower)_image: require('./images/\(lower)_72.png'),
},
""",
"""
{
  \(lower)_title: 'Мини-закуски в ассортименте',
  \(lower)_desc: 'мясная, рыбная, сырная начинка',
  \(lower)_image: require('./images/\(lower)_73.png'),
},
""",
"""
{
  \(lower)_title: 'Брускетты “3 моря”',
  \(lower)_desc: 'с лососем, креветкой,и мидиями',
  \(lower)_image: require('./images/\(lower)_74.png'),
},
""",
"""
{
  \(lower)_title: 'Лавандовый раФ',
  \(lower)_desc: 'сливки, лавандовый сироп, пюре из мандарина',
  \(lower)_image: require('./images/\(lower)_75.png'),
},
""",
"""
{
  \(lower)_title: 'Сливочно-медовый латте',
  \(lower)_desc: 'молоко, сливки, медовый сироп',
  \(lower)_image: require('./images/\(lower)_76.png'),
},
""",
"""
{
  \(lower)_title: 'Карамельный капучино',
  \(lower)_desc: 'молоко,кармаельный сироп, трюфельные маршмеллоу',
  \(lower)_image: require('./images/\(lower)_77.png'),
},
""",
"""
{
  \(lower)_title: 'Йогуртовый капучино',
  \(lower)_desc: 'сливки, сироп “йогурт, шоколадная присыпка',
  \(lower)_image: require('./images/\(lower)_78.png'),
},
""",
"""
{
  \(lower)_title: 'Латте с бананом и шоколадом',
  \(lower)_desc: 'молоко, банановый сироп, шоколад,орехи',
  \(lower)_image: require('./images/\(lower)_79.png'),
},
""",
"""
{
  \(lower)_title: 'Звездный Ролл',
  \(lower)_desc: 'Классический калифорнийский ролл с крабом, авокадо и огурцом, украшенный икрой тобико.',
  \(lower)_image: require('./images/\(lower)_80.png'),
},
""",
"""
{
  \(lower)_title: 'Голливудский Гламур',
  \(lower)_desc: 'Угорь, сливочный сыр и перец чили, завернутые в рис и нори, све рху обжаренный лосось.',
  \(lower)_image: require('./images/\(lower)_81.png'),
},
""",
"""
{
  \(lower)_title: 'Кинематографический Сюрприз',
  \(lower)_desc: 'Спайси тунец с манго и авокадо, украшенный соусом унаги.',
  \(lower)_image: require('./images/\(lower)_82.png'),
},
""",
"""
{
  \(lower)_title: 'Оскаровский Оливье',
  \(lower)_desc: 'Ролл с копченым лососем, огурцом и сливочным сыром, посыпанный свежим укропом.',
  \(lower)_image: require('./images/\(lower)_83.png'),
},
""",
"""
{
  \(lower)_title: 'Прожекторный Пирайя',
  \(lower)_desc: 'Ролл с тигровыми креветками и огурцом, покрытый тонкими ломтиками авокадо.',
  \(lower)_image: require('./images/\(lower)_84.png'),
},
""",
"""
{
  \(lower)_title: 'Сценарный Сочет',
  \(lower)_desc: 'Ролл с копченым угрем и огурцом, покрытый рисом и икрой масаго.',
  \(lower)_image: require('./images/\(lower)_85.png'),
},
""",
"""
{
  \(lower)_title: 'Экранная Элегия',
  \(lower)_desc: 'Тунец, лосось и авокадо, обернутые в кунжутный лист',
  \(lower)_image: require('./images/\(lower)_86.png'),
},
""",
"""
{
  \(lower)_title: 'Режиссерский Резонанс',
  \(lower)_desc: 'Креветка темпура, авокадо и спайси соус, украшенный кунжутом.',
  \(lower)_image: require('./images/\(lower)_87.png'),
},
""",
"""
{
  \(lower)_title: 'Премьерный Праздник',
  \(lower)_desc: 'Сочетание лосося, тунца и авокадо, завернутое в соевый лист',
  \(lower)_image: require('./images/\(lower)_88.png'),
},
""",
"""
{
  \(lower)_title: 'Актерский Ассорти',
  \(lower)_desc: 'Набор из пяти разных нигири: лосось, тунец, угорь, креветка и краб',
  \(lower)_image: require('./images/\(lower)_89.png'),
},
""",
"""
{
  \(lower)_title: 'Голливудский Гармония',
  \(lower)_desc: 'Салат из свежих листьев шпината, кусочков клубники, голубого сыра ',
  \(lower)_image: require('./images/\(lower)_90.png'),
},
""",
"""
{
  \(lower)_title: 'Кинозвездный Каприз',
  \(lower)_desc: 'Классический салат Капрезе с помидорами, моцареллой ',
  \(lower)_image: require('./images/\(lower)_91.png'),
},
""",
"""
{
  \(lower)_title: 'Премьерный Пикник',
  \(lower)_desc: 'Салат из киноа, черного боба, кукурузы, красного перца и зеленого лука',
  \(lower)_image: require('./images/\(lower)_92.png'),
},
""",
"""
{
  \(lower)_title: 'Экранная Экзотика',
  \(lower)_desc: 'Тайский салат с креветками, лапшой, морковью, огурцом и кинзой',
  \(lower)_image: require('./images/\(lower)_93.png'),
},
""",
"""
{
  \(lower)_title: 'Фестиваль Фантазия',
  \(lower)_desc: 'Салат Цезарь с куриной грудкой, пармезаном, сухариками и классической Цезарь-заправкой.',
  \(lower)_image: require('./images/\(lower)_94.png'),
},
""",
"""
{
  \(lower)_title: 'Голливудский Гурман',
  \(lower)_desc: 'Крем-суп из белых грибов с добавлением трав и сливок, подается с хрустящими гренками',
  \(lower)_image: require('./images/\(lower)_95.png'),
},
""",
"""
{
  \(lower)_title: 'Режиссерский Рататуй',
  \(lower)_desc: 'Пикантный томатный суп с ассорти из свежих овощей, включая баклажаны, перец и кабачки',
  \(lower)_image: require('./images/\(lower)_96.png'),
},
""",
"""
{
  \(lower)_title: 'Кинематографический Консоме',
  \(lower)_desc: 'Прозрачный куриный бульон с легкими овощами и тонко нарезанным куринным филе',
  \(lower)_image: require('./images/\(lower)_97.png'),
},
""",
"""
{
  \(lower)_title: 'Сценарный Солянка',
  \(lower)_desc: 'Насыщенный мясной суп с копчеными и свежими мясными ингредиентами, оливками, каперсами и лимоном',
  \(lower)_image: require('./images/\(lower)_98.png'),
},
""",
"""
{
  \(lower)_title: 'Премьер-Похлебка',
  \(lower)_desc: 'Традиционный гороховый суп с копченостями, морковью, картофелем и луком',
  \(lower)_image: require('./images/\(lower)_99.png'),
},
""",
"""
{
  \(lower)_title: 'Лапша Карбонара',
  \(lower)_desc: 'Лапша пшеничная удон,бекон,сливки,пармезан, чеснок',
  \(lower)_image: require('./images/\(lower)_100.png'),
},
""",
"""
{
  \(lower)_title: 'Лапша с курицей',
  \(lower)_desc: 'Лапша Хурасаме, куриное филе, болгарский перец, фасоль',
  \(lower)_image: require('./images/\(lower)_101.png'),
},
""",
"""
{
  \(lower)_title: 'Лапша Удон',
  \(lower)_desc: 'Лапша удон, мидии, кальмары, креветки тигровые',
  \(lower)_image: require('./images/\(lower)_102.png'),
},
""",
"""
{
  \(lower)_title: 'Лапша Рисовая',
  \(lower)_desc: 'лук порей, соус устричный, соус совый, чеснок, имбирь',
  \(lower)_image: require('./images/\(lower)_103.png'),
},
""",
"""
{
  \(lower)_title: 'Классический Сет',
  \(lower)_desc: 'Комбинация традиционных суши и маки, включая нигири с лососем',
  \(lower)_image: require('./images/\(lower)_104.png'),
},
""",
"""
{
  \(lower)_title: 'Вегетарианский Сет',
  \(lower)_desc: 'Ассорти вегетарианских суши с авокадо, огурцом, сладким перцем',
  \(lower)_image: require('./images/\(lower)_105.png'),
},
""",
"""
{
  \(lower)_title: 'Фьюжн Сет',
  \(lower)_desc: 'Креативный микс суши с необычными сочетаниями',
  \(lower)_image: require('./images/\(lower)_106.png'),
},
""",
"""
{
  \(lower)_title: 'Спайси Сет',
  \(lower)_desc: 'Острые суши и роллы с добавлением чили',
  \(lower)_image: require('./images/\(lower)_107.png'),
},
""",
"""
{
  \(lower)_title: 'Зеленый Дракон',
  \(lower)_desc: ' Ролл с начинкой из угря и огурца, покрытый ломтиками авокадо',
  \(lower)_image: require('./images/\(lower)_108.png'),
},
""",
"""
{
  \(lower)_title: 'Огненный Дракон',
  \(lower)_desc: 'Острый ролл с тунцом, авокадо и сливочным сыром внутри',
  \(lower)_image: require('./images/\(lower)_109.png'),
},
""",
"""
{
  \(lower)_title: 'Золотой Дракон',
  \(lower)_desc: ' Экзотический ролл с креветкой темпура и манго внутри',
  \(lower)_image: require('./images/\(lower)_110.png'),
},
""",
"""
{
  \(lower)_title: 'Ледяной Дракон',
  \(lower)_desc: 'Ролл с начинкой из краба и огурца, покрытый ломтиками гребешка',
  \(lower)_image: require('./images/\(lower)_111.png'),
},
""",
"""
{
  \(lower)_title: 'С Лососем и Авокадо',
  \(lower)_desc: 'Увеличенные роллы с нежным лососем, сыром и авокадо.',
  \(lower)_image: require('./images/\(lower)_112.png'),
},
""",
"""
{
  \(lower)_title: 'С Угрем',
  \(lower)_desc: 'Классическая Филадельфия с добавлением копченого угря',
  \(lower)_image: require('./images/\(lower)_113.png'),
},
""",
"""
{
  \(lower)_title: 'Тройной Лосось',
  \(lower)_desc: 'Роскошные роллы с тройным лососем – внутри',
  \(lower)_image: require('./images/\(lower)_114.png'),
},
""",
"""
{
  \(lower)_title: 'С Креветкой Темпура',
  \(lower)_desc: 'Сочетание хрустящей креветки темпура и сливочного сыра,',
  \(lower)_image: require('./images/\(lower)_115.png'),
},
""",
"""
{
  \(lower)_title: 'Ароматный Кофе',
  \(lower)_desc: 'Эспрессо, американо, капучино, латте.',
  \(lower)_image: require('./images/\(lower)_116.png'),
},
""",
"""
{
  \(lower)_title: 'Горячий Шоколад',
  \(lower)_desc: 'Классический горячий шоколад, подаваемый с взбитыми сливками и шоколадной стружкой.',
  \(lower)_image: require('./images/\(lower)_117.png'),
},
""",
"""
{
  \(lower)_title: 'Фреш-Напитки',
  \(lower)_desc: 'Свежевыжатые соки: апельсин, яблоко, грейпфрут.',
  \(lower)_image: require('./images/\(lower)_118.png'),
},
""",
"""
{
  \(lower)_title: 'Матча Латте',
  \(lower)_desc: 'Японский зеленый чай матча с молоком и легким сладким сиропом.',
  \(lower)_image: require('./images/\(lower)_119.png'),
},
""",
"""
{
  \(lower)_title: 'Торт "Лесная Ягода"',
  \(lower)_desc: 'Нежный бисквит с ягодным муссом и свежими ягодами.',
  \(lower)_image: require('./images/\(lower)_120.png'),
},
""",
"""
{
  \(lower)_title: 'Муссовый Торт "Манго"',
  \(lower)_desc: 'Легкий мусс с тропическими фруктами на бисквитной основе.',
  \(lower)_image: require('./images/\(lower)_121.png'),
},
""",
"""
{
  \(lower)_title: 'Торт "Павлова"',
  \(lower)_desc: 'Воздушная безе с взбитыми сливками и свежими ягодами.',
  \(lower)_image: require('./images/\(lower)_122.png'),
},
""",
"""
{
  \(lower)_title: 'Торт "Лимонный Рай"',
  \(lower)_desc: 'Песочное тесто с лимонным курдом и меренгой.',
  \(lower)_image: require('./images/\(lower)_123.png'),
},
""",
"""
{
  \(lower)_title: 'Наполеон',
  \(lower)_desc: 'Слоеный торт с нежным кремом, сбалансированный сладостью и легкой кислинкой.',
  \(lower)_image: require('./images/\(lower)_124.png'),
},
""",
"""
{
  \(lower)_title: 'Медовик',
  \(lower)_desc: 'Многослойный медовый торт с сливочным кремом, идеальный для любителей классики.',
  \(lower)_image: require('./images/\(lower)_125.png'),
},
""",
"""
{
  \(lower)_title: 'Шоколадный Торт',
  \(lower)_desc: 'Богатый и пышный торт с глубоким шоколадным вкусом и шоколадным кремом.',
  \(lower)_image: require('./images/\(lower)_126.png'),
},
""",
"""
{
  \(lower)_title: 'Тирамису',
  \(lower)_desc: 'Итальянский десерт с кофейно-ликерным пропитыванием и слоями сыра маскарпоне.',
  \(lower)_image: require('./images/\(lower)_127.png'),
},
""",
"""
{
  \(lower)_title: 'МакарУн',
  \(lower)_desc: 'Разнообразие вкусов и цветов, от клубники до соленой карамели.',
  \(lower)_image: require('./images/\(lower)_128.png'),
},
""",
"""
{
  \(lower)_title: 'Эклеры',
  \(lower)_desc: 'Классические эклеры с ванильным кремом, покрыты шоколадной глазурью.',
  \(lower)_image: require('./images/\(lower)_129.png'),
},
""",
"""
{
  \(lower)_title: 'Капкейки',
  \(lower)_desc: 'Мини-тортики с разнообразными вкусами и креативным декором.',
  \(lower)_image: require('./images/\(lower)_130.png'),
},
""",
"""
{
  \(lower)_title: 'Трюфели',
  \(lower)_desc: 'Шоколадные трюфели с различными начинками, от виски до малины. ',
  \(lower)_image: require('./images/\(lower)_131.png'),
},
""",
"""
{
  \(lower)_title: 'Устрицы на льду с лимоном',
  \(lower)_desc: 'Свежие устрицы, подаваемые на льду с дольками лимона и табаско.',
  \(lower)_image: require('./images/\(lower)_132.png'),
},
""",
"""
{
  \(lower)_title: 'Тартар из тунца с авокадо',
  \(lower)_desc: 'Изысканный тартар из свежего тунца с кусочками авокадо, заправленный оливковым маслом.',
  \(lower)_image: require('./images/\(lower)_133.png'),
},
""",
"""
{
  \(lower)_title: 'Карпаччо из лосося',
  \(lower)_desc: 'Тонко нарезанный лосось, подаётся с каперсами, оливковым маслом и лимоном.',
  \(lower)_image: require('./images/\(lower)_134.png'),
},
""",
"""
{
  \(lower)_title: 'Креветки в чесночном масле',
  \(lower)_desc: 'Жареные креветки в ароматном чесночном масле с добавлением петрушки.',
  \(lower)_image: require('./images/\(lower)_135.png'),
},
""",
"""
{
  \(lower)_title: 'Суп из морских гребешков',
  \(lower)_desc: 'Нежный крем-суп из морских гребешков, подается с легким сливочным соусом.',
  \(lower)_image: require('./images/\(lower)_136.png'),
},
""",
"""
{
  \(lower)_title: 'Буйабес',
  \(lower)_desc: 'Традиционный французский рыбный суп с морепродуктами и ароматными травами.',
  \(lower)_image: require('./images/\(lower)_137.png'),
},
""",
"""
{
  \(lower)_title: 'Паста с морепродуктами',
  \(lower)_desc: 'Паста аль денте с ассорти из морепродуктов в легком томатном соусе.',
  \(lower)_image: require('./images/\(lower)_138.png'),
},
""",
"""
{
  \(lower)_title: 'Ризотто с креветками',
  \(lower)_desc: 'Кремовое ризотто с ароматным шафраном и сочными креветками.',
  \(lower)_image: require('./images/\(lower)_139.png'),
},
""",
"""
{
  \(lower)_title: 'Лобстер Термидор',
  \(lower)_desc: 'Изысканный лобстер, запеченный с сыром и мускатным орехом.',
  \(lower)_image: require('./images/\(lower)_140.png'),
},
""",
"""
{
  \(lower)_title: 'Стейк из тунца с овощами',
  \(lower)_desc: 'Жареный стейк из тунца, подается с гриль-овощами.',
  \(lower)_image: require('./images/\(lower)_141.png'),
},
""",
"""
{
  \(lower)_title: 'Жареный морской окунь',
  \(lower)_desc: 'Жареный морской окунь, подается с нежным картофельным пюре и зеленым соусом.',
  \(lower)_image: require('./images/\(lower)_142.png'),
},
""",
"""
{
  \(lower)_title: 'Сорбет из лайма и базилика',
  \(lower)_desc: 'Освежающий сорбет из лайма с нотками базилика.',
  \(lower)_image: require('./images/\(lower)_143.png'),
},
""",
"""
{
  \(lower)_title: 'Тирамису с водорослями',
  \(lower)_desc: 'Необычное тирамису с добавлением морских водорослей.',
  \(lower)_image: require('./images/\(lower)_144.png'),
},
""",
"""
{
  \(lower)_title: 'Мусс из белого шоколада',
  \(lower)_desc: 'Нежный мусс из белого шоколада, подается с малиновым соусом.',
  \(lower)_image: require('./images/\(lower)_145.png'),
},
""",
"""
{
  \(lower)_title: 'Шоколадный тарт с солью',
  \(lower)_desc: 'Насыщенный шоколадный тарт с тонким акцентом морской соли, подчеркивающим глубину вкуса шоколада.',
  \(lower)_image: require('./images/\(lower)_146.png'),
},
""",
"""
{
  \(lower)_title: 'Профитроли с кремом',
  \(lower)_desc: 'Миниатюрные профитроли, наполненные нежным кремом из морской бузины, подаются со сладким соусом.',
  \(lower)_image: require('./images/\(lower)_147.png'),
},
""",
"""
{
  \(lower)_title: 'Фруктовое ассорти',
  \(lower)_desc: 'Ассорти из свежих экзотических фруктов, подаётся с натуральным медом и мятой для освежающего вкуса.',
  \(lower)_image: require('./images/\(lower)_148.png'),
},
""",
"""
{
  \(lower)_title: 'Коктейль «Морской бриз»',
  \(lower)_desc: 'Освежающий коктейль с нотками цитруса и клюквы, идеально подходит для подчеркивания вкуса морепродуктов.',
  \(lower)_image: require('./images/\(lower)_149.png'),
},
""",
"""
{
  \(lower)_title: 'Белое вино',
  \(lower)_desc: 'Подборка легких и ароматных белых вин, идеально сочетающихся с блюдами из морепродуктов.',
  \(lower)_image: require('./images/\(lower)_150.png'),
},
""",
"""
{
  \(lower)_title: 'Чай с морскими травами',
  \(lower)_desc: 'Успокаивающий и освежающий чай с добавлением морских трав и лимонного сока.',
  \(lower)_image: require('./images/\(lower)_151.png'),
},
""",
"""
{
  \(lower)_title: 'Английский Завтрак',
  \(lower)_desc: 'Яйца, соус чеддар, фасоль, шпинат',
  \(lower)_image: require('./images/\(lower)_152.png'),
},
""",
"""
{
  \(lower)_title: 'Сырники',
  \(lower)_desc: 'Творог, яйцо, клубника, курага',
  \(lower)_image: require('./images/\(lower)_153.png'),
},
""",
"""
{
  \(lower)_title: 'Драник с лососем',
  \(lower)_desc: 'Картофель, мука, лосось, соус ',
  \(lower)_image: require('./images/\(lower)_154.png'),
},
""",
"""
{
  \(lower)_title: 'Вафля с яйцом пашот',
  \(lower)_desc: 'Яйцо, огурец, авокадо, микс салата',
  \(lower)_image: require('./images/\(lower)_155.png'),
},
""",
"""
{
  \(lower)_title: 'Томатный суп',
  \(lower)_desc: 'Пюре из оматов, сливки, базилик',
  \(lower)_image: require('./images/\(lower)_156.png'),
},
""",
"""
{
  \(lower)_title: 'Тыквенный крем-суп',
  \(lower)_desc: 'Пюре из тыквы с добавлением корицы',
  \(lower)_image: require('./images/\(lower)_157.png'),
},
""",
"""
{
  \(lower)_title: 'Стейк Рибай',
  \(lower)_desc: 'Жареный на грилле стейк с тимьяном',
  \(lower)_image: require('./images/\(lower)_.png'),
},
""",
"""
{
  \(lower)_title: 'Рататуй',
  \(lower)_desc: 'Баклажан, цукини и томат',
  \(lower)_image: require('./images/\(lower)_159.png'),
},
""",
"""
{
  \(lower)_title: 'Фуа-гра',
  \(lower)_desc: 'Паштет из гусятной печени',
  \(lower)_image: require('./images/\(lower)_160.png'),
},
""",
"""
{
  \(lower)_title: 'Тартар из тунца',
  \(lower)_desc: 'Сырой тунец с авокадо',
  \(lower)_image: require('./images/\(lower)_161.png'),
},
""",
"""
{
  \(lower)_title: 'Салат "Нисуаз"',
  \(lower)_desc: 'унец, яйца, свежие огурцы, анчоусы',
  \(lower)_image: require('./images/\(lower)_162.png'),
},
""",
"""
{
  \(lower)_title: 'Филе миньон',
  \(lower)_desc: 'Мраморное мясо на косточке',
  \(lower)_image: require('./images/\(lower)_163.png'),
},
""",
"""
{
  \(lower)_title: 'Тартар из говядины',
  \(lower)_desc: 'Изысканный тартар из свежей говядины, подаваемый с тостами и каперсами.',
  \(lower)_image: require('./images/\(lower)_164.png'),
},
""",
"""
{
  \(lower)_title: 'Французский плато',
  \(lower)_desc: 'Ассорти из классических французских сыров с грецкими орехами и медом.',
  \(lower)_image: require('./images/\(lower)_165.png'),
},
""",
"""
{
  \(lower)_title: 'Греческий салат',
  \(lower)_desc: 'Свежие овощи с фетой и оливковым маслом, приправленный орегано.',
  \(lower)_image: require('./images/\(lower)_166.png'),
},
""",
"""
{
  \(lower)_title: 'Карпаччо из лосося',
  \(lower)_desc: 'Тонко нарезанный лосось, подаваемый с рукколой, лимоном и пармезаном.',
  \(lower)_image: require('./images/\(lower)_167.png'),
},
""",
"""
{
  \(lower)_title: 'Крокеты с трюфелями',
  \(lower)_desc: 'Хрустящие крокеты, наполненные трюфельным кремом.',
  \(lower)_image: require('./images/\(lower)_168.png'),
},
""",
"""
{
  \(lower)_title: 'Французский луковый суп',
  \(lower)_desc: 'Насыщенный суп с карамелизированным луком, подаваемый с сыром.',
  \(lower)_image: require('./images/\(lower)_169.png'),
},
""",
"""
{
  \(lower)_title: 'Биск из креветок',
  \(lower)_desc: 'Кремовый суп с креветками и сливками, подается с петрушкой.',
  \(lower)_image: require('./images/\(lower)_170.png'),
},
""",
"""
{
  \(lower)_title: 'Испанский гаспачо',
  \(lower)_desc: 'Холодный томатный суп с огурцом, перцем и чесноком.',
  \(lower)_image: require('./images/\(lower)_171.png'),
},
""",
"""
{
  \(lower)_title: 'Итальянский минестроне',
  \(lower)_desc: 'Овощной суп с бобами, пастой и томатным бульоном.',
  \(lower)_image: require('./images/\(lower)_172.png'),
},
""",
"""
{
  \(lower)_title: 'Гуляш по-венгерски',
  \(lower)_desc: 'Насыщенный говяжий суп с паприкой и картофелем.',
  \(lower)_image: require('./images/\(lower)_173.png'),
},
""",
"""
{
  \(lower)_title: 'Крем-суп из белых грибов',
  \(lower)_desc: 'Нежный суп из белых грибов с добавлением сливок и тимьяна.',
  \(lower)_image: require('./images/\(lower)_174.png'),
},
""",
"""
{
  \(lower)_title: 'Итальянская лазанья',
  \(lower)_desc: 'Слои мясного соуса болоньезе, сыра и листов лазаньи, запеченные до корочки.',
  \(lower)_image: require('./images/\(lower)_175.png'),
},
""",
"""
{
  \(lower)_title: 'Испанская паэлья',
  \(lower)_desc: 'Рисовое блюдо с морепродуктами, курицей и хоризо.',
  \(lower)_image: require('./images/\(lower)_176.png'),
},
""",
"""
{
  \(lower)_title: 'Бельгийские мидии ',
  \(lower)_desc: 'Мидии, тушеные в белом вине с чесноком, луком и сливками.',
  \(lower)_image: require('./images/\(lower)_177.png'),
},
""",
"""
{
  \(lower)_title: 'Французская утка а лоранж',
  \(lower)_desc: 'Жареная утка с апельсиновым соусом и гарниром из картофеля.',
  \(lower)_image: require('./images/\(lower)_178.png'),
},
""",
"""
{
  \(lower)_title: 'Немецкая свиная рулька',
  \(lower)_desc: 'Медленно тушеная свиная рулька, подаваемая с квашеной капустой.',
  \(lower)_image: require('./images/\(lower)_179.png'),
},
""",
"""
{
  \(lower)_title: 'Греческий мусака',
  \(lower)_desc: 'Слоеное блюдо из баклажанов, фарша и бешамельного соуса.',
  \(lower)_image: require('./images/\(lower)_180.png'),
},
""",
"""
{
  \(lower)_title: 'Испанский чуррос',
  \(lower)_desc: 'Хрустящие палочки из золотистого теста, подаваемые с горячим шоколадным соусом.',
  \(lower)_image: require('./images/\(lower)_181.png'),
},
""",
"""
{
  \(lower)_title: 'Греческий йогурт с медом',
  \(lower)_desc: 'Натуральный греческий йогурт, подаваемый с медом и смесью орехов.',
  \(lower)_image: require('./images/\(lower)_182.png'),
},
""",
"""
{
  \(lower)_title: 'Немецкий штрудель с яблоками',
  \(lower)_desc: 'Тонкое тесто, наполненное сладкими яблоками, изюмом и корицей.',
  \(lower)_image: require('./images/\(lower)_183.png'),
},
"""
        ]
        
        
        self.code = "const \(lower)Products = [\n" +
        products[Helper.shared.randomProducts[0]] + "\n" +
        products[Helper.shared.randomProducts[1]] + "\n" +
        products[Helper.shared.randomProducts[2]] + "\n" +
        products[Helper.shared.randomProducts[3]] + "\n" +
        products[Helper.shared.randomProducts[4]] + "\n" +
        products[Helper.shared.randomProducts[5]] + "\n" +
        products[Helper.shared.randomProducts[6]] + "\n" +
        products[Helper.shared.randomProducts[7]] + "\n" +
        products[Helper.shared.randomProducts[8]] + "\n" +
        products[Helper.shared.randomProducts[9]] + "\n]\n" +
        "export default \(lower)Products"
    }
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
