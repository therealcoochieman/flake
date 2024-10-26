local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
    vim.notify("auto-pairs could not be loaded")
    return
end

local ok, cmp_auto = pcall(require, "nvim-autopairs.completion.cmp")
if not ok then
    vim.notify("autopairs.lua: could not load nvim-autopairs.completion.cmp module")
end

local ok, cmp = pcall(require, "cmp")
if not ok then
    vim.notify("autopairs.lua: could not load cmp module")
end

cmp.event:on(
    'confirm-done',
    cmp_auto.on_confirm_done()
)

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    },

    enable_check_bracket_line = false,
    -- ignored_next_char = "[%w%.]",
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      before_key = 'h',
      after_key = 'l',
      cursor_pos_before = true,
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      manual_position = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})
