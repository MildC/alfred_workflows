on alfred_script(q)
        if length of (q as string) is greater than 0 then
                set currentFolder to false
        else
                set currentFolder to true
        end if
        tell application "Finder"
                try
                        set _cwd to POSIX path of ((folder of (front window)) as alias)
                on error
                        set _cwd to POSIX path of (path to home folder as alias)
                end try
        end tell


        tell application "iTerm"
                activate
                set _term to (make new terminal)
                tell _term
                        launch session "Default"
                        set _session to current session
                end tell
                if currentFolder
                        tell _session
                                write text "cd \"" & _cwd & "\""
                        end tell
                else
                        tell _session
                                write text "cd " & q
                        end tell
                end if
        end tell
end alfred_script
