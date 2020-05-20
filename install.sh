#!/usr/bin/env bash

message() { printf "%s\n" "$*" >&2; }

download_bf() {

    message "[>>] Downloading theme..."

    curl -LJ0 https://github.com/manilarome/blurredfox/archive/master.tar.gz | tar -xz -C /tmp/

    if [[ $? -eq 0 ]]; 
    then
        message "[>>] Copying..."

        FF_THEME="/tmp/blurredfox-master/"
        cp -r "${FF_THEME}"* "${CHROME_DIRECTORY}"

        cat > "${CHROME_DIRECTORY}/../user.js" <<'EOL'
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true); 
        user_pref("layers.acceleration.force-enabled", true);
        user_pref("gfx.webrender.all", true);
        user_pref("gfx.webrender.enabled", true);
        user_pref("svg.context-properties.content.enabled", true);
EOL
        if [[ $? -eq 0 ]];
        then
            rm -rf "/tmp/blurredfox-master"
        else
            message " [!!] There was a problem while copying the files. Terminating..."
            return 1
        fi
    else
        message " [!!] Problem detected while downloading the theme. Terminating..."
        return 1
    fi
    cat <<-'EOF'
░█▀▄░█░░░█░█░█▀▄░█▀▄░█▀▀░█▀▄
░█▀▄░█░░░█░█░█▀▄░█▀▄░█▀▀░█░█
░▀▀░░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀░
┏━┛┏━┃┃ ┃
┏━┛┃ ┃ ┛ 
┛  ━━┛┛ ┛
EOF
    message "blurredfox successfully installed! To enable the transparency change the theme to Dark in preferences! Enjoy!"
}


FF_USER_DIRECTORY="$(find "${HOME}/.mozilla/firefox/"  -maxdepth 1 -type d -regextype egrep -regex '.*[a-zA-Z0-9]+.default-release')"

if [[ -n $FF_USER_DIRECTORY ]];
then
    message "[>>] Firefox user profile directory located..."

    CHROME_DIRECTORY="$(find "$FF_USER_DIRECTORY" -maxdepth 1 -type d -name 'chrome')"

    if [[ -n $CHROME_DIRECTORY ]];
    then

        # Check if the chrome folder contains files
        shopt -s nullglob dotglob 
        content="${CHROME_DIRECTORY}/"

        # If there's a current theme, make a backup
        if [ ${#content[@]} -gt 0 ];
        then
            message "[>>] Current chrome folder is not empty. Creating a backup in the same directory..."
            mv "${CHROME_DIRECTORY}" "${CHROME_DIRECTORY}.backup"
            mkdir "${CHROME_DIRECTORY}"
        fi

        
        download_bf
    else
        
        message "[>>] Chrome directory does not exist! Creating one..."
        mkdir "${FF_USER_DIRECTORY}/chrome"

        if [[ $? -eq 0 ]];
        then
            CHROME_DIRECTORY="${FF_USER_DIRECTORY}/chrome"
            
            download_bf
        else
            message "[!!] There was a problem creating the directory. Terminating..."
            exit 1;
        fi
    fi

else
    message "[!!] No firefox user profile directory found. Make sure to run firefox atleast once! Terminating..."
    exit 1;
fi
