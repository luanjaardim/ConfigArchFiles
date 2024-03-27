if status is-interactive
    set -g lightBlue 35b1d4
    set -g lightGreen 66c908
    set -g cyan 5bbdd9
    set -g lightGray 94938f
    set -g gray 636360
    set -g userPurple 2f0485

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
        

        # Going to the beginning of the line for overwriting the python enviroment
        # Special chars: , , ,  
        echo -ne "\r" 
        nl
        display_text_with_colors "╭─" $gray
        display_text_with_colors "" brblue 
        display_text_with_colors " "(whoami) black brblue
        display_text_with_colors " 󰁥 " black brblue
        display_text_with_colors (prompt_hostname) black brblue
        display_text_with_colors " " brblue $lightBlue
        display_text_with_colors "  "(prompt_pwd)" " black $lightBlue

        if test -n "$VIRTUAL_ENV"
            display_text_with_colors " " $lightBlue $cyan
            display_text_with_colors " env: "(basename $VIRTUAL_ENV) black $cyan
            display_text_with_colors " " $cyan && nl
        else
            display_text_with_colors " " $lightBlue && nl
        end
        display_text_with_colors "╰─" $gray
        display_text_with_colors "" $userPurple
        display_text_with_colors " 󰣇 " white $userPurple
        display_text_with_colors " " $userPurple
    end

    function fish_right_prompt -d "Write out the right prompt"

        if is_git_repo
            display_text_with_colors "" $lightGreen
            display_text_with_colors ""(fish_git_prompt)" " black $lightGreen
            set_color -b $lightGreen
        end
        display_text_with_colors "" $gray 
        set_color -b $gray
        set_color white
        echo -n "  "
        date '+%H:%M:%S'
        set_color normal
    end

    function fish_greeting
        cal
        echo "(-_-)"
    end

    abbr -a l ls -la
    abbr -a c cd ..
    abbr -a nv nvim
    abbr -a gits git status
    abbr -a gitl git log --oneline --graph --all --decorate
    abbr -a gitc git commit -m
    abbr -a gitb git branch --all
    abbr -a swn shutdown now
end
