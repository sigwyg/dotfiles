local wezterm = require 'wezterm'

return {
  -- 間違えやすい文字: 1-l-I, 0-O 
  -- 日本語例文：どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。この書生というのは時々我々を捕えて煮て食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。ただ彼の掌に載せられてスーと持ち上げられた時何だかフワフワした感じがあったばかりである。掌の上で少し落ちついて書生の顔を見たのがいわゆる人間というものの見始であろう。この時妙なものだと思った感じが今でも残っている。第一毛をもって装飾されべきはずの顔がつるつるしてまるで薬缶だ。その後猫にもだいぶ逢ったがこんな片輪には一度も出会わした事がない。のみならず顔の真中があまりに突起している。そうしてその穴の中から時々ぷうぷうと煙を吹く。どうも咽せぽくて実に弱った。これが人間の飲む煙草というものである事はようやくこの頃知った。
  --font = wezterm.font('RictyDiminishedLig'),
  font = wezterm.font('RictyDiminishedLig Discord'),
  --font = wezterm.font('SF Mono Square'),
  --font = wezterm.font('Cica'),
  font_size = 16.0,
  --color_scheme = "Solarized Dark - Patched",
  color_scheme = "Tangoesque (terminal.sexy)",


  -- Resize Pane
  keys = {
    {
      key = 'p',
      mods = 'SHIFT|CTRL',
      action = wezterm.action.ActivateKeyTable { name = 'resize_pane', one_shot = false }
    },
  },

  key_tables = {
    resize_pane = {
      { key = 'h', action = wezterm.action.AdjustPaneSize { "Left", 1 } },
      { key = 'j', action = wezterm.action.AdjustPaneSize { "Down", 1 } },
      { key = 'k', action = wezterm.action.AdjustPaneSize { "Up", 1 } },
      { key = 'l', action = wezterm.action.AdjustPaneSize { "Right", 1 } },
      { key = 'Escape', action = 'PopKeyTable' },
    },
  },

}
