# Blurred fox

### A modern Firefox CSS Theme

| Default Color Scheme |
| --- |
| ![screenshot](scrot/default.webp) |

| Dark Color Scheme |
| --- |
| ![screenshot](scrot/dark.webp) |

| Light Color Scheme |
| --- |
| ![screenshot](scrot/light.webp) |

## How to

### Quick install for the linux lads

1. Run
  
  ```bash
  $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/manilarome/blurredfox/master/install.sh)"
  ```

2. After the confirmation message that the theme is successfully installed, open firefox. Change colorscheme by **`Open Menu > Customize > Change Colorscheme`**.

#### Installation notes:

+ It is advisible to check the script first before running it.
+ You need `bash` to run it.
+ The script will fail if you have multiple profile directory! Make sure you only have one!
+ If you have a current chrome folder in your profile directory, the script will make a backup.
+ If the installation script is not working, a PR is welcome!

### Manual Installation for linux lads

1. Open the Firefox Menu located on the top-right corner with a humburger menu(three horizontal lines).
2. Select `Preferences`, then `Preferences` again.
3. Go to `Advanced`, find the `Config Editor` button then press it.
4. A dialog will warn you, but ignore it, ~~just do it~~ press the `I accept the risk!` button.
5. Search for **`toolkit.legacyUserProfileCustomizations.stylesheets`**, **`layers.acceleration.force-enabled`**, **`gfx.webrender.all`**, and **`svg.context-properties.content.enabled`**. Make sure to **enable them all!**
6. Go to your Firefox profile located in `$HOME/.mozilla/firefox/XXXXXXX.default-XXXXXX/`.
7. Create a folder and name it **`chrome`**, then assuming that you already clone this repo, just copy the theme to `chrome` folder.
8. Finally, you can now change whatever colorscheme you want.

## Note

### If you're using Windows or macOS and something's wrong

1. **Sadly, I only have archlinux, so I cannot guarantee that it will work on Windows10 and macOS. A feedback is welcome if it works on your platform. PR is also welcome!**

### If there's no blur effect

1. **The theme does not provide the blur effect!** Make sure you have a compositor with blur support running! KDE Plasma, macOS, and Windows 10 have this by default, but you need to enable it! If you're using linux, use tryone144's [feature/dual_kawase](https://github.com/tryone144/picom/tree/feature/dual_kawase) branch of picom. It includes the dual kawase shader.

### If you're using Plasma and there's no blur effect,

1. Enable the blur in your compositor. Go to `System Settings > Desktop Effects > Enable Blur`. Note that this will not enable the blur effect on all applications.

2. Enable the blur effect on all applications by installing a KWin script called [Force Blur](https://store.kde.org/p/1294604/).

3. Go to `System Settings > KWin Scripts > Enable Force Blur`.

### Scrollbar is missing

1. The scrollbar is hidden by default, you can enable/show it by changing the value of `scrollbar-width` in `userContent.css`.

## TODO

PR's are welcome!

- [] Move window controls to navbar <sup>send help</sup>
- [] Fix inconsistencies
- [] Better CSS
