-- Bootstrap Packer
local boostrap_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  else
  return false
  end
end

local packer_bootstrap = boostrap_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return { require('packer').startup(function(use)
  -- My plugins here
  use {'wbthomason/packer.nvim'} -- Package manager
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x', requires =  {'nvim-lua/plenary.nvim'}
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)}
