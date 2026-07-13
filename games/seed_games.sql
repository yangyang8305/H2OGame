-- ===========================================================
-- H2OGame 初始化游戏数据
-- 如果你的数据库前缀不是 H2O_，请全文替换后执行
-- 游戏文件已存放在网站根目录 games/ 下
-- ===========================================================

-- 先确保中文分类存在（如需要可手动添加）
INSERT IGNORE INTO `H2O_GameCategory` (`categoryId`, `name`) VALUES
(100, 'Puzzle'),
(106, 'Arcade');

-- 2048
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  '2048',
  '2048 数字拼图',
  '经典益智游戏！用方向键或滑动将相同数字的方块合并，尽量凑出 2048 获得胜利。支持键盘和手机滑动操作。',
  '2048,益智,数字,拼图,puzzle,单机游戏',
  'games/2048/thumb.png',
  'games/2048/index.html',
  100,
  NOW(), 0, 0, 0, 0
);

-- 贪吃蛇
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'snake',
  '贪吃蛇',
  '贪吃蛇经典复刻！控制小蛇吃食物长大，避免撞墙和自己的身体。吸食越多速度越快，支持键盘和屏幕按钮操作。',
  '贪吃蛇,snake,贪吃,小蛇,街机,arcade,经典游戏',
  'games/snake/thumb.png',
  'games/snake/index.html',
  106,
  NOW(), 0, 0, 0, 0
);

-- 六消 Hextris
INSERT INTO `H2O_Game` (`name`, `title`, `description`, `keywords`, `thumb`, `file`, `categoryId`, `addedDate`, `downloads`, `votes`, `score`, `views`)
VALUES (
  'hextris',
  '六消 Hextris',
  '创新型六边形消除游戏！彩色方块从外圈落入六边形，同色3个相同颜色即可消除。用左右旋转控制落点位置，考验反应和预判。',
  '六消,hextris,彩色,消除,六边形,益智,puzzle',
  'games/hextris/thumb.png',
  'games/hextris/index.html',
  100,
  NOW(), 0, 0, 0, 0
);

-- ===========================================================
-- 执行完成后可验证：
-- SELECT gameId, name, title, categoryId FROM H2O_Game;
-- ===========================================================
