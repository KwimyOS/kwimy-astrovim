-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.catppuccin" },
    -- import/override with your plugins folder

    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = true,
            -- Optional: you can also toggle transparency for specific UI elements
            integrations = {
                mini = false,
                leap = false,
                neotree = false,
                treesitter = false,
                notify = false,
                sandwitch = false,
            },
        },
    },
}
