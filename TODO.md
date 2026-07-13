# 待办：添加 Digital-Will 游戏合集

## 背景
Digital-Will-Inc/html5-games 是一个包含 20 款浏览器游戏的开源合集（MIT 许可），
计划通过 Git Submodule 方式整体引入，保持原始文件结构，确保游戏可正常运行。

## 包含的游戏
- Snake（贪吃蛇）
- emoji-minesweeper（Emoji 扫雷）
- sokoban（推箱子）
- BlockFall（方块下落 / 俄罗斯方块类）
- TowerBlocks（叠叠乐）
- ColorMatch（颜色匹配）
- Flip-Card（翻牌记忆）
- HexGL（3D 六边形赛车）
- crossy-roads（过马路）
- CircleNinja（切圆圈）
- CirclePath
- Coil
- Align-4-Game（四子棋）
- 0hn0
- Nail
- p2ball
- pond
- 以及其他游戏目录

## 执行步骤（在本地终端运行）

```bash
# 1. 克隆仓库到本地（如果尚未克隆）
git clone https://github.com/yangyang8305/H2OGame.git
cd H2OGame

# 2. 添加子模块
git submodule add https://github.com/Digital-Will-Inc/html5-games.git games/digital-will

# 3. 提交并推送
git add .gitmodules games/digital-will
git commit -m "feat: add Digital-Will html5-games collection as submodule"
git push origin master
```

## 完成后效果
- `games/digital-will/` 目录下会有全部游戏
- 每款游戏通过 GitHub Pages 可直接访问，例如：
  `https://yangyang8305.github.io/H2OGame/games/digital-will/Snake/src/index.html`
- 完成后通知 AI 更新游戏大厅首页，把这 20 款游戏的入口卡片全部加进去

## 广告位规划
每款游戏在以下节点插入广告：
- 游戏加载启动时 → 插屏广告
- 游戏结束/死亡 → 激励视频广告（看广告继续/复活）
- 页面底部常驻 → 横幅广告
