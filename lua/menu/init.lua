local menu = require("which-key")

--[[
menu.register({
  ["<Leader>"] = {
    c = {
      name = "+Comment",
      l = {":CommentToggle<CR>", "Comment Line"},
      p = {":'<,'>CommentToggle<CR>", "Comment Selection"},
    }
  }
})
]]--

menu.register({
  ["<Leader>"] = {
    d = {
      name = "+Diagnostic",
      d = {":TroubleToggle<CR>", "Show Diagnostic"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    m = {
      name = "+Markdown",
      o = {":MarkdownPreview<CR>", "Start Preview"},
      c = {":MarkdownPreviewStop<CR>", "Stop Preview"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    e = {
      name = "+Explorer", 
      e = {":NvimTreeToggle<CR>", "Toggle Explorer"},
      o = {":NvimTreeOpen<CR>", "Open Explorer"},
      c = {":NvimTreeClose<CR>", "Close Explorer"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    b = {
      name = "+Buffer (Tabs)", 
      c = {":BufferLinePickClose<CR>", "Close Selection"},
      o = {":BufferLinePick<CR>", "GoTo Selection"},
      n = {":BufferLineMoveNext<CR>", "Move Next"},
      p = {":BufferLineMovePrev<CR>", "Move Prev"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    f = {
      name = "+Terminal", 
      f = {":ToggleTerm direction=float<CR>", "Floating"},
      h = {":ToggleTerm direction=horizontal<CR>", "Horizontal"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    t = {
      name = "+Telescope", 
      f = {":Telescope find_files<CR>", "Files"},
      l = {":Telescope live_grep<CR>", "Live Grep"},
      t = {":Telescope buffers<CR>", "Open Editors"},
      p = {":Telescope planets<CR>", "Secret"},
    }
  }
})

menu.register({
  ["<Leader>"] = {
    g = {
      name = "+Git Actions", 
      l = {":Gitsigns toggle_signs<CR>", "Toggle Git Changes Sign"},
      s = {":Telescope git_status<CR>", "Git Status"},
      c = {":Telescope git_commits<CR>", "Git Commits"},
      b = {":Telescope git_branches<CR>", "Git Branches"},
    }
  }
})




