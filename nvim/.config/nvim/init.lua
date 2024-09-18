-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 显示行号
vim.opt.number = true            -- 普通行号
vim.opt.relativenumber = true     -- 相对行号

-- 缩进设置
vim.opt.tabstop = 4               -- 一个 Tab 显示为 4 个空格
vim.opt.shiftwidth = 4            -- 自动缩进时用 4 个空格
vim.opt.expandtab = true          -- 将 Tab 转为空格
vim.opt.autoindent = true         -- 自动缩进当前行
vim.opt.smartindent = true        -- 智能缩进

-- 搜索设置
vim.opt.ignorecase = true         -- 搜索时忽略大小写
vim.opt.smartcase = true          -- 如果包含大写字母，搜索时自动区分大小写
vim.opt.hlsearch = true           -- 高亮显示搜索结果
vim.opt.incsearch = true          -- 输入搜索内容时逐步显示匹配结果

-- 光标行与列
vim.opt.cursorline = true         -- 高亮当前行
vim.opt.cursorcolumn = false      -- 不启用光标所在列的高亮

-- 可视化效果
vim.opt.termguicolors = true      -- 启用 24 位 RGB 色彩支持
vim.opt.signcolumn = "yes"        -- 显示左侧的标记列
vim.opt.scrolloff = 8             -- 在窗口中保留 8 行的上下间距
vim.opt.sidescrolloff = 8         -- 左右滚动时的间距

-- 备份和撤销
vim.opt.backup = false            -- 不生成备份文件
vim.opt.writebackup = false       -- 不在写入时生成备份文件
vim.opt.swapfile = false          -- 不生成交换文件
vim.opt.undofile = true           -- 启用撤销文件，关闭后可撤销操作

-- 性能优化
vim.opt.updatetime = 300          -- 更快的刷新时间，默认为 4000ms
vim.opt.timeoutlen = 500          -- 映射按键超时时间，默认为 1000ms

-- 分割窗口优化
vim.opt.splitbelow = true         -- 水平分割窗口时，新窗口在下方
vim.opt.splitright = true         -- 垂直分割窗口时，新窗口在右侧

-- 系统剪贴板
vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板

-- 禁用模式提示
vim.opt.showmode = false          -- 不显示模式提示 (例如 -- INSERT --)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "nvim-tree/nvim-tree.lua",
          dependencies = {
              "nvim-tree/nvim-web-devicons", -- 可选图标插件
          },
      config = function()
        require("nvim-tree").setup()  -- 默认配置
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
