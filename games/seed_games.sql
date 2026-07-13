-- ===========================================================
-- H2OGame 初始化游戏数据（共 7 款游戏）
-- 如果你的数据库前缀不是 H2O_，请全文替换后执行
-- 游戏文件已存放在网站根目录 games/ 下
-- ===========================================================

INSERT IGNORE INTO `H2O_GameCategory` (`categoryId`, `name`) VALUES
(100, 'Puzzle'),
(106, 'Arcade');

-- 1. 2048
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  '2048', '2048 数字拼图',
  '经典益智游戏！用方向键或滑动将相同数字的方块合并，尽量凑出 2048 获得胜利。支持键盘和手机滑动。',
  '2048,益智,数字,拼图,puzzle,单机',
  'games/2048/thumb.png', 'games/2048/index.html', 100, NOW(), 0, 0, 0, 0
);

-- 2. 贪吃蛇
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'snake', '贪吃蛇',
  '经典复刻！控制小蛇吃食物长大，避免撞墙和自己的身体。吃得越多速度越快，支持键盘和屏幕按钮。',
  '贪吃蛇,snake,小蛇,街机,arcade,经典',
  'games/snake/thumb.png', 'games/snake/index.html', 106, NOW(), 0, 0, 0, 0
);

-- 3. 六消 Hextris
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'hextris', '六消 Hextris',
  '创新型六边形消除游戏！彩色方块从外圈落入六边形，同色3个相同颜色即可消除。左右旋转控制落点，考验反应和预判。',
  '六消,hextris,彩色,消除,六边形,益智',
  'games/hextris/thumb.png', 'games/hextris/index.html', 100, NOW(), 0, 0, 0, 0
);

-- 4. 打砖块
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'breakout', '打砖块',
  '经典弹球打砖块游戏！用挡板将小球弹出去打碎所有砖块。小心别让球落地，支持鼠标和触摸操作。',
  '打砖块,breakout,弹球,弹球游戏,研磨,arcade,小球',
  'games/breakout/thumb.png', 'games/breakout/index.html', 106, NOW(), 0, 0, 0, 0
);

-- 5. 五子棋
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'gomoku', '五子棋',
  '经典五子棋对弈 AI！黑棋为人，白棋为 AI。第一个连成五子的一方获胜。点击棋盘落子，支持手机操作。',
  '五子棋,gomoku,棋类,AI,益智,对弈,策略',
  'games/gomoku/thumb.png', 'games/gomoku/index.html', 100, NOW(), 0, 0, 0, 0
);

-- 6. 俄罗斯方块
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'tetris', '俄罗斯方块',
  '世界级经典不过！让方块全行消除得分，天花板套員加分。带预览面板、鬼魂方块和分级加速。',
  '俄罗斯,tetris,方块,消除,益智,经典游戏',
  'games/tetris/thumb.png', 'games/tetris/index.html', 100, NOW(), 0, 0, 0, 0
);

-- 7. Stack 叠叠乐
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'stack', 'Stack 叠叠乐',
  '一点就放下方块，对准就能叠高！错开的部分会被切掉，方块越来越小。镇定心怀，挑战自己的极限！',
  'stack,叠叠乐,叠方块,休闲,投数,节奏',
  'games/stack/thumb.png', 'games/stack/index.html', 106, NOW(), 0, 0, 0, 0
);

-- ===========================================================
-- 执行完成后可验证：
-- SELECT gameId, name, title, categoryId FROM H2O_Game;
-- ===========================================================
