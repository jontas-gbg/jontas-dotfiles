# ~/.config/fish/functions/copy_my_text.fish

function news --description "Kopierar innehållet i en specificerad eller standard textfil till urklippet."
    # Standardfil (default)
    set -l filepath ~/.local/share/Q/nyheter

    # Gå igenom argumenten (flaggs)
    while true
        switch "$argv[1]"
            case '-n'
                # Flagga för 'min_text.txt' (samma som default, men explicit)
                set filepath ~/.local/share/Q/nyheter
                set -e argv[1] # Ta bort flaggan från argumentlistan
            case '-t'
                # Flagga för 'min_andra_text.txt'
                set filepath ~/.local/share/Q/tech
                set -e argv[1] # Ta bort flaggan från argumentlistan
            case '*'
                # Inga fler flaggor eller okända argument
                break
        end
    end

    # Kontrollera om filen existerar innan du försöker läsa den
    if not test -f "$filepath"
        echo "Fel: Filen '$filepath' hittades inte." >&2
        return 1
    end

    # Läs innehållet i filen och skicka det till wl-copy
    if cat "$filepath" | wl-copy
        echo "Cont '$filepath' har kopierats till urklipp."
    else
        echo "Fel: Misslyckades med att kopiera innehållet till urklipp (wl-copy misslyckades)." >&2
        return 1
    end
end
