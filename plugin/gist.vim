lua <<LUA
local api, cmd, fn = vim.api, vim.cmd, vim.fn
local Mod = {}

function Mod.gist_create(bang, args)
  local name = api.nvim_buf_get_name(0)
  print(fn.system("gh gist create " .. table.concat(args, " ") .. " " .. name))
end

_G.Gist = Mod
LUA

command! -bang -nargs=* GistCreate
      \ :call luaeval("Gist.gist_create(_A[1], _A[2])", [<bang>0, [<f-args>]])
