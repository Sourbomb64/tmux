# My Tmux Configuration

- Order to Files
- Nicene to Tmux
- Committed to Everywhere
- Happiness to Developer

## Installation
### Prerequisites

Before installing, ensure you have the following on your system:
* **[Tmux](https://github.com/tmux/tmux/wiki)** (v3.0 or higher recommended)
* **Git**
* **[A Nerd Font](https://www.nerdfonts.com/)**  to look nice

### Script Install
1. Run (Trust me Bro) Script
``` bash
curl -sL "https://raw.githubusercontent.com/username/repo/main/setup-tmux.sh" | bash
```

## File Structure

This configuration is designed to be modular. Plugin-specific settings are separated from the core configuration to keep things clean. I like smaller files.

```text
~/${TMUX_BASE_PATH}/
├── tmux.conf                 # Main configuration file and TPM initialization
├── plugin-config/
│   └── plugin-name.conf      # Example plugin config
└── plugins/                  # Directory for TPM and installed plugins (do not track in git)
```

## Custom Keybindings

| Keybind | Action | Description |
| :--- | :--- | :--- |
| `prefix + r` | Reload Config | Hot-reloads `tmux.conf` and displays a confirmation message. |
TODO: add more later.

## Plugins
Current plugin list
- TPM 
- tmux-Sensible
- Rose-Pine Theme

## How to Expand 

- add your plugin like normal in `tmux.conf`
- add config file into `plugin-config` 
- add point to your plugins config in `tmux.conf`
- add to readme list

### add to tmux.conf
```example.config
# In > List of Plugin
set -g @plugin 'plugin-example/tmux'

# In > Sourcing Configs 
source-file ${TMUX_CONF_PATH}/plugin-example.conf
```
