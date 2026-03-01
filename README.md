# kwimy-astrovim

Preseeded AstroVim configuration for Kwimy

## What this package installs

- `/etc/skel/.config/nvim` (AstroVim config)
- `/etc/skel/.local/share/nvim` (preseeded plugins)
- `/etc/skel/.local/state/nvim`

New users created after install get AstroVim ready on first launch

## Preseed helpers

Run this to refresh the preseeded plugins after updating the config:

```sh
./preseed.sh
```


### community.lua
```
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
        neotree = false,
        treesitter = false,
        notify = true,
      },
    },
```

### astroui.lua
```
colorscheme = "catppuccin",
```
