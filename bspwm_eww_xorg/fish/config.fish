if status is-interactive
    set -g lightBlue 35b1d4
    set -g lightGreen 66c908
    set -g cyan 5bbdd9
    set -g lightGray 94938f
    set -g gray 636360
    set -g userPurple 2f0485
    set -g wblue 8cb3e6

    function is_git_repo
        git rev-parse --is-inside-work-tree > /dev/null 2>&1
    end

    # Prompt some text with color and background color
    # $1: text
    # $2: color
    # $3: background color
    function display_text_with_colors
        echo -n (set_color -b $argv[3])
        echo -n (set_color $argv[2])
        echo -n $argv[1]
        echo -n (set_color normal)
    end

    function nl
        echo ""
    end

    function fish_prompt
        nl
        echo "  [$(display_text_with_colors (prompt_pwd) $wblue)] -> "
    end

    fish_add_path ~/.ghcup/ghc/9.4.8/bin
    fish_add_path ~/.local/bin

    abbr -a l ls -la
    abbr -a c cd ..
    abbr -a nv nvim
    abbr -a z zathura
    abbr -a gits git status
    abbr -a gitl git log --oneline --graph --all --decorate
    abbr -a gitc git commit -m
    abbr -a gitb git branch --all
    abbr -a swn shutdown now
end

# opam configuration
source /home/jaardim/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
fish_add_path '/home/jaardim/eww/target/release'
