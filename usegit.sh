[[ -z "$1" ]] && echo error: please specify a name && exit 1
[[ -f "./.git/.usegit.name" ]] && target=".git_"$(<".git/.usegit.name") && rm -rf $target && mv ".git" $target && echo $target saved
[[ -d "./.git" ]] && read -p "Backup .git to .git_"$1" (Y/n)? " -n 1 -r && [[ $REPLY =~ ^[Nn]$ ]] && echo "othing changed" && exit 1
[[ -d "./.git" ]] && echo $1 > ./.git/.usegit.name && mv -f "./.git/" "./.git_"$1"/" && echo "backed up .git to .git_"$1 && exit 0

rm -rf ./.git/*
[[ -d "./.git_"$1 ]] || echo "error: .git_"$1" not found"
[[ -d "./.git_"$1 ]] || exit 1
cp -r "./.git_"$1"/" "./.git/"
echo ".git_"$1" loaded"



