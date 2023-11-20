local M = {
    'kepano/flexoki-neovim',
    name = 'flexoki',
    config = function()
        require("lazy").setup({
            { 'kepano/flexoki-neovim', name = 'flexoki' }
        })
    end
}

return M;
