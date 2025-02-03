# My Neovim Configuration

This is my personal Neovim configuration. It is a work in progress and I am constantly tweaking it to make it better (for me). I have tried to keep it as modular and organized as possible, so that it is easy to understand and modify.

It uses the Lazy Plugin Manager, and each plugin is defined in a separate file in the [Plugins](./lua/config/plugins) directory. The main configuration file is [init.lua](./lua/config/init.lua), which sources all the plugin files and sets up the keybindings.

## Installation

1. Clone this repository to `~/.config/nvim`:

```bash
git clone https://github.com/luizgustavojunqueira/nvim
```

2. Open Neovim and let it install the plugins.

3. Enjoy!

## Optional Steps

### LSP

In order to use the Language Server Protocol (LSP), you need to install the language servers for the languages you want to use. You can find the list of available language servers, and instal them using the `:Mason` command.

### AI Assistants

If you want to use an AI assistant, that suggests code completions, let you chat with it, and more, you can setup it ith the CodeCompanion plugin. By default, it uses the GitHub Copilot plugin, but you can change it to use other models, like OpenAI's, Local Ollama, etc.

### GitHub Copilot

1. Install the GitHub Copilot plugin:

```bash
git clone https://github.com/github/copilot.vim.git \
~/.config/nvim/pack/github/start/copilot.vim
```

2. Setup the GitHub Copilot plugin:

- Inside Neovim, run `:Copilot setup` and follow the instructions.
- You will need to have a GitHub account.
- Then, you can run `:Copilot enable` to start using the plugin.

### Another AI Assistant

In order to use another AI assistant, you need to change the configuration in [plugins/codecompanion.lua](./lua/config/plugins/codecompanion.lua). There is an example configuration for the Local Ollama model. If you want to use another assistant, you can look at the [CodeCompanion](https://codecompanion.olimorris.dev/configuration/adapters.html) documentation.

## Keybindings

There are some keybindings that are defined in the [remap.lua](./lua/config/remap.lua) file.

The `<leader>` key is set to `<Space>`.

All keybindings that are prefixed with `<leader>` and some other that are multi-key sequences can be shown by pressing the first key and waiting a bit. The keybindings will be shwon on the bottom of the screen.

Some of them are just QoL improvements, like:

- `J` and `K` to move the current line up and down in Visual Mode.
- `<leader>e` to open the file explorer.
- `<leader>d` to open the diagnostics window for the errors under the cursor.
- `<Up>`, `<Down>`, `<Left>`, and `<Right>` to resize splits.
- `<leader>v` to split the window vertically.
- `<leader>h` to split the window horizontally.
- `<leader>j` to replace the word under the cursor.

### Searching

- `<leader>ff` to search for a file in the current project.
- `<leader>fg` to search for a string in the current project.
- `<leader>fb` to search for a buffer.
- `<leader>fr` to search for all references of the word under the cursor in the current project.
- `<leader>fd` to search for the definition of the word under the cursor in the current project.

### Undo and Redo

- `<leader>u` to open the undo tree.

### Git

- `<leader>lg` to open LazyGit.

### LSP

- `<C-Space>` to trigger the completion.
- `<C-e>` to close the completion.
- `<C-y>` to confirm the completion.
- `<C-n>` and `<C-p>` to navigate through the completion items.
- `<C-d>` and `<C-u>` to scroll the completion item documentation.
- `gd` to go to the definition of the symbol under the cursor.
- `gD` to go to the declaration of the symbol under the cursor.
- `gr` to go to the references of the symbol under the cursor.
- `gi` to go to the implementation of the symbol under the cursor.
- `go` to go to the type definition of the symbol under the cursor.
- `gs` to go to the signature of the symbol under the cursor.
- `K` to show the documentation of the symbol under the cursor.
- `<F2>` to rename the symbol under the cursor.
- `<F3>` to format the current buffer.
- `<F4>` to show the code actions available for the symbol under the cursor.

### Terminal

- `<leader>tt` to open a terminal.
- `<leader>tn` to open a new terminal.

### Harpoon

- `<leader>he` to open the Harpoon Explorer.
- `<leader>ha` to add the current file to the Harpoon Explorer.
- `<C-h>` to go to the first bookmark.
- `<C-j>` to go to the second bookmark.
- `<C-k>` to go to the third bookmark.
- `<C-l>` to go to the fourth bookmark.

### CodeCompanion

- `<leader>cc` to open the CodeCompanion chat.
- `<leader>ca` to open the CodeCompanion actions.
- `<leader>cp` to open the CodeCompanion prompt.
