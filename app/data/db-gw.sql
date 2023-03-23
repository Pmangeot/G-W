DROP TABLE IF EXISTS "specimen", "gwModel", "user", "roles", "condition";

CREATE TABLE IF NOT EXISTS "roles" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "condition" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "is" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "gwModel" (
    "id" TEXT PRIMARY KEY,
    "name" TEXT,
    "releasedate" TEXT,
    "acronym" TEXT,
    "scarcity" INT,
    "series" TEXT,
    "history" TEXT,
    "gameplay" TEXT,
    "secondemode" TEXT,
    "details" TEXT,
    "variations" TEXT
);


CREATE TABLE IF NOT EXISTS "user" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"pseudo" TEXT NOT NULL,
	"lastname" TEXT,
	"firstname" TEXT,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"role_id" INTEGER REFERENCES "roles"("id"),
	"created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "specimen" (
    "id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"user_id" INTEGER REFERENCES "user" ("id") NOT NULL,
	"modelId" TEXT REFERENCES "gwModel" ("id") NOT NULL,
	"serial" INTEGER,
	"condition" INTEGER REFERENCES "condition"("id"),
    "defaults" TEXT,
	"isBattCoverMissing" BOOLEAN,
	"isBoxMissing" BOOLEAN,
    "restoration" TEXT,
	"variation" TEXT,
	"created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMPTZ
);







INSERT INTO "condition" ("is")
VALUES
	('pristine'),
	('good'),
	('medium'),
	('bad');

INSERT INTO "roles" ("name")
VALUES 
	('user'),
	('admin');

INSERT INTO "user" ("pseudo", "lastname", "firstname", "email", "password", "role_id")
VALUES ('Reyeep', 'Mangeot', 'Pierre', 'email@email.com', '$2b$10$nIIIGWlkm3SzwVF81h4qOekR8ABLUqXoiWAVSkB6oNpKroyyky84G', 2);


