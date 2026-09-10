# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

export PATH="/usr/local/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Aliases
alias build="pnpm run build"
alias dev="pnpm run dev"
alias public="pnpm run dev:public"
alias acn="arc commit --amend --no-edit -n"
alias fp="arc commit --fixup @"
alias gen="cd ~/arcadia/search-interfaces/gen-answer-features"
alias push=" arc push -fu users/likipiki/\`arc branch | grep \"* \" | cut -d \" \" -f2\`"
alias rebuild="pnpm run clean && pnpm run deps && pnpm run build"
alias screens="pnpm run hermione:gui -f"
alias validate="npx palmsync validate"
alias web4="cd ~/arcadia/search-interfaces/oceania/projects/web4"
alias alice="cd ~/arcadia/search-interfaces/oceania/projects/alice"
alias depot="~/arcadia/search-interfaces/oceania/packages/depot"
alias quality="~/arcadia/search-interfaces/oceania/packages/futuris-basic-quality"
alias reef="~/arcadia/search-interfaces/oceania/projects/reef"
alias junk="~/arcadia/junk/likipiki"
alias q="ssh -A likipiki-dev.sas.yp-c.yandex.net"

if [ -s "$HOME/.nvm/nvm.sh" ]; then
    source "$HOME/.nvm/nvm.sh"
fi

export PATH="$PATH:$HOME/.local/bin"
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/YandexInternalCA.pem

# Keep the machine awake while OpenCode is active.
opencode() {
    caffeinate -i /opt/homebrew/bin/opencode "$@"
}

# Keep the machine awake while Codex is active.
codex() {
    caffeinate -i "$HOME/.local/bin/codex" "$@"
}

# Secrets are intentionally local and never committed to this repository.
secrets_file="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/zsh/secrets.zsh"
if [ -r "$secrets_file" ]; then
    source "$secrets_file"
else
    printf 'Secrets file not found: %s\n' "$secrets_file" >&2
fi
unset secrets_file
