-- Red is the accent, not the active-window border.
hl.config({
  general = { col = { active_border = "#747474", inactive_border = "#414141" } },
  group = { col = { border_active = "#747474", border_inactive = "#414141" } },
})
-- Theme-local material rules; no external Lua dependency.
hl.config({
  decoration = {
    blur = {
      enabled = true,
      size = 6,
      passes = 2,
      ignore_opacity = false,
    },
  },
})

-- Keep Omarchy's app opt-outs; fullscreen content stays opaque.
o.window({ tag = "default-opacity" }, {
  name = "nothing-default-glass",
  opacity = "0.985 override 0.96 override 1.0 override",
})

-- Subtle glass for text work, without making inactive text hard to read.
o.window({ class = "^(foot|footclient|Alacritty|kitty|com.mitchellh.ghostty|org.wezfurlong.wezterm)$" }, {
  name = "nothing-terminal-glass",
  opacity = "0.96 override 0.93 override 1.0 override",
  no_blur = false,
})
o.window({ class = "^(org.gnome.Nautilus|thunar|Thunar|org.kde.dolphin)$" }, {
  name = "nothing-files-glass",
  opacity = "0.97 override 0.95 override 1.0 override",
  no_blur = false,
})

-- Do not wash out web pages or video content.
o.window({ class = "^(chromium|google-chrome|firefox|org.mozilla.firefox|mpv|vlc|org.videolan.VLC)$" }, {
  name = "nothing-content-opaque",
  opacity = "1.0 override 1.0 override 1.0 override",
})
o.window({ tag = "chromium-based-browser" }, {
  name = "nothing-browser-apps-opaque",
  opacity = "1.0 override 1.0 override 1.0 override",
})

-- Shell alpha lives in shell.toml. Do not multiply layer/text opacity here.
-- Ignore fully transparent margins so full-screen layer windows don't blur
-- an invisible rectangle. Popup surfaces belonging to the bar also get blur.
hl.layer_rule({
  name = "nothing-shell-glass",
  match = { namespace = "^omarchy-(bar|menu|clipboard|emojis|keyboard-panel|notifications|osd|polkit|network-qr|reminders)$" },
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.05,
})
