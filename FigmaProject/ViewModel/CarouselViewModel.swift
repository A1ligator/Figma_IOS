import Foundation

@Observable
class CarouselViewModel {
    var currentIndex = 0
    var items: [CarouselModel] = [
        .init(title: "Возврат назад",
              subtitle: "Активно свайпал и пропустил пару? Не расстраивайся - одна кнопка вернет соулмейта в ленту",
              imageName: "sub1",
              colorName: "ellipse1"),
        .init(title: "Расширенные фильтры",
              subtitle: "Подберем идеального партнера по нужным параметрам",
              imageName: "sub2",
              colorName: "ellipse2"),
        .init(title: "Режим Невидимка",
              subtitle: "Выбирай режим видимости своего профиля, скрывай свои данные и анонимно заходи на чужие страницы",
              imageName: "sub3",
              colorName: "ellipse3"),
        .init(title: "Выделяйся",
              subtitle: "Привлеки больше внимания с помощью динамичной аватарки и иконки premium",
              imageName: "sub4",
              colorName: "ellipse4"),
        .init(title: "Сила AI",
              subtitle: "Не трать время на бесконечные свайпы, доверь поиск идеального партнера AI",
              imageName: "sub5",
              colorName: "ellipse5"),
        .init(title: "Расширенная статистика",
              subtitle: "Узнай, кому ты нравишься",
              imageName: "sub6",
              colorName: "ellipse6"),
        .init(title: "Общайся без ограничений",
              subtitle: "Просматривай анкеты и пиши сообщения всем пользователям",
              imageName: "sub7",
              colorName: "ellipse7")
    ]
    
    var currentItem: CarouselModel { items[currentIndex] }
    
}
