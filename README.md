# Desktop-Shell 
### A Clean & Simple Desktop Shell Built for Hyprland

> [!NOTE]
> As I initially made this just for my own use, there is currently no built-in settings menu. You will have to edit the files directly.

## Previews


![](/assets/readme/bar1.png)

![](/assets/readme/bar3.png)

![](/assets/readme/logout1.png)


---

# Features

##### Matugen ready
- Supports dynamic color changing. Just change `Colors.qml` with matugen and the Shell colors will update immediately.
##### Clean & compact
- Built to be clean & usable with things you would normally need, nothing more.
##### Spotify Integration
- A compact Spotify media widget that supports toggling play/pause. 
##### Wlogout style logout menu
- A horizontal Wlogout style menu. You can change each buttons command in `shell.qml`. Some commands by default are Hyprland specific.

>[!NOTE]
> **Preformance:** On my machine this shell uses around ~196 MiB.

---

## Installation

```bash
# Run 'qs' or 'quickshell' to make sure you have Quickshell installed
qs

# (Optional) Backup any previous quickshell files
mv ~/.config/quickshell/ ~/.config/quickshell.bak/

# Create config directory (if you don't have one already)
mkdir ~/.config/quickshell/

# Go into quickshell config directory
cd ~/.config/quickshell/

# Git clone this repo
git clone https://github.com/notoruvian/desktop-shell.git
```

---
## Changes you may want to make

##### Change the OS icon
- In `PowerButton.qml` change the image to path to your icon of choice.

##### Get rid of the large gap underneath the bar
- It's there so the drop shadow doesn't get cut off. I know there are probably better ways to handle this and I will probably update it at some point. You can comment out the shadow or change the gap size in `Bar.qml` .

##### Notification Widget does not open anything
- It is currently hard-coded to open swaync from my personal configuration. You can change it to open whatever notification menu you have in `Notifications.qml`.
##### Logout Commands
- Some buttons command's be default are hyprland specific. You can change them in `shell.qml`.

## Inspiration / Copying

- Referenced and copied some code from [nucleus-shell](https://github.com/nucleus-hq/nucleus-shell)