INSERT INTO "gwModel" 
VALUES 
    ('AC-01','Ball','28/04/1980','ACrobat',3,'Silver','Edit Le tout 1er game and watch de la série : Ball. Le but du jeu est très simple : jongler avec les balles, qui apparaissent de plus en plus et vont de plus en plus vite ! La plaque de ce jeu a eu 2 versions : une version avec l''inscription AC-01 et une sans. Cette dernière a été tiré à environ 10 000 exemplaires et est plutôt rare à trouver puisque ce sont les tous 1er jeux sortis. Il n''en a été ressensé qu''une petite dizaine. Une version sous le nom Toss Up a été distribué par MEGO/Time out.',NULL,NULL,NULL,'[]'),
	('FL-02','Flagman','05/06/1980','FLagman',4,'Silver','Edit Flagman est l''un des jeux les plus chers de nos jours car il avait été boudé par les joueurs à sa sortie, de par son univers simpliste. Son gameplay est pourtant sympa puisque qu''il offre 2 jeux en un : le 1er est un jeu de mémoire, une sorte de Simon, où il faut refaire la suite de numéros précédemment joués par la machine, le 2nd étant un jeu de rapidité où il faut appuyer sur le chiffre proposé le plus rapidement possible. De quoi jouer pendant des heures, nan ? ^^ Une version sous le nom Flag Man a été distribué par MEGO/Time out.',NULL,NULL,NULL,'[]'),
	('MT-03','Vermin','10/07/1980',NULL,3,'Silver',NULL,'EDIT C''est le concept du Whac-A-Mole (écrase taupe) qui est utilisé dans ce jeu. C''est depuis Vermin que le concept des jeux à 3 vies est né ! Une version sous le nom Exterminator a été distribué par MEGO/Time out.',NULL,NULL,'[]'),
	('RC-04','Fire','31/07/1980',NULL,3,'Silver','EDIT C''est le jeu le moins rare de la série silver. Le but est de faire rebondir des bonhommes qui se jetent d''un immeuble en feu sur une civière pour les faire attérir dans une ambulance. C''est la 1ère fois qu''un jeu utilise un système de sauvegarde de score ... qui s''effacera néanmoins dès qu''on change les piles. Une version sous le nom Fireman Fireman (oui 2 fois :D) a été distribué par MEGO/Time out.',NULL,NULL,NULL,'[]'),
	('IP-05','Judge','04/10/1980',NULL,3,'Silver','EDIT Judge est le 1er game and watch qui propose un mode multijoueurs. Le but du jeu est de frapper ou d''esquiver son adversaire, selon si le chiffre de la pancarte est plus ou moins élevé que celui de l''autre joueur. Le jeu allie donc concentration et reflexe et a ainsi beaucoup marqué les esprits. C''est le seul game and watch à avoir une version avec écriture en japonais. Le jeu a été décliné en 3 versions. Une version verte avec écriture en japonais, qui a eu un bug en mode multijoueur, qui favorisait un des joueurs dans le décompte des points. Une version violette a alors été créée, comprenant 2 variantes : une écrite en japonais, l''autre en anglais. C''est d''ailleurs cette dernière qui est la plus rare à trouver.',NULL,NULL,NULL,'[]'),
	('MH-06','Manhole','27/01/1981',NULL,3,'Gold','EDIT Judge est le 1er game and watch qui propose un mode multijoueurs. Le but du jeu est de frapper ou d''esquiver son adversaire, selon si le chiffre de la pancarte est plus ou moins élevé que celui de l''autre joueur. Le jeu allie donc concentration et reflexe et a ainsi beaucoup marqué les esprits. C''est le seul game and watch à avoir une version avec écriture en japonais. Le jeu a été décliné en 3 versions. Une version verte avec écriture en japonais, qui a eu un bug en mode multijoueur, qui favorisait un des joueurs dans le décompte des points. Une version violette a alors été créée, comprenant 2 variantes : une écrite en japonais, l''autre en anglais. C''est d''ailleurs cette dernière qui est la plus rare à trouver.',NULL,NULL,NULL,'[]'),
	('CN-07','Helmet','21/02/1981',NULL,3,'Gold',NULL,'Vous controlez un ouvrier qui doit traverser un chantier de gauche à droite. Il faut eviter les outils qui tombent sous peine de perte d''une vie. L''ouvrier ne peut sortir par la porte que lorsque celle ci est ouverte.','Les objets tombent plus vite et la porte est moins longtemps ouverte.','If you hold in Game A or Game B key the highest previous score will be displayed. If the unit is left as it is after game is over, time display will appear in about five minutes. A game is not interrupted even if TIME key or other game keys are depressed during game playing. Pressing ACL switch or removing batteries erases high score from memory.','[]'),
	('LN-08','Lion','27/04/1981','LioN',3,'Gold','EDIT Le but du jeu est de laisser les lions dans la cage grâce à deux dompteurs les bloquant de part et d''autre et pouvant bloquer 3 sorties chacun. C''est le 1er jeu sur lequel une animation sympatique apparait lors d''un ''miss'' : le dompteur s''accroche à un arbre pour fuir le rugissant !',NULL,NULL,NULL,'[]'),
	('PR-21','Parachute','19/06/1981','PaRachute',1,'Widescreen',NULL,'Vous devez receptionner des parachutistes dans votre barque en vous déplaçant. Si un parachutiste tombe à l''eau, il est alors dévoré par un requin.','Les parachutes s''accrochent parfois aux arbres et les parachutistes se balacent alors jusqu''a tomber.','Maximum score is 999 and when the score reaches 200 & 500 points all misses are cancelled. Up to 10 skydivers can be on the screen at any time. Speed and number of skydivers increases with score. With each 100 points, speed returns to normal so you can take a breather before it start to get faster again.','[]'),
	('OC-22','Octopus','16/07/1981','OCtopus',2,'Widescreen',NULL,'Vous controller des plongeurs qui doivent recupérer un trésor sous marin. Pour arriver au coffre et revenir au bateau, vous devrez eviter les tentacules de la pieuvres.','Les tentacules bougent plus vite','Maximum score is 999 and when the score reaches 200 or 500 points all misses are cancelled.Tentacles move at increasing speed, but slow down every 100 points before increasing in speed again. Try to use the slow points in the game to get your breath back.Remember, you can''t get back on the boat without any treasure.Points:1 Point per gem collected. 3 Points when you return to the boat with some gems.','[]'),
	('PP-23','Popeye','05/08/1981','PoPeye',2,'Widescreen',NULL,'Vous controllez Popeye qui doit attraper les boites d''epinards, bouteilles et ananas qu''Olive envoie. Vous devez faire cela en eviter les coups de Brutus.','Brutus se deplace plus loin et plus vite','Maximum score is 999 and when the score reaches 200 or 500 points all misses are cancelled.As the score advances Olive throws more items, and her throwing speed increases, but slows down every 100 points before increasing in speed again. Try to use the slow points in the game to get your breath back.','[]'),
	('MC-25','Mickey Mouse','09/10/1981','MiCkey',3,'Widescreen','EDIT Après Popeye, Mickey est la 2ème franchise que Nintendo utilisera dans ses game and watch. Mickey étant très populaire chez jeunes enfants à cette époque là, c''est donc tout naturellement que ce jeu se soit extrêmement bien vendu, même si son arrivée au delà des frontières Japonaises fût retardée. Ce jeu a un gameplay en tout point identique à Manhole avec ses 4 directions possibles mais l''univers Mickey et le scénario de ramasser les oeufs qui tombent rendent ce titre bien plus fun que Manhole.',NULL,NULL,NULL,'[]'),
	('EG-26','Egg','09/10/1981','EGg',5,'Widescreen','EDIT Egg est le seul game and watch dans lequel on manipule un méchant : un loup qui est la pour piquer des oeufs et non pour les ramasser comme dans le titre Mickey Mouse. Egg est en fait une copie pure et simple de Mickey Mouse, en raison d''un décallage de la sortie de ce dernier en occident dû à un problème de licence or du Japon. Nintendo a dû faire vite pour que les occidentaux ait un jeu similaire à Mickey Mouse. La production de ce jeu s''est arrêté lorsque Mickey Mouse est devenu exploitable par Nintendo en dehors du Japon, ce qui fait de Egg le jeu le plus rare et le plus cher de tous, or versions promotionnelles',NULL,NULL,NULL,'[]'),
	('FR-27','Fire','04/12/1981','FiRe',2,'Widescreen','EDIT Fire est le 1er remake de Nintendo. Il reprend l''univers et le gameplay du Fire version Silver, à cela près que grâce à son plus grand écran, le game B gagne en difficulté puisque les malheureux peuvent sauter de 2 étages différents. Fire reste une valeur sur pour passer un bon moment !','Des personnes sautent d''un immeuble en feu. En dessous, deux sauveteurs tiennent un filet. Le but du jeu est de réceptionner ces personnes et de les faire rebondir jusque dans une ambulance. À chaque fois qu''une personne rebondit sur le filet, elle rebondit vers la droite. Trois rebonds sont nécessaires pour arriver à sauver une personne. Si, par mégarde, on laisse tomber une personne, on perd une vie. Au bout de 3 vies perdues, le jeu est fini.',NULL,NULL,'green'),
	('TL-28','Turtle Bridge','01/01/1982','TurtLe',2,'Widescreen','EDIT Novateur sur bien des points, Turtle Bridge était l''un des jeux préféré de Gunpei. Le but est de faire traverser un touriste d''une île à l''autre pour qu''il y transporte ses bagages, en passant sur le dos de tortues, qui quittent de temps à autres la surface pour aller se restaurer de quelques poissons. C''est le 1er game and watch à aller jusqu''à 9999 points, à avoir un système de point qui dépend de la vitesse d''execution (traversée), à offrir un temps pendant lequel les tortues restent immobiles (lorsque le joueur atteint 200 et 500 points sans aucun miss) et enfin à avoir un design (noir à bandes argentées) qui tranche avec les 1er de la série (tout dorée).',NULL,NULL,NULL,'[]'),
	('ID-29','Fire Attack','26/03/1982','FiRe',2,'Widescreen','EDIT Un cowboy en panique doit repousser les attaques des indiens venus assaillir son fort de tous les cotés. Le jeu ressemble, encore une fois, dans son gameplay, à Manhole, avec ses 4 directions d''actions. Mais là où c''est novateur, c''est qu''il faudra appuyer une fois pour diriger le cowboy, et une deuxième fois pour qu''il se défende. Cela n''a l''air de rien, mais ce concept offre au jeu une autre dimension ludique.',NULL,NULL,NULL,'[]'),
	('SP-30','Snoopy Tennis','28/04/1982','SnooPy',2,'Widescreen','EDIT Snoopy doit renvoyer les balles que lui envoient Charlie et Lucy. C''est la 3ème licence tierce qu''utilisera Nintendo pour plusieurs titres. L''innovation, et donc la difficulté de ce titre est double : d''une part il faut tapper la balle lorsqu''elle arrive juste devant la raquette (et non pas seulement se positionner devant) mais en plus il faut, et pour la 1ère fois, coordonner le mouvement vertical de Snoopy avec cette frappe. Les joueurs d''aujourd''hui devront d''ailleurs s''habituer pendant quelques minutes à diriger le chien à droite et à frapper à gauche, chose dont on n''a plus l''habitude avec les manettes d''aujourd''hui.',NULL,NULL,NULL,'[]'),
	('OP-51','Oil Panic','28/05/1982','Oil Panic',2,'Multiscreen','EDIT Premier jeu de la série multiscreen, qui sera reprise dans le design de la Nintendo DS 20 ans plus tard. Les 2 écrans permettent à Nintendo d''innover sur le plan ludique. Ici, vous devez synchroniser 2 mécaniciens, l''un ramassant les gouttes d''essence qui fuit d''un tuyau, l''autre ramassant le surplus lancé par le 1er de l''étage supérieur, ceci pour éviter que la fuite d''essence n''embrase la station ou que les clients ne soient aspergés. Une concentration à toute épreuve !',NULL,NULL,NULL,'[]'),
	('DK-52','Donkey Kong','03/06/1982','Donkey Kong',2,'Multiscreen','EDIT Donkey Kong est le Game & Watch le plus emblématique car c''est celui qui a été le plus vendu, en raison de sa popularité dans les salles d''arcade de l''époque. Le but du jeu y est d''ailleurs le même : on guide Mario en évitant les tonneaux lancés par le gros singe pour délivrer sa copine. C''est ce jeu qui a inauguré la croix directionnel brevetée que nous avons retrouvé plus tard dans la Gameboy, la Nes et toutes les consoles Nintendo suivantes.',NULL,NULL,NULL,'[]'),
	('DM-53','Mickey & Donald','12/11/1982','DonaldMickey',2,'Multiscreen','EDIT Seconde apparition de Mickey dans les Game & Watch. Cette fois accompagné de Donald, Dinguo, Minnie et Pluto, L''aventure consiste à éteindre le feu d''un immeuble en flamme. Dinguo pompe l''eau du camion de pompier, Mickey le reveille quand il s''endort et doit aussi boucher les fuites, pendant que Donald dirige la lance pour contrer les flammes qui montent. Minnie donnera un bisou à Mickey lorsque la mission sera accomplie. Pluto est le garant du réveil ;) Ce jeu est assez compliqué puisqu''il faut diriger 2 personnages en même temps, ayant une action différente',NULL,NULL,NULL,'[]'),
	('GH-54','Green House','06/12/1982','GreenHouse',2,'Multiscreen','EDIT Green House est le seul Game & Watch a avoir inspiré un jeu vidéo : Donkey Kong 3, que l''ont retrouvera d''ailleurs dans la série Micro Vs. System. Le principe est d''éloigner les chenilles et les araignées des plantes grâce à l''insecticide de Stanley, le héro de ce jeu. Le jeu n''a pas remporté un franc succès, mais c''est tout de même un jeu que j''apprécie.',NULL,NULL,NULL,'[]'),
	('JR-55','Donkey Kong II','07/03/1983','JunioR',2,'Multiscreen','EDIT Deuxième Game1Watch mettant en scène Donkey Kong et Mario. Mais cette fois-ci les rôles sont inversés. Mario a emprisonné Donkey Kong et c''est le fils de ce dernier, Junior, qui doit venir le delivrer, en libérant ses chaines, après avoir évité crocodiles, courants électriques et oiseaux. Ce jeu mettra à mal votre dextérité et vos reflexes. Un très bon titre qui a connu également un franc succès.',NULL,NULL,NULL,'[]'),
	('MW-56','Mario Bros.','14/03/1983','MarioWarehouse',2,'Multiscreen_book','EDIT Mario Bros. pour Mario Brothers. C''est la première fois que le duo fraternel Mario et Luigi entrent en scène dans un jeu vidéo. Loin de la plomberie, c''est en manutentionnaire qu''ils doivent faire tourner une usine d''emballage de bouteilles de vin, sans faire tomber les caisses, jusqu''à l''empillement final dans le camion de livraison. Ce jeu est le premier double écran à être dirigé à l''horizontal. C''est aussi un jeu où on peut s''adonner au gameplay multijoueurs à l''instar de Judge.',NULL,NULL,NULL,'[]'),
	('LP-57','Rain Shower','10/08/1983',NULL,3,'Multiscreen_book','EDIT C''est le plus cher des Game & Watch double écran, sûrement dû au fait qu''il n''a pas été commercialisé au Japon. C''est également un jeu en mode horizontal. Le but est de diriger un homme qui tente de faire sécher son linge par temps de pluie, on doit alors lui faire tirer les cordes à linges pour que les goutes ne tombent pas sur les vêtements. En Game B, un corbeau vient corser l''affaire puisqu''il lui arrive de tirer l''une des 2 cordes quand bon lui semble.  C''est pour moi l''un des jeux les plus difficiles.',NULL,NULL,NULL,'[]'),
	('TC-58','Lifeboat','25/10/1983',NULL,2,'Multiscreen_book','EDIT Le dernier des 3 jeux double écran orienté à l''horizontal. D''un gameplay ressemblant étrangement à Parachute, il faut diriger 2 (ou 1 en game B) barques afin de recupérer les passagers qui sautent du bateaux en flamme. La difficulté vient surtout du fait qu''il faut mettre en sécurité ces rescapés car le nombre de places dans les petites embarcations est limité à 4. Ce qui redynamise le concept de Parachute.',NULL,NULL,NULL,'[]'),
	('PB-59','Pinball','26/03/1983','PinBall',2,'Multiscreen','EDIT Pinball est le 1er Game & Watch dans lequel on ne dirige pas un personnage. En effet, Nintendo a réussi à recréer tout l''univers du flipper tel qu''on le connaissait à l''époque. Les deux écrans ont montré dans ce titre tout leur avantage, puisque même une fois la balle sur l''écran du haut, 2 leviers sont également actionnables. Les score maximum est de 999.900 points ce qui fait de Pinball le Game & Watch où l''on peut faire le plus de points.',NULL,NULL,NULL,'[]'),
	('BJ-60','Blackjack','15/02/1985','BlackJack',2,'Multiscreen','EDIT Le 2ème et dernier jeu où l''on ne dirigera aucun héros, puisque ce jeu est, sans surprise, un jeu de Black Jack, comme au casino. Un Game B saura renouveler l''expérience, puisqu''il propose un bandit manchot dans lequel il faudra tenter de faire afficher 77777 pour maximiser les points. Pas suffisant pour faire de ce titre un best seller. Nintendo arrêtera alors les jeux sans personnages. Par ailleurs, Black Jack est le dernier jeu de la série double écran à avoir été vendu au Japon.',NULL,NULL,NULL,'[]'),
	('MG-61','Squish','17/04/1986',NULL,2,'Multiscreen','EDIT Squish est le premier Game & Watch dont la boite n''a eu qu''un design Pocketsize, comme les 4 autres double écran qui suivront : donc, hormis un éventuel sticker, pas de version japonaise, française (Ji21), allemande (tricotronic), anglaise (CGL) ou autre (videopoche, argentin ...). Ici, on dirige un personnage (Ziggy, il s''appelle Ziggy ...) dans un labyrinthe, en prenant garde de ne pas se faire bloquer dans les coins de l''écran. Nintendo a su innover en proposant un jeu à scrolling horizontal et vertical dans les 2 directions. Un jeu penant sur lequel je pourrais passer des heures.',NULL,NULL,NULL,'[]'),
	('BD-62','Bomb Sweeper','14/06/1987',NULL,2,'Multiscreen','EDIT C''est le seul de tous les Game & Watch à ne se jouer qu''avec un bouton, la croix directionnel. Votre pouce droit vous sera inutile, tout comme l''écran du haut qui, fait rare unique, ne sert pas du tout pendant la partie en elle même. Le jeu consiste à desamorcer, dans le temps imparti, les bombes placées par Dynamite Jack, en poussant les murs sans se retrouver bloqué. Un puzzle game des plus réussi pour l''époque, encore largement distrayant de nos jours.',NULL,NULL,NULL,'[]'),
	('JB-63','Safebuster','06/01/1988',NULL,2,'Multiscreen','EDIT Rien de bien innovant dans ce Game & Watch. On dirige un gardien qui recupère les bombes jetées par un voleur qui veut faire peter la banque ! Les bombes sont ramassées dans un conteneur ne pouvant en accueillir que 4 (ca rappelle les barques dans Lifeboat), qu''il faudra deverser sur le bord de l''écran avant d''en récupérer à nouveau.',NULL,NULL,NULL,'[]'),
	('MV-64','Goldcliff','19/10/1988',NULL,2,'Multiscreen','EDIT Alors là ça ne rigole plus ! Enfin un jeu d''aventure, un vrai, avec ses 24 mondes et ses 144 niveaux. Grosse nouveauté : la possibilité de sauvegarder sa progression, avec un bouton Continue. Des niveaux qui utilisent les 2 ecrans, des sauts de plateforme en plateforme, une clé à récuperer, un boss de fin de tableau. Bref, un jeu bien plus complet que les autres.',NULL,NULL,NULL,'[]'),
	('ZL-65','Zelda','25/08/1989','ZeLda',2,'Multiscreen','EDIT Après la sortie sur la NES de ''The Legend of Zelda'' puis de ''Zelda II : The Adventure of Link'', Nintendo a tenté d''adapter son personnage et son univers dans un double écran. Très belle réussite que ce Zelda sur Game & Watch. Tout y est : Link, Zelda, quête, clé, combats, dragons, plan, armes, bouclier, points de vie, dragon et surtout Triforce ! La mode Continue inauguré dans Goldcliff a évidemment toute sa place ici également. Zelda est le dernier double écran ; une rumeur laissait entendre à l''époque que Tetris devait arriver ensuite, mais il ne verra jamais le jour.',NULL,NULL,NULL,'[]'),
	('DJ-101','Donkey Kong Jr.','26/10/1982',NULL,2,'New widescreen','EDIT C''est la 1ère apparition de Junior dans un Game & Watch. Il doit délivrer son père de la cage dans lequel il a été mis par Mario. Pour se faire, il doit traverser la jungle, éviter les crocodiles et les oiseaux, puis recupérer la clé dans un saut périlleux permettant d''ouvrir une des 4 parties de la cage. Jeu très bien rythmé, c''est assurément celui sur lequel j''ai passé le plus de temps durant mon enfance. Nintendo a introduit depuis ce jeu la possibilité de voir le meilleur score réalisé sur la console en appuyant sur Game A et Game B simultanément.',NULL,NULL,NULL,'[]'),
	('ML-102','Mario''s Cement Factory','16/06/1983',NULL,2,'New widescreen','EDIT C''est la 1ère apparition de Junior dans un Game & Watch. Il doit délivrer son père de la cage dans lequel il a été mis par Mario. Pour se faire, il doit traverser la jungle, éviter les crocodiles et les oiseaux, puis recupérer la clé dans un saut périlleux permettant d''ouvrir une des 4 parties de la cage. Jeu très bien rythmé, c''est assurément celui sur lequel j''ai passé le plus de temps durant mon enfance. Nintendo a introduit depuis ce jeu la possibilité de voir le meilleur score réalisé sur la console en appuyant sur Game A et Game B simultanément.',NULL,NULL,NULL,'[]'),
	('NH-103','Manhole','24/08/1983',NULL,2,'New widescreen','EDIT C''est un pur remake de la version Gold, car mis à part un nouveau design des personnages et du fond, le gameplay, lui, reste rigoureusement le même.',NULL,NULL,NULL,'[]'),
	('TF-104','Tropical Fish','08/07/1985','TropicalFish',3,'New widescreen','EDIT Ce jeu est le plus coloré de tous les Game & Watch. Le but est de faire passer les poissons qui veulent s''échapper, d''un aquarium à l''autre en traversant l''écran bocal à la main. Le gameplay ressemble étrangement à celui de Fire, à la différence près qu''il y a 4 position possible du personnage (contre 3 dans Fire), et que les poissons peuvent aller dans les 2 sens (en Game B).',NULL,NULL,NULL,'[]'),
	('YM-105','Super Mario Bros.','07/03/1988',NULL,3,'New widescreen','EDIT Ah ! Voilà The Game ! Le Super Mario Bros, licence qui a fait connaitre le personnage de Mario dans le monde entier sur NES quelques années plus tôt, revient sur Game & Watch. (Bon en réalité, il est sorti presque 2 ans plus tôt dans la série Crystal Screen, mais c''est souvent le new widescreen que l''on retient) Une véritable prouesse technologique et bardé d''ingéniosité sur écran LCD, faisant défiler l''écran en scrolling horizontal, comme initié dans Squish, afin d''adapter son jeu de plateforme. Nintendo usera alors de cette technique à plusieurs reprise dans Climber et Balloon Fight.8 mondes bien réussi, où l''on retrouve tout l''univers du Mario que l''on a connu par la suite : Koopa, 1up, Lakitu, l''étoile, Bullet Bill, Peach ...',NULL,NULL,NULL,'[]'),
	('DR-106','Climber','08/03/1988',NULL,5,'New widescreen','EDIT ',NULL,NULL,NULL,'[]'),
	('BF-107','Balloon Fight','xx/03/1988','BallooonFight',5,'New widescreen','EDIT ',NULL,NULL,NULL,'[]'),
	('MB-108','Mario The Juggler','26/03/1983',NULL,5,'New widescreen','EDIT Ceci est le dernier Game & Watch qui sortira. Et c''est avec Mario que Nintendo termine son épopée de ses jeux électroniques. Il faut remarquer que Nintendo a commencé par un jeu avec un jongleur et terminera avec Mario le jongleur, un clin d''oeil très bien trouvé où les développeurs s''en sont donnés à coeur joie : graphisme soignés, couleurs pétante, une sorte de bouquet final.',NULL,NULL,NULL,'[]'),
	('RGW-001','Ball','xx/xx/2010',NULL,1,'Reedition','EDIT ',NULL,NULL,NULL,'[]');


