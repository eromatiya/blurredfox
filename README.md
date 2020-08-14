## blurredfox

### A modern Firefox CSS Theme

| Default Colorscheme (Uses System Colors) |
| --- |
| ![screenshot](scrot/default.webp) |

| Dark Colorscheme |
| --- |
| ![screenshot](scrot/dark.webp) |

| Light Colorscheme |
| --- |
| ![screenshot](scrot/light.webp) |

## Requirements

+ Latest stable Firefox
+ Compositor with blur shader (optional)
+ Linux machine - untested on macOS and Windows10 - might work though

## How to

### Quick install for the linux lads with stable builds

1. Run:
  
  ```bash
  $ bash -c "$(curl -fsSL https://raw.githubusercontent.com/manilarome/blurredfox/master/install.sh)"
  ```

2. After the confirmation message that the theme is successfully installed, open firefox. Change colorscheme by **`Open Menu > Customize > Change Colorscheme`**.

#### Installation notes:

+ Firefox's stable builds are only supported at the moment.
+ It is advisible to check the script first before running it.
+ You need `bash` to run it.
+ The script will fail if you have multiple profile directory! Make sure you only have one!
+ If you have a current chrome folder in your profile directory, the script will make a backup.
+ If the installation script is not working, a PR is welcome!

### Manual Installation

1. Open `about:config` page.
2. A dialog will warn you, but ignore it, ~~just do it~~ press the `I accept the risk!` button.
3. Search for these:

	+ **`toolkit.legacyUserProfileCustomizations.stylesheets`**
	+ **`layers.acceleration.force-enabled`**
	+ **`gfx.webrender.all`**
	+ **`gfx.webrender.enabled`**
	+ **`layout.css.backdrop-filter.enabled`**
	+ **`svg.context-properties.content.enabled`**

	Then make sure to **enable them all!**

4. Go to your Firefox profile.
	+ Linux - `$HOME/.mozilla/firefox/XXXXXXX.default-XXXXXX/`.
	+ Windows 10 - `C:\Users\<USERNAME>\AppData\Roaming\Mozilla\Firefox\Profiles\XXXXXXX.default-XXXXXX`.
	+ macOS - `Users/<USERNAME>/Library/Application Support/Firefox/Profiles/XXXXXXX.default-XXXXXXX`.

5. Create a folder and name it **`chrome`**, then assuming that you already have cloned this repo, just copy the theme to `chrome` folder.
6. Restart Firefox.
7. Finally, you can now change whatever colorscheme you want in the Cusomization Window.

	+ Default - Uses system colors, but uses the theme's layout.
	+ Dark - Dark colorscheme. Good for the night.
	+ Light - Bright colorscheme. Good for killing the eyes.

## Note

### Some UI are broken!

1. Check if you're using the latest stable version of Firefox.
2. If you're not using Linux check the next note below.

### If you're using Windows or macOS and something's wrong

1. I only have Archlinux, so I cannot guarantee that it will work on Windows 10 and macOS without a problem. A feedback and a PR is absolutely welcome! All you can do or try is to install the theme, then change the value of `--bf-moz-appearance` variable to either `-moz-win-glass` if windows and `-moz-mac-vibrancy-dark` if macOS. Still, do no expect that it will work without a problem. The platforms are untested!

### Liar! Your theme's name is `blurredfox`, ***where is the blur***?!

1. Yeah, the name `blurredfox` is a lie, just like the cake. I named it blurredfox because it's designed to look gorgeous with a blur effect. You can, however, have the blur effect by:

	+ Making sure you have a compositor and it supports blur.
	+ If you're not using GNOME or KDE Plasma that has its own compositors, use tryone144's [feature/dual_kawase](https://github.com/tryone144/picom/tree/feature/dual_kawase) branch of picom. It includes the dual kawase shader.
	+ GNOME's compositor, mutter, doesn't support blur. Hey, GNOME devs, it's already 2020. Just kidding!
	+ If you're using KDE Plasma, read the next note below.

### I'm using KDE Plasma, but there's no blur! How many other lies have I been told by the council?

1. Enable the blur in your compositor. Go to `System Settings > Desktop Effects > Enable Blur`. Note that this will not enable the blur effect on all applications.
2. Enable the blur effect on all applications by installing a KWin script called [Force Blur](https://store.kde.org/p/1294604/). Make sure to read its manual. Don't you ever dare to create an issue about Force Blur! Just kidding! But yeah, I'm serious.
3. Go to `System Settings > KWin Scripts > Enable Force Blur`.
4. Change its settings. If there's no settings/settings icon, Logout. Re-login.

### Where is the scrollbar?

1. You can adjust the value of `scrollbar-width` in `userContent.css`.
2. Restart Firefox.

### I hate the colors! Why is everything transparent?!

1. You can change the colors in `userChrome.css`.
2. The transparency is only applied to `Dark` and `Light` colorschemes. `No transparency == No blur`.

## Got a problem?

If you have already read the README, free to open an issue [here](https://github.com/manilarome/blurredfox/issues)!

## Got a patch?

You're absolutely welcome to submit a pull request [here](https://github.com/manilarome/blurredfox/pulls)!

## TODO

PR's are welcome!

- [ ] Render site content under the navbar like macOS
- [ ] Fix UI inconsistencies
- [ ] Better CSS
