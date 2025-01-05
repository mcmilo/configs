vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('ellisonleao/gruvbox.nvim')
  use('dracula/vim')
  use('EdenEast/nightfox.nvim')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-tree/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim')
  use('nvim-treesitter/nvim-treesitter')
  use('tpope/vim-fugitive')
  use('tpope/vim-commentary')
  use('tpope/vim-surround')
  use('tpope/vim-unimpaired')
  use('tpope/vim-repeat')
  use('theprimeagen/harpoon')
  use('m4xshen/autoclose.nvim')
  use('alvan/vim-closetag')
  use('preservim/vimux')
  use('christoomey/vim-tmux-navigator')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
  }
  use ('nvim-neotest/nvim-nio')
  use {
    'mfussenegger/nvim-dap',
    requires = {
      {'rcarriga/nvim-dap-ui'},
      {'theHamsta/nvim-dap-virtual-text'},
      {'mxsdev/nvim-dap-vscode-js'}
    }
  }
  use 'anuvyklack/hydra.nvim'
  use {
    'tadmccorkle/markdown.nvim',
    requires = {
      {'tree-sitter-grammars/tree-sitter-markdown'}
    }
  }
end)
