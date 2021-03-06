-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.5.35-log - MySQL Community Server (GPL)
-- ОС Сервера:                   Win32
-- HeidiSQL Версия:              8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица vine.catalog
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`page_id`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.catalog: 4 rows
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
REPLACE INTO `catalog` (`id`, `page_id`, `date`, `name`, `status`) VALUES
	(1, 0, '0000-00-00 00:00:00', 'sdfsdf', 'active'),
	(2, 0, '0000-00-00 00:00:00', 'sdfsdfas', 'active'),
	(3, 0, '0000-00-00 00:00:00', 'dfsdfgsdfg', 'active'),
	(4, 0, '0000-00-00 00:00:00', 'sdfgsdfgsdf', 'active');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;


-- Дамп структуры для таблица vine.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.category: 3 rows
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`id`, `parent_id`) VALUES
	(22, 0),
	(28, 0),
	(36, 0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Дамп структуры для таблица vine.fields
CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `use_editor` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `length` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `module` (`module`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.fields: 0 rows
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;


-- Дамп структуры для таблица vine.goods
CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) DEFAULT NULL,
  `marker` enum('hot,','bestprice') DEFAULT NULL,
  `marker_color` enum('yellow','orange') DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.goods: 3 rows
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
REPLACE INTO `goods` (`id`, `catalog_id`, `marker`, `marker_color`, `price`, `old_price`, `name`, `category_id`) VALUES
	(1, NULL, NULL, NULL, 123, NULL, 'dfgd', '1'),
	(2, NULL, NULL, NULL, 1231, NULL, 'dfgsdfg', '1'),
	(3, NULL, NULL, NULL, 123, NULL, 'sdfg', '2');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;


-- Дамп структуры для таблица vine.lang
CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(255) DEFAULT NULL,
  `val` text,
  `parent_id` int(11) DEFAULT NULL,
  `module` varchar(255) DEFAULT 'site',
  `ln` varchar(3) DEFAULT 'ru',
  PRIMARY KEY (`id`),
  KEY `key` (`k`),
  KEY `pid` (`parent_id`),
  KEY `module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.lang: 31 rows
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
REPLACE INTO `lang` (`id`, `k`, `val`, `parent_id`, `module`, `ln`) VALUES
	(1, 'title', 'О компании', 1, 'pages', 'ru'),
	(2, 'text', 'Есть несколько подводных камней, которых следует остерегаться. До версии PHP 5.1.0, instanceof вызывал __autoload() если имя класса не существовало. Вдобавок, если класс не был загружен, происходила фатальная ошибка. Это можно было обойти с помощью динамической ссылки на класс или использования строковой переменной с именем класса:', 1, 'pages', 'ru'),
	(3, 'title', 'About', 1, 'pages', 'en'),
	(4, 'text', 'There are some pitfalls to watch out for. Prior to version PHP 5.1.0, instanceof caused __autoload () if the class name does not exist. In addition, if the class was not loaded, a fatal error occurs. This can be circumvented by using a dynamic reference to a class or using a string variable with the name of the class:', 1, 'pages', 'en'),
	(5, 'title', 'saa', 2, 'pages', 'ru'),
	(6, 'text', 'ad', 2, 'pages', 'ru'),
	(7, 'title', 'asd', 2, 'pages', 'en'),
	(8, 'text', 'asd', 2, 'pages', 'en'),
	(9, 'keyw', 'qqwerqwe', 1, 'pages', 'ru'),
	(10, 'desc', 'qwerqwer', 1, 'pages', 'ru'),
	(11, 'title', 'Главная страница сайта', 3, 'pages', 'ru'),
	(12, 'text', 'Это самая первая и самая главная страница сайта. Привет!', 3, 'pages', 'ru'),
	(13, 'title', 'Статьи', 4, 'articles', 'ru'),
	(14, 'text', NULL, 4, 'articles', 'ru'),
	(15, 'title', 'Насколько тенге защищены от подделки?', 5, 'article', 'ru'),
	(16, 'text', 'В этом году 15 ноября 2014 года тенге исполнился 21 год. За это время национальная валюта Казахстана пережила несколько девальваций и смену семи председателей Нацбанка РК. Менялся дизайн тенге, монеты сменяли бумажные купюры, а тиын практически вышли из обращения. Трансформация дизайна тенге происходила из-за объективных причин, одна из главных – повышение степени защиты, пишет деловой портал Kapital.kz.\r\n\r\nКак пояснили в Нацбанке РК, в настоящее время тенге имеет целый комплекс защитных элементов для населения, кассовых работников и экспертов. «Такие элементы вводятся на различных этапах производства банкнот: изготовление бумаги и специальной краски, использование определенной печати. На казахстанских банкнотах имеются степени защиты легко распознаваемые населением, при этом их очень сложно воспроизвести. Это такие элементы, как «Спарк», элемент, нанесенный цветопеременной краской, нити с цветопеременным эффектом, голограммы, высокорельевные изображения и многое другое. Казахстанские купюры являются одними из защищенных банкнот мира», - прокомментировал регулятор.\r\n\r\nКазахстанская памятная банкнота номиналом 1 000 тенге, посвященная тюркской письменности «Күлтегін», была признана «Лучшей банкнотой 2013 года» по версии международного банкнотного сообщества (IBNS). Она была отмечена, как самая красивая и защищенная банкнота. Эта банкнота была выпущена в обращение 12 декабря  2013 года с тиражом 10 млн. штук.\r\n\r\nВ число претендентов на звание лучшей банкноты 2013 года по версии IBNS попали: памятная олимпийская банкнота 100 рублей - Россия, пять реалов - Бразилия, 50 динаров – Ливия, 10 тысяч крон - Исландия, 100 долларов - США, 10 долларов – Канада, 100 долларов – Фиджи, 50 долларов Барбадос и 50 долларов – Соломоновы острова.\r\n\r\nНесмотря на несколько степеней защиты, тенге все-таки подделывают. В Нацбанке РК сообщили Kapital.kz, что филиалами банка на 1 октября было выявлено не менее 10 поддельных банкнот на 1 миллион банкнот в обращении. Как оказалось, чаще всего подделывают двухтысячную купюру. «Нацбанк РК фиксировал редкие случаи подделки банкнот всех номиналов: 200, 500, 1000, 2000, 5000 и 10000 тенге. Купюру в 2000 тенге подделывают чаще остальных, так как эта банкнота не очень крупного номинала и у населения часто является разменной купюрой. Поэтому, к сожалению, мало кто обращает внимание на подлинность купюр данного номинала. Были случаи, когда подделке подвергались монеты номиналом 20, 50 и 100 тенге», - сообщили в ведомстве.\r\n\r\nНесмотря на то, что в 2013 году было изъято в 2 раза меньше поддельных купюр, общая сумма таких купюр в прошлом году оказалась в разы выше, чем в 2012 году. Так, в 2013 году финансовые полицейские изъяли из теневого оборота 1 тыс. 524 фальшивых купюр на сумму более 7,1 млн тенге, в 2012 году - 3 тыс. 872 купюры на сумму свыше 16,8 млн тенге.\r\n\r\nНа вопрос журналиста Kapital.kz: «Планирует ли Нацбанк РК повышать степень защиты тенге?» в ведомстве ответили, что «работа по повышению степеней защиты тенге ведется планомерно». «Сначала выпускаются «домашние банкноты» для оценки возможности воспроизводства при массовой печати, затем новые защитные элементы тестируются на юбилейных и памятных банкнотах, а затем лучшие из защитных элементов используются в серийных банкнотах», - отметили в Нацбанке РК.\r\n\r\nМежду тем, выявить поддельные банкноты, порой, можно с первого взгляда. Прежде всего, необходимо внимательно посмотреть на купюру. Независимо от номинала, изображение на подлинной банкноте чистое и четкое, краска на отдельных частях банкноты не растекается. «Необходимо также проверить минимум три защитных элемента, она имеются на всех банкнотах тенге: водяные знаки в виде птицы самрук и номинала банкноты, совмещающиеся изображения, которые при просмотре на просвет составляют единое изображение и метки для людей с ослабленным зрением. Такие метки представляют собой  высокорельефные элементы, хорошо различимые на ощупь. Чем выше номинал, тем больше элементов защиты, степени защиты все сложнее», - подчеркнули в Нацбанке РК.\r\n\r\n20-ти тысячная купюра: быть или не быть?\r\n\r\nВ 2013 году активно обсуждался вопрос о возможном введении 20-ти тысячной купюры. Предполагалось, что эмиссия данной банкноты будет посвящена 20-летию введения тенге. В ноябре прошлого года глава Нацбанка РК Кайрат Келимбетов пояснил, что во второй половине 2014 года 20-тысячные банкноты будут эмитированы с нанесением его подписи. Через месяц, а именно в декабре 2013 года, регулятор поменял свою позицию. Тогда Кайрат Келимбетов заявил, что введение в обращение 20-ти тысячной банкноты откладывается из-за очень высоких девальвационных ожиданий населения.\r\n\r\nВпрочем, в феврале 2014 года девальвация тенге все-таки произошла. Правда, по заверениям Нацбанка РК, этому способствовали рыночные факторы. В результате цены на некоторые продукты питания, лекарства, бензин пошли вверх. Напряженная геополитическая ситуация между Россией и Украиной, санкции в отношении России оказывали давление на российский рубль и, соответственно, на тенге. Деловой портал Kapital.kz попытался узнать планы Нацбанка РК относительно эмиссии банкнот. «В среднесрочной перспективе выпуск купюр более высокого номинала не планируется. Выпуск банкноты номиналом 20 тыс. тенге должен быть связан с объективными потребностями экономики страны. На текущий момент такой потребности со стороны экономики не наблюдается», - пояснили в Нацбанке РК.\r\n\r\nЭмиссия банкнот достаточно затратный процесс для любого государства. К тому же по истечении времени купюры изнашиваются и их надо менять. Деловому порталу Kapital.kz не удалось выяснить примерную себестоимость эмиссии одной банкноты, такая информация конфиденциальна. В Нацбанке РК пояснили, что «ни один из эмитентов не выпускает наличные деньги дороже номинала».\r\n\r\nМежду тем, работа над 20-ти тысячной купюрой, несмотря на то что ее не эмитировали, уже оказалась затратна для государства. На нее было потрачено свыше 2 млрд тенге. Такие данные были озвучены главой Нацбанка РК в середине декабря 2013 года.\r\n\r\nВ начале года в СМИ обсуждалась информация о том, что состав монет поменялся. Регулятор дал подробные пояснения по этому поводу. «Металлы на мировом рынке ощутимо возросли в цене, и Нацбанк РК столкнулся со значительным увеличением себестоимости монет. В целях минимизации затрат мы стали заказывать монеты из стали, покрытые медно-никелевым сплавом. В настоящее время монеты номиналами 1, 5, 10 и 20 тенге изготовлены из стали, покрытой медно-никелевым сплавом. Данный способ производства циркуляционных, то есть не коллекционных монет, практикуется во многих странах мира», - отметили в ведомстве.  \r\nИсточник: http://money.gazeta.kz/news/naskolko-tenge-zashhishheny-ot-poddelki-newsID405972.html\r\nИспользование материалов допускается только при наличии гиперссылки на конкретную страницу сайта в первом абзаце и в конце публикации с указанием источника (медиа-портал Gazeta.kz, гиперссылка на страницу сайта). Использование скриншотов с видео, фотографий и иллюстраций запрещается без письменного разрешения редакции (cont@gazeta.kz)', 5, 'article', 'ru'),
	(17, 'title', 'Назарбаев обратился к народу с ежегодным Посланием', 6, 'article', 'ru'),
	(18, 'text', '«Ближайшие годы будут не очень легкими для нашей страны, по этой причине я хочу заранее, заблаговременно сейчас обратиться со своим посланием, что мы должны предпринять с нового года. Для того чтобы дать время для этого, я обращаюсь с посланием в конце года», - пояснил глава государства.\r\n«Сегодня, отвечая на вызовы, которые стоят перед нами, я объявляю о Новой Экономической Политике Казахстана «Нурлы Жол». Этому я посвящаю новое Послание народу на 2015 год. Она будет иметь контрцикличный характер и будет направлена на продолжение структурных реформ в нашей экономике», - сказал Президент.\r\n\r\nОсновная цель Новой Экономической Политики – противостояние Казахстана мировому экономическому и геополитическому кризису и преодоление трудностей в условиях нестабильности. «Я из своего опыта предчувствую, что ближайшие годы станут временем глобальных испытаний. Будет меняться вся архитектура мира. Достойно пройти через этот сложный этап смогут далеко не все страны. Этот рубеж перейдут только сильные государства, сплочённые народы. Казахстан, как часть мировой экономики и страна, которая находится в непосредственной близости к эпицентру геополитического напряжения, испытывает негативное влияние всех этих процессов», - сказал Президент.\r\n\r\nГлавным финансовым ресурсом этого периода Президент назвал Национальный Фонд, который был пополнен в предыдущие годы, когда общеэкономическая мировая ситуация была менее напряженной, а цены на природные ресурсы сохраняли стабильность. «Все эти годы доходы от добычи сырья и его продажи мы откладывали в этот Фонд. 10 миллиардов долларов мы направили на борьбу с кризисом 2007-2009-х годов. Остальные деньги мы не проели и не потратили, а сохранили и преумножили. Сейчас наступает тот самый период, когда мы должны использовать эти резервы. Они помогут преодолеть непростые времена и стимулировать рост нашей экономики. Эти ресурсы предназначены не для краткосрочных мер. Они будут направлены на дальнейшее преобразование экономики».\r\n\r\nГлавными сферами для усиленного развития ближайшего времени Президент называет транспортную, индустриальную, социальную и энергетическую, а также малый и средний бизнес.\r\n\r\nПослание содержит пять пунктов Программы «Нурлы Жол», в которых Президент ставит конкретные цели перед правительством и народом страны.\r\n1. Выделение дополнительных средств для льготного кредитования крупного предпринимательства и малого и среднего бизнеса.\r\n2. Оздоровление банковского сектора и выкуп «плохих» кредитов.\r\n3. Завершение строительства инфраструктуры специальных экономических зон «Хоргос - Восточные ворота» и «Национальный индустриальный нефтехимический технопарк» в Атырау и Таразе.\r\n4. Дополнительное кредитование строительства комплекса «ЭКСПО-2017».\r\n5. Усиление транспортной инфраструктуры Астаны в преддверии «ЭКСПО-2017» - в частности, путем увеличения потенциала столичного аэропорта – его пропускной способности, а также строительства нового терминала и реконструкции взлетно-посадочной полосы.\r\n\r\nТакже Президент объявил План инфраструктурного развития страны, который должен стать основой Новой Экономический Политики страны. Этот План рассчитан на 5 лет и  совпадает со второй пятилеткой реализации Программы ФИИР. Он состоит из семи пунктов:\r\n1. Развитие транспортно-логистической структуры, и прежде всего – реализация основных автодорожных проектов страны: Западный Китай - Западная Европа; Астана-Алматы; Астана-Усть-Каменогорск; Астана-Актобе-Атырау; Алматы - Усть-Каменогорск; Караганда - Жезказган - Кызылорда; Атырау-Астрахань. «Только за счёт строительства дорог будут созданы новые 200 тысяч рабочих мест», - говорит Президент. Также этот пункт включает продолжение строительства и развития морской инфраструктуры на западе Казахстана и логистического хаба на востоке страны.\r\n2. Развитие индустриальной инфраструктуры в стране. Завершение работы по формированию инфраструктуры в специальных экономических зонах и проработка вопроса строительства в регионах новых индустриальных зон, нацеленных на развитие производств МСБ. Особое внимание Президент призывает уделить инфраструктуре для туризма. Выполнение этого пункта создаст большое количество рабочих мест и, тем самым, будет способствовать повышению благосостояния казахстанцев, занятых в реализации описанных задач.\r\n3. Устранение дефицита электроэнергии в южных регионах страны путем строительства высоковольтных линий в направлениях «Экибастуз-Семей-Усть-Каменогорск» и «Семей-Актогай-Талдыкорган-Алматы», что сбалансирует энергообеспечение всех регионов страны.\r\n4. Модернизация инфраструктуры ЖКХ и сетей водо- и теплоснабжения.\r\n5. Пересмотр подхода к строительству арендного жилья, которое необходимо будет представлять населению в долгосрочную аренду с правом выкупа, напрямую, без посредников и под максимально низкие проценты за кредит, что снизит стоимость его приобретения.\r\n6. Развитие социальной инфраструктуры - решение проблем аварийных школ, трёхсменного обучения и нехватки детских садов. Усиление связи науки с отраслями экономики путем подготовки кадров в 10 определенных вузах страны.\r\n7. Поддержка малого и среднего бизнеса и деловой активности граждан. Дальнейшее развитие МСБ, увеличение его доли до 50% ВВП к 2050 году.\r\n\r\nДля достижения обозначенных целей и реализации задач Президент распорядился выделять ежегодно в течение 3 лет (2015-2017 гг.) до 3 млрд долларов из Национального Фонда Республики, подчеркнул важность эффективного использования всех выделяемых средств. Особую ответственность за выполнение Программы Президент возложил на акимов, а также на партию «Нур Отан». Контроль за исполнением планов Президент возложил на специально созданную им комиссию.\r\nПрезидент пообещал не снижать размер зарплат и пенсий. «Мы можем выйти из кризисного периода, а кризисы долго не бывают, как известно, может быть, два, может быть - три года, может, пять лет. Это поможет нам пройти его - не снизить пенсии, заработные платы, может быть, мы увеличивать не сможем, но зато мы сохраним то, что у нас есть», - сказал президент.\r\n\r\n«В следующем году мы торжественно отметим 20-летие принятия Конституции и создания Ассамблеи народа Казахстана. Отмечая эти даты, нам важно сделать казахстанцев ещё более сильными в духовном плане, едиными и ещё более толерантными. Я убеждён, что на новом ответственном витке истории обретёт новое звучание и более глубокий смысл наш главный принцип - Казахстан, только вперёд! Желаю всем успехов и достижения новых вершин, которые поднимут на еще большую высоту нашу Родину!», - заключил свое Послание Президент.\r\nИсточник: http://articles.gazeta.kz/articles/nazarbaev-obratilsya-k-narodu-s-ezhegodnym-poslaniem-articleID405948.html\r\nИспользование материалов допускается только при наличии гиперссылки на конкретную страницу сайта в первом абзаце и в конце публикации с указанием источника (медиа-портал Gazeta.kz, гиперссылка на страницу сайта). Использование скриншотов с видео, фотографий и иллюстраций запрещается без письменного разрешения редакции (cont@gazeta.kz)', 6, 'article', 'ru'),
	(19, 'title', 'Люди недооценивают свои шансы на долголетие', 7, 'article', 'ru'),
	(20, 'text', 'Ученые обратили внимание на опрос 1992 года 26 тысяч американцев старше 50 лет. Их спрашивали о том, как они оценивают свои шансы дожить до 75 лет. Из участников опроса примерно половина дожила до 75 лет. Однако семь процентов не верили, что доживут до 75 лет. Среди тех, кто в 50 процентов оценил вероятность дожить до 75 лет, две трети перешагнули этот рубеж.\r\n\r\nКак отмечают исследователи, те люди, которые давали себе изначально высокие шансы на долголетие, имели намерения долго прожить и сделали это. С другой стороны, часть тех, кто не верил в свое долголетие, нередко оказывались неготовыми к такой продолжительной жизни.\r\n\r\nУченые отмечают, что такое положение дел может негативно сказаться на жизни людей в старости. «Лица, не в полной мере понимающие возможность своего долголетия, могут подвергать себя рискам», — пишут авторы исследования.\r\n\r\nКак отметили эксперты, люди нередко уделяют чрезмерное внимание факторам, могущим привести к преждевременной смерти — болезням, авариям, войнам и прочим. С другой стороны, они недостаточно думают о накоплении сбережений, способных обеспечить им достойную старость.\r\nИсточник: http://articles.gazeta.kz/articles/lyudi-nedoocenivayut-svoi-shansy-na-dolgoletie-articleID405815.html\r\nИспользование материалов допускается только при наличии гиперссылки на конкретную страницу сайта в первом абзаце и в конце публикации с указанием источника (медиа-портал Gazeta.kz, гиперссылка на страницу сайта). Использование скриншотов с видео, фотографий и иллюстраций запрещается без письменного разрешения редакции (cont@gazeta.kz)', 7, 'article', 'ru'),
	(21, 'title', 'Организатор интернет-сообществ "Курицы" дал откровенное интервью', 8, 'article', 'ru'),
	(22, 'text', 'Валера Антонов, как значится на его страничке, ведет сразу три мужских объединения – карагандинское, алматинское и петропавловское. Сам он признается, что это имя вымышленное и найти его в реальной жизни крайне сложно, поскольку он не сообщает ни город проживания, ни даже страну. Узнать эту информацию при помощи ip-адреса тоже нельзя, поскольку он зашифрован. Собственно и страница его оказалась "замороженной администрацией" сразу после того, как он прислал мне ответное сообщение.\r\n\r\nПо поводу судов и скандалов он уверенно заявляет – прецедентов еще не было, заявления на сообщество если и подавались, то принимать их никто не стал.\r\n\r\n"Судебных разбирательств нигде еще не было, у вас ложная информация, – пишет он в своем сообщении. - Сотрудники правоохранительных органов не могут принять заявление на фейк-страницу и администрация "Вконтакте" не имеет права наказывать за любые деяния в социальной сети. Они могут только заблокировать сообщество или страницу, но всегда есть резерв. Да и заявления очень редко кто подает. Нас не вычислить, мы используем фейковые страницы, зашифрованные ip-адреса, незарегистрированные номера, а если зарегистрированные, то точно не на нас и не на наших знакомых. И еще никто не говорил, что администраторы таких сообществ живут в городах, о которых ведут группы, некоторые может – даже не в Казахстане, а это очень усложнит поиск администратора".\r\nОбвиняя журналистов в том, что они распространяют ложную информацию, сам Валера признается, что "факты", которые ему присылают подписчики, он тоже не проверяет.\r\n\r\nСообщества сделаны не с целью кого-то опорочить, унизить, уничтожить морально или как частичку общества, а заставить девушек вести себя скромнее под страхом попасть в такую группу. К сожалению, как я считаю, многие девушки независимо от национальной принадлежности стали вести себя слишком безответственно, развязно, свободно\r\n\r\n"Если присылают откровенное фото девушки, то эту информацию уже нет смысла проверять, тут и так все понятно, – пишет администратор. – А когда фото вписывается в нормы морали, то обычно подписчики хотят узнать информацию о данной девушке, например, потому что хотят начать строить с ней отношения. Получается, и во втором случае проверять информацию смысла нет. Но все девушки должны быть совершеннолетними, иначе автор попадает в черный список. Информация о возрасте проверяется".\r\n\r\nЗакрывать сообщества из-за поднявшейся шумихи Валера не собирается. Возможно, молодой человек надеется на то, что скандалы могут выгодно сказаться на посещаемости группы и добавить пару-тройку десятков подписчиков, которые активно бы "сливали" информацию о бывших пассиях и просто знакомых.\r\n\r\n"Сообщества закрывать не планирую, а планирую только развивать, – признается администратор. - Шумиха сделана на пустом месте. Сообщества сделаны не с целью кого-то опорочить, унизить, уничтожить морально или как частичку общества, а заставить девушек вести себя скромнее под страхом попасть в такую группу. К сожалению, как я считаю, многие девушки независимо от национальной принадлежности стали вести себя слишком безответственно, развязно, свободно. Сильно напоминают путан, только не берут денег. Другие девушки, видя это, начинают им подражать, особенно младшие по возрасту, потому что считают это примером взрослой жизни. Никто не хочет себе такую жену, сестру или дочь. Девушкам, которые ведут себя скромно, не шляются по клубам, не распивают алкоголь где и с кем попало, не спят со всеми подряд направо и налево, бояться нечего – о таких всегда теплые комментарии, их читать приятно".\r\n\r\nСложно сказать, что намерения сильной половины человечества "приструнить" девушек полностью порочны и ошибочны. Однако непроверенная информация такого рода и вправду может изрядно подпортить жизнь девушке, случайно перешедшей дорогу мстительной сопернице или незадачливому дон Жуану.\r\n\r\nНапомним, скандал вокруг интернет-сообществ "Курицы" продолжается несколько месяцев.\r\nОрганизаторов группы "Кырицы Актобе" уже обвинили в доведении до самоубийства. Кроме того, жертвы актюбинской группы нашли одного из своих обидчиков и заставили его извиниться.\r\nИсточник: http://articles.gazeta.kz/articles/organizator-internet-soobshhestv-quotkuricyquot-dal-otkrovennoe-intervyu-articleID405617.html\r\nИспользование материалов допускается только при наличии гиперссылки на конкретную страницу сайта в первом абзаце и в конце публикации с указанием источника (медиа-портал Gazeta.kz, гиперссылка на страницу сайта). Использование скриншотов с видео, фотографий и иллюстраций запрещается без письменного разрешения редакции (cont@gazeta.kz)', 8, 'article', 'ru'),
	(23, 'title', 'Скоро в Алматы пройдет финал Национального конкурса «Мисс Казахстан - 2014»', 9, 'article', 'ru'),
	(24, 'text', 'В этот торжественный вечер победительница прошлогоднего Национального Конкурса «Мисс Казахстан-2013» Айдай Исаева по традиции должна передать свою корону новой обладательнице титула «Мисс Казахстан-2014».\r\n\r\nВпервые за долгие годы существования конкурса «Мисс Казахстан», главным организатором проведения выступил акимат города Алматы.\r\n\r\nЗа звание «Мисс Казахстан» будут сражаться 35 девушек из всех республик нашей страны.\r\nВ этом году организаторы конкурса впервые изменили формат мероприятия. Теперь красотку страны будет определять не жюри. 28 ноября народным голосованием будет выбрана первая красавица нашей Республики.\r\n\r\nНациональный конкурс «Мисс Казахстан» был основан в 1997 году, и все эти годы выбор самой красивой девушки отводился на роль жюри. В этом году судьбу обладательницы титула смогут решить сами казахстанцы.\r\n\r\n\r\nВ состав жюри войдут: Илья Ильин, Луина, Али Окапов, Марат Оразгалин и Салтанат Бекжегитова.\r\n\r\nВ этом году организаторы внесли много положительных  моментов. Впервые «Мисс Казахстан» получит денежную премию в один миллион тенге.\r\n\r\nО всех прелестях конкурса мы узнали у предыдущей победительницы  «Мисс Казахстан-2013» Айдай Исаевой:\r\n\r\n-Айдай, прошел почти год с того момента, как вы получили титул «Мисс Казахстан-2013». Как изменилась ваша жизнь за этот период?\r\n\r\n-Я приобрела очень много друзей, поклонников, хотя у меня есть молодой человек, и у других нет шансов! (улыбается). Благодаря этому конкурсу я стала уверенной в себе. Вообще, этот конкурс вселяет чувство уверенности.\r\n\r\nДля меня этот конкурс - хобби. По специальности я медик, терапевт – педиатр, и я дальше хочу получать навыки и знания в этой профессии, а также помогать людям.\r\n\r\nУ меня есть мечта - открыть, например, салон красоты или медицинскую клинику. Сейчас моя цель - победить на конкурсе «Мисс Вселенная», который пройдет в январе в Майями.\r\n\r\n-Если вы станете обладательницей титула «Мисс Вселенная», что намерены делать дальше?\r\n- Видно будет! Сначала надо победить!\r\nИсточник: http://art.gazeta.kz/news/skoro-v-almaty-projjdet-final-nacionalnogo-konkursa-miss-kazakhstan---2014-newsID20261.html\r\nИспользование материалов допускается только при наличии гиперссылки на конкретную страницу сайта в первом абзаце и в конце публикации с указанием источника (медиа-портал Gazeta.kz, гиперссылка на страницу сайта). Использование скриншотов с видео, фотографий и иллюстраций запрещается без письменного разрешения редакции (cont@gazeta.kz)', 9, 'article', 'ru'),
	(25, 'brief', 'В этом году 15 ноября 2014 года тенге исполнился 21 год. За это время национальная валюта Казахстана пережила несколько девальваций и смену семи председателей Нацбанка РК. Менялся дизайн тенге, монеты сменяли бумажные купюры, а тиын практически вышли из обращения. Трансформация дизайна тенге происходила из-за объективных причин, одна из главных – повышение степени защиты, пишет деловой портал Kapital.kz.', 5, 'article', 'ru'),
	(26, 'brief', '«Ближайшие годы будут не очень легкими для нашей страны, по этой причине я хочу заранее, заблаговременно сейчас обратиться со своим посланием, что мы должны предпринять с нового года. Для того чтобы дать время для этого, я обращаюсь с посланием в конце года», - пояснил глава государства.\r\n«Сегодня, отвечая на вызовы, которые стоят перед нами, я объявляю о Новой Экономической Политике Казахстана «Нурлы Жол». Этому я посвящаю новое Послание народу на 2015 год. Она будет иметь контрцикличный характер и будет направлена на продолжение структурных реформ в нашей экономике», - сказал Президент.\r\n', 6, 'article', 'ru'),
	(27, 'brief', 'Ученые обратили внимание на опрос 1992 года 26 тысяч американцев старше 50 лет. Их спрашивали о том, как они оценивают свои шансы дожить до 75 лет. Из участников опроса примерно половина дожила до 75 лет. Однако семь процентов не верили, что доживут до 75 лет. Среди тех, кто в 50 процентов оценил вероятность дожить до 75 лет, две трети перешагнули этот рубеж.', 7, 'article', 'ru'),
	(28, 'brief', 'Валера Антонов, как значится на его страничке, ведет сразу три мужских объединения – карагандинское, алматинское и петропавловское. Сам он признается, что это имя вымышленное и найти его в реальной жизни крайне сложно, поскольку он не сообщает ни город проживания, ни даже страну. Узнать эту информацию при помощи ip-адреса тоже нельзя, поскольку он зашифрован. Собственно и страница его оказалась "замороженной администрацией" сразу после того, как он прислал мне ответное сообщение.\r\n', 8, 'article', 'ru'),
	(29, 'brief', 'В этот торжественный вечер победительница прошлогоднего Национального Конкурса «Мисс Казахстан-2013» Айдай Исаева по традиции должна передать свою корону новой обладательнице титула «Мисс Казахстан-2014».', 9, 'article', 'ru'),
	(30, 'title', 'Фотогаллерея', 10, 'gallery', 'ru'),
	(31, 'text', 'фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками фотогаллерея с фотками ', 10, 'gallery', 'ru');
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;


-- Дамп структуры для таблица vine.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` varchar(50) NOT NULL,
  `page_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `ln` varchar(2) DEFAULT 'en',
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.menus: 5 rows
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
REPLACE INTO `menus` (`id`, `name`, `position`, `page_id`, `parent_id`, `ln`, `order`) VALUES
	(1, 'xi', 'top', 2, 0, 'ru', 3),
	(2, 'About', 'top', 1, 0, 'ru', 2),
	(3, 'Главная', 'top', 3, 0, 'ru', 1),
	(4, 'Статьи', 'top', 4, 0, 'ru', 4),
	(5, 'Фотогаллерея', 'top', 10, 0, 'ru', 5);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Дамп структуры для таблица vine.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `alias` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `ln` enum('en','ru') DEFAULT 'ru',
  `readonly` int(11) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `nofollow` int(11) DEFAULT '0',
  `new_window` int(11) DEFAULT '0',
  `custom_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `pid` (`parent_id`),
  KEY `visible` (`status`),
  KEY `date` (`date`),
  KEY `edit_date` (`edit_date`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.pages: 10 rows
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
REPLACE INTO `pages` (`id`, `parent_id`, `module`, `status`, `alias`, `date`, `edit_date`, `ln`, `readonly`, `order`, `nofollow`, `new_window`, `custom_url`) VALUES
	(1, 0, 'text', 'active', 'about', '2014-09-04 15:35:00', '2014-09-04 17:31:00', 'ru', 0, 0, 0, 0, NULL),
	(2, 0, 'text', 'active', 'xi', '2014-09-04 15:35:00', '2014-09-04 17:31:00', 'ru', 0, 0, 0, 0, NULL),
	(3, 0, 'text', 'active', '/', '2014-09-04 15:35:00', '2014-09-04 17:31:00', 'ru', 0, 0, 0, 0, NULL),
	(4, 0, 'articles', 'active', 'articles', '2014-11-21 12:14:29', '2014-11-21 12:14:33', 'ru', 0, 0, 0, 0, NULL),
	(5, 4, 'article', 'active', 'articles/article1', '2014-11-21 12:18:43', '2014-11-21 12:18:45', 'ru', 0, 0, 0, 0, NULL),
	(6, 4, 'article', 'active', 'articles/article2', '2014-11-21 12:19:08', '2014-11-21 12:19:10', 'ru', 0, 0, 0, 0, NULL),
	(7, 4, 'article', 'active', 'articles/article3', '2014-11-21 12:19:23', '2014-11-21 12:19:24', 'ru', 0, 0, 0, 0, NULL),
	(8, 4, 'article', 'active', 'articles/article4', '2014-11-21 12:19:40', '2014-11-21 12:19:41', 'ru', 0, 0, 0, 0, NULL),
	(9, 4, 'article', 'active', 'articles/article5', '2014-11-21 12:19:45', '2014-11-21 12:19:42', 'ru', 0, 0, 0, 0, NULL),
	(10, 0, 'gallery', 'active', 'gallery', '2014-11-26 11:50:01', '2014-11-26 11:50:02', 'ru', 0, 0, 0, 0, NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Дамп структуры для таблица vine.photos
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(250) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`parent_id`),
  KEY `module` (`module`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.photos: 5 rows
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
REPLACE INTO `photos` (`id`, `path`, `parent_id`, `module`, `date`) VALUES
	(1, 'images/1.jpg', 10, 'photo', '2014-11-26 12:10:55'),
	(2, 'images/2.jpg', 10, 'photo', '2014-11-26 12:11:08'),
	(3, 'images/3.jpg', 10, 'photo', '2014-11-26 12:11:23'),
	(4, 'images/4.jpg', 10, 'photo', '2014-11-26 12:11:41'),
	(5, 'images/5.jpg', 10, 'photo', '2014-11-26 12:11:56');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;


-- Дамп структуры для таблица vine.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(50) NOT NULL,
  `use_editor` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `length` int(11) NOT NULL DEFAULT '0',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `module` (`module`),
  KEY `date` (`date`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.properties: 0 rows
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;


-- Дамп структуры для таблица vine.users
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fio` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `salt` (`salt`),
  KEY `email` (`email`),
  KEY `role` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы vine.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`Id`, `email`, `fio`, `pass`, `salt`, `role`) VALUES
	(1, 'user@user.ru', 'User U', 'user', 'salt', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
