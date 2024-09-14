-- 取消兼容模式
vim.opt.compatible = false

-- 行号显示
vim.opt.number = true          -- 显示绝对行号
vim.opt.relativenumber = true  -- 显示相对行号

-- 高亮当前行
vim.opt.cursorline = true

-- 启用语法高亮
vim.cmd('syntax on')

-- 设置缩进
vim.opt.tabstop = 4        -- Tab 键等于 4 个空格
vim.opt.shiftwidth = 4     -- 自动缩进为 4 个空格
vim.opt.expandtab = true   -- 将 Tab 转换为空格

-- 启用鼠标支持
vim.opt.mouse = 'a'

-- 搜索设置
vim.opt.ignorecase = true  -- 搜索忽略大小写
vim.opt.smartcase = true   -- 智能区分大小写
vim.opt.hlsearch = true    -- 高亮搜索结果
vim.opt.incsearch = true   -- 实时搜索

-- 禁用备份文件
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- 更好的显示效果
vim.opt.termguicolors = true