INSERT INTO "specimen" ("user_id", "modelId", "restoration", "variation") 
VALUES 
	(1,'CN-07', NULL,'Polariseur abimé. Le jeu ne répondait pas. Un nettoyage au cure dent de la zone de contact des boutons a resolu le problème'),
	(1,'PR-21',NULL,NULL),
	(1,'OC-22',NULL,NULL),
	(1,'PP-23',NULL,NULL),
	(1,'MC-25',NULL,NULL),
	(1,'FR-27',NULL,NULL),
	(1,'FR-27',NULL,'green'),
	(1,'TL-28',NULL,NULL),
	(1,'ID-29',NULL,NULL),
	(1,'SP-30',NULL,NULL),
	(1,'OP-51',NULL,NULL),
	(1,'DK-52',NULL,NULL),
	(1,'DM-53',NULL,NULL),
	(1,'GH-54',NULL,NULL),
	(1,'JR-55',NULL,NULL),
	(1,'MW-56',NULL,NULL),
	(1,'TC-58',NULL,NULL),
	(1,'BJ-60',NULL,NULL),
	(1,'MG-61',NULL,NULL),
	(1,'ZL-65',NULL,NULL),
	(1,'DJ-101',NULL,NULL),
	(1,'ML-102',NULL,NULL),
	(1,'RGW-001',NULL,NULL);

