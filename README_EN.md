# 📍 jp_coords - Fast Coordinate Capture

An optimized script for FiveM servers that makes capturing coordinates faster and easier for developers and administrators.

Forget typing repetitive commands or copying coordinates line by line from the F8 console. With **jp_coords**, simply enable capture mode, walk around the map, and save multiple coordinates with a single key press.

Preview: https://youtu.be/PW_smek3JCA

## 🚀 Features

- **Clean Interface:** Uses the native `ox_lib` TextUI to display on-screen instructions.
- **Fast Capture:** Instantly save coordinates by pressing the `E` key (configurable).
- **Automatic Multi-Format Output:** Saves every coordinate simultaneously as `vec3`, `vec4`, `table_vec3`, and `table_vec4`, ready to copy and paste into any script.
- **Discord Integration:** Sends captured coordinates directly to one or more Discord channels through Webhooks, formatted as Lua code blocks.
- **Local Saving:** Automatically appends captured data to a `.txt` file inside the resource folder.
- **Secure:** Built-in permission system using `ox_lib`, ensuring only administrators can access the command.
- **Optimized:** **0.00ms** resmon usage while idle.

## 📦 Dependencies

- [ox_lib](https://github.com/overextended/ox_lib) (Required for the UI and command system)

## 🛠️ Installation

1. Download or clone this repository.
2. Place the `jp_coords` folder inside your server's `resources` directory.
3. Make sure the `coordenadas.txt` file exists and is empty inside the resource folder.
4. Add `ensure jp_coords` to your server.cfg after ox_lib.

## ⚙️ Configuration

```lua
Config.CommandName = 'pegarvec'
Config.AdminGroup = 'group.admin'
Config.KeyToPress = 38
Config.SaveFile = 'coordenadas.txt'

Config.Webhooks = {
    'YOUR_DISCORD_WEBHOOK_HERE',
}
```

## 💻 Usage

1. Run the configured command (default: `pegarvec`).
2. Capture mode is enabled.
3. Press **E** at the desired location.
4. Optionally enter a location name.
5. Press Enter to save locally and send to Discord.
6. Repeat as needed.
7. Run the command again to disable capture mode.

## 📄 Output Example

```lua
name = 'forumdrive',
coords = vec3(-168.07, -1662.80, 33.31),
coords = vec4(-168.07, -1662.80, 33.31, 137.50),
table_vec3 = { x = -168.07, y = -1662.80, z = 33.31 },
table_vec4 = { x = -168.07, y = -1662.80, z = 33.31, w = 137.50 },
```

---

**Developed for the FiveM community.** Feel free to fork the project, submit Pull Requests, or report issues in the Issues section.