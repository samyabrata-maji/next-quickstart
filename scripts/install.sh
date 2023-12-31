#! /usr/bin/env sh
read -p "What your project name? (next-starter) " name
if [ -z "$name" ]; then
    name="next-starter"
fi

git clone "https://github.com/samyabrata-maji/next-starter" $name
cd $name
rm -rf .git
rm package-lock.json

sed "s/next-starter/$name/g" package.json > tempfile
cat tempfile > package.json
rm tempfile

while true; do
    read -p "Do you want to install dependencies? (y/N): " choice
    case "$choice" in
        [yY])
            npm i
            break
            ;;
        [nN])
            break
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
done

prompt_install_depp
rm -rf ./scripts
