#!/bin/bash

# ==========================================
# Colors and Formatting
# ==========================================
C="\e[1;36m"   # Cyan
G="\e[1;32m"   # Green
R="\e[1;31m"   # Red
Y="\e[1;33m"   # Yellow
W="\e[1;37m"   # White
D="\e[90m"     # Dark Gray
N="\e[0m"      # Reset

# ==========================================
# Banner
# ==========================================
print_banner() {
    clear
    echo -e "${R}══════════════════════════════════════════════════════════════════════════════════════${N}"
    echo -e "${C}"
    echo '           █████╗ ███╗   ██╗██████╗  █████╗ ██████╗ '
    echo '          ██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔══██╗'
    echo '          ███████║██╔██╗ ██║██████╔╝███████║██████╔╝'
    echo '          ██╔══██║██║╚██╗██║██╔══██╗██╔══██║██╔══██╗'
    echo '          ██║  ██║██║ ╚████║██████╔╝██║  ██║██║  ██║'
    echo '          ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝'
    echo -e "${N}"
    echo -e "          ${W}Anbar Generator Pro v4.0 (Red Team Edition)${N}"
    echo -e "          ${D}Advanced Targeted Generator for Penetration Testing${N}"
    echo -e "          ${G}Username Generator ${Y}•${G} Password Generator ${Y}•${G} Pattern Selection${N}"
    echo -e "${R}══════════════════════════════════════════════════════════════════════════════════════${N}"
    echo ""
}

print_divider() {
    local text="$1"
    echo -e "${C}────────────────────────── $text ──────────────────────────${N}"
    echo ""
}

main_menu() {
    print_banner
    print_divider "Main Menu"
    
    echo -e "${C}┌────────────────────────────────────────┐${N}"
    echo -e "${C}│${N}  1. 🪪  Username Generator            ${C}│${N}"
    echo -e "${C}│${N}  2. 🔑  Password Generator            ${C}│${N}"
    echo -e "${C}│${N}  3. 🧹  Clear Screen                  ${C}│${N}"
    echo -e "${C}│${N}  4. ❌  Exit                          ${C}│${N}"
    echo -e "${C}└────────────────────────────────────────┘${N}"
    echo ""
    echo -ne "${Y}Choose (1-4): ${N}"
    read choice

    case $choice in
        1) username_menu ;;
        2) password_menu ;;
        3) clear; main_menu ;;
        4) echo -e "\n${G}Exiting Anbar Generator...${N}"; exit 0 ;;
        *) main_menu ;;
    esac
}

# ==========================================
# Username Generator
# ==========================================
username_menu() {
    print_banner
    print_divider "Username Generator"
    
    echo -ne "${W}First Name () : ${G}"; read fname; echo -ne "${N}"
    echo -ne "${W}Last Name () : ${G}"; read lname; echo -ne "${N}"
    echo -ne "${W}Middle Name () : ${G}"; read mname; echo -ne "${N}"
    echo -ne "${W}Nickname () : ${G}"; read nname; echo -ne "${N}"
    echo -ne "${W}Company () : ${G}"; read comp; echo -ne "${N}"
    echo -ne "${W}Important Year (e.g., 2024) : ${G}"; read year; echo -ne "${N}"
    echo -ne "${W}Advanced Keyword (e.g., phoenix) : ${G}"; read advword; echo -ne "${N}"
    echo -ne "${W}Lucky Number (e.g., 123) : ${G}"; read num; echo -ne "${N}"

    fname=$(echo "$fname" | tr '[:upper:]' '[:lower:]')
    lname=$(echo "$lname" | tr '[:upper:]' '[:lower:]')
    mname=$(echo "$mname" | tr '[:upper:]' '[:lower:]')
    nname=$(echo "$nname" | tr '[:upper:]' '[:lower:]')
    comp=$(echo "$comp" | tr '[:upper:]' '[:lower:]')
    advword=$(echo "$advword" | tr '[:upper:]' '[:lower:]')
    
    fi=${fname:0:1}
    li=${lname:0:1}
    mi=${mname:0:1}
    yshort=${year: -2}

    echo ""
    echo -e "${C}[*] Using all patterns by default.${N}"
    echo -ne "${W}Use all patterns? [y/n] (y): ${N}"
    read use_all

    if [[ "$use_all" == "n" || "$use_all" == "N" ]]; then
        show_patterns
    else
        process_usernames "all"
    fi
}

show_patterns() {
    echo -e "\n${G}                   Available Username Patterns${N}"
    echo -e "${G}┌────┬────────────────────────────┬──────────────────────────────┐${N}"
    echo -e "${G}│ #  │ Pattern                    │ Example                      │${N}"
    echo -e "${G}├────┼────────────────────────────┼──────────────────────────────┤${N}"
    printf "${G}│ 1  │ %-26s │ %-28s │${N}\n" "last_name" "$lname"
    printf "${G}│ 2  │ %-26s │ %-28s │${N}\n" "first_name" "$fname"
    printf "${G}│ 3  │ %-26s │ %-28s │${N}\n" "last_first" "${lname}${fname}"
    printf "${G}│ 4  │ %-26s │ %-28s │${N}\n" "last_dot_first" "${lname}.${fname}"
    printf "${G}│ 5  │ %-26s │ %-28s │${N}\n" "last_underscore_first" "${lname}_${fname}"
    printf "${G}│ 6  │ %-26s │ %-28s │${N}\n" "first_last" "${fname}${lname}"
    printf "${G}│ 7  │ %-26s │ %-28s │${N}\n" "last_initial_first" "${li}${fname}"
    printf "${G}│ 8  │ %-26s │ %-28s │${N}\n" "last_first_initial" "${lname}${fi}"
    printf "${G}│ 9  │ %-26s │ %-28s │${N}\n" "last_initial_dot_first" "${li}.${fname}"
    printf "${G}│ 10 │ %-26s │ %-28s │${N}\n" "last_dot_first_initial" "${lname}.${fi}"
    printf "${G}│ 11 │ %-26s │ %-28s │${N}\n" "initials" "${li}${fi}"
    printf "${G}│ 12 │ %-26s │ %-28s │${N}\n" "nickname" "$nname"
    printf "${G}│ 13 │ %-26s │ %-28s │${N}\n" "last_company" "${lname}${comp}"
    printf "${G}│ 14 │ %-26s │ %-28s │${N}\n" "last_dot_company" "${lname}.${comp}"
    printf "${G}│ 15 │ %-26s │ %-28s │${N}\n" "company_year" "${comp}${year}"
    printf "${G}│ 16 │ %-26s │ %-28s │${N}\n" "admin_last" "admin.${lname}"
    printf "${G}│ 17 │ %-26s │ %-28s │${N}\n" "last_adm" "${lname}_adm"
    printf "${G}│ 18 │ %-26s │ %-28s │${N}\n" "it_last" "it.${lname}"
    printf "${G}│ 19 │ %-26s │ %-28s │${N}\n" "last_number" "${lname}${num}"
    printf "${G}│ 20 │ %-26s │ %-28s │${N}\n" "combined_advanced" "${lname}${mname}${advword}"
    echo -e "${G}└────┴────────────────────────────┴──────────────────────────────┘${N}"
    
    echo -e "${D}* Note: Selecting 'all' generates 100+ professional patterns.${N}"
    echo -ne "${Y}Enter pattern numbers (comma separated) (1,2,3): ${N}"
    read pattern_nums
    process_usernames "$pattern_nums"
}

process_usernames() {
    local selection=$1
    > /tmp/anbar_users_raw.tmp

    # === The Professional Pentest Wordlist Engine (100+ Patterns) ===
    local raw_patterns=(
        "${lname}" "${fname}" "${nname}"
        "${lname}${fname}" "${lname}.${fname}" "${lname}_${fname}" "${lname}-${fname}"
        "${fname}${lname}" "${fname}.${lname}" "${fname}_${lname}" "${fname}-${lname}"
        "${li}${fname}" "${li}.${fname}" "${li}_${fname}" "${li}-${fname}"
        "${lname}${fi}" "${lname}.${fi}" "${lname}_${fi}" "${lname}-${fi}"
        "${fi}${lname}" "${fi}.${lname}" "${fi}_${lname}" "${fi}-${lname}"
        "${fname}${li}" "${fname}.${li}" "${fname}_${li}" "${fname}-${li}"
        "${li}${fi}" "${li}.${fi}" "${li}_${fi}"
        "${fi}${li}" "${fi}.${li}" "${fi}_${li}"
        "${li}${mi}${fi}" "${li}.${mi}.${fi}"
        "${fi}${mi}${li}" "${fi}.${mi}.${li}"
        "${lname}${year}" "${lname}.${year}" "${lname}_${year}" "${lname}-${year}"
        "${lname}${yshort}" "${lname}.${yshort}" "${lname}_${yshort}"
        "${fname}${year}" "${fname}.${year}" "${fname}_${year}"
        "${fname}${yshort}" "${fname}.${yshort}" "${fname}_${yshort}"
        "${lname}${fname}${year}" "${lname}${fname}${yshort}"
        "${lname}.${fname}.${year}" "${fname}.${lname}.${year}"
        "${lname}${comp}" "${lname}.${comp}" "${lname}_${comp}"
        "${comp}${lname}" "${comp}.${lname}" "${comp}_${lname}"
        "${fname}${comp}" "${fname}.${comp}" "${fname}_${comp}"
        "${comp}${year}" "${comp}${yshort}" "${comp}_${year}"
        "admin${lname}" "admin.${lname}" "admin_${lname}" "admin-${lname}"
        "${lname}admin" "${lname}.admin" "${lname}_admin"
        "adm${lname}" "adm.${lname}" "adm_${lname}"
        "${lname}adm" "${lname}.adm" "${lname}_adm"
        "admin${fname}" "admin.${fname}" "admin_${fname}"
        "${fname}admin" "${fname}.admin" "${fname}_admin"
        "it.${lname}" "sys.${lname}" "root.${lname}" "user.${lname}"
        "it.${fname}" "sys.${fname}" "root.${fname}" "user.${fname}"
        "${lname}${num}" "${lname}.${num}" "${lname}_${num}"
        "${fname}${num}" "${fname}.${num}" "${fname}_${num}"
        "${lname}${advword}" "${lname}.${advword}" "${lname}_${advword}"
        "${fname}${advword}" "${fname}.${advword}" "${fname}_${advword}"
        "${advword}${lname}" "${advword}.${lname}"
        "${nname}${lname}" "${nname}.${lname}" "${nname}_${lname}"
        "${lname}${nname}" "${lname}.${nname}" "${lname}_${nname}"
        "${nname}${year}" "${nname}${yshort}"
        "${nname}${num}" "${nname}_${num}"
        "${lname}123" "${lname}1" "${lname}12" "${lname}2023" "${lname}2024" "${lname}2025"
        "${fname}123" "${fname}1" "${fname}12"
        "${lname}.local" "${fname}.local"
    )

    if [[ "$selection" == "all" ]]; then
        for p in "${raw_patterns[@]}"; do echo "$p" >> /tmp/anbar_users_raw.tmp; done
    else
        # If specific numbers selected, we map to the menu items
        declare -A menu_patterns=(
            [1]="$lname" [2]="$fname" [3]="${lname}${fname}" [4]="${lname}.${fname}" [5]="${lname}_${fname}"
            [6]="${fname}${lname}" [7]="${li}${fname}" [8]="${lname}${fi}" [9]="${li}.${fname}" [10]="${lname}.${fi}"
            [11]="${li}${fi}" [12]="$nname" [13]="${lname}${comp}" [14]="${lname}.${comp}" [15]="${comp}${year}"
            [16]="admin.${lname}" [17]="${lname}_adm" [18]="it.${lname}" [19]="${lname}${num}" [20]="${lname}${mname}${advword}"
        )
        IFS=',' read -ra ADDR <<< "$selection"
        for i in "${ADDR[@]}"; do echo "${menu_patterns[$i]}" >> /tmp/anbar_users_raw.tmp; done
    fi

    # === CLEANUP ENGINE (Removes Garbage & Artifacts) ===
    > /tmp/anbar_users.tmp
    while IFS= read -r p; do
        # 1. Remove consecutive dots/underscores (e.g., "a..b" -> "a.b")
        clean=$(echo "$p" | sed 's/\.\././g; s/\.\././g; s/__/_/g; s/__/_/g; s/--/-/g; s/--/-/g')
        # 2. Remove leading/trailing dots and underscores (e.g., ".seif" -> "seif")
        clean=$(echo "$clean" | sed 's/^[._-]//; s/[._-]$//')
        
        # 3. Filter criteria
        if [[ ${#clean} -ge 2 ]]; then
            # Do not output purely numbers/years or standalone prefix words if name was empty
            if [[ ! "$clean" =~ ^[0-9]+$ ]] && [[ ! "$clean" =~ ^(admin|adm|it|sys|root|user)$ ]]; then
                echo "$clean" >> /tmp/anbar_users.tmp
            fi
        fi
    done < /tmp/anbar_users_raw.tmp

    # Remove duplicates
    sort -u /tmp/anbar_users.tmp -o /tmp/anbar_users.tmp
    local count=$(wc -l < /tmp/anbar_users.tmp)
    
    # === Table Output ===
    echo -e "\n${G}[+] Generated $count professional usernames:${N}"
    echo -e "${G}┌──────┬──────────────────────────────────────────┐${N}"
    printf "${G}│ %-4s │ %-40s │${N}\n" "#" "Generated Username"
    echo -e "${G}├──────┼──────────────────────────────────────────┤${N}"
    idx=1
    while IFS= read -r line; do
        printf "${G}│ %-4s │ %-40s │${N}\n" "$idx" "$line"
        ((idx++))
    done < /tmp/anbar_users.tmp
    echo -e "${G}└──────┴──────────────────────────────────────────┘${N}"
    
    echo -ne "\n${W}Save results to generated_users.txt? [y/n] (y): ${N}"
    read save_ans
    if [[ "$save_ans" == "y" || "$save_ans" == "Y" || -z "$save_ans" ]]; then
        mv /tmp/anbar_users.tmp generated_users.txt
        echo -e "${G}[+] Saved to: generated_users.txt${N}\n"
    else
        rm -f /tmp/anbar_users.tmp
        echo -e "${Y}[-] Results discarded.${N}\n"
    fi
    
    echo -ne "${Y}Press Enter to return to main menu...${N}"
    read
    main_menu
}

# ==========================================
# Password Generator
# ==========================================
generate_franco() {
    local word=$1
    echo "$word"
    local f1=$(echo "$word" | sed 's/kh/5/g; s/gh/8/g; s/h/7/g; s/q/9/g; s/t/6/g')
    echo "$f1"
    if [[ "$word" =~ ^[aouei] ]]; then
        echo "$f1" | sed 's/^[aouei]/3/'
        echo "$f1" | sed 's/^[aouei]/2/'
    fi
}

leetspeak() {
    echo "$1" | sed 's/[aA]/@/g; s/[eE]/3/g; s/[iI]/1/g; s/[oO]/0/g; s/[sS]/5/g'
}

password_menu() {
    print_banner
    print_divider "Advanced Password Generator"
    
    echo -ne "${W}Enter Target Keywords (comma separated) : ${G}"; read raw_keys; echo -ne "${N}"
    echo -ne "${W}Enter Important Years (comma separated) : ${G}"; read raw_years; echo -ne "${N}"
    echo -ne "${W}Enter Custom Symbols (e.g., @,!,#)      : ${G}"; read raw_syms; echo -ne "${N}"

    IFS=',' read -r -a KEYWORDS <<< "$raw_keys"
    IFS=',' read -r -a YEARS <<< "$raw_years"
    IFS=',' read -r -a SYMBOLS <<< "$raw_syms"
    
    if [ ${#SYMBOLS[@]} -eq 0 ]; then SYMBOLS=( "@" "#" "!" "_" "." ); fi

    > /tmp/anbar_pass.tmp
    echo -e "${C}[*] Processing Franco permutations & Combinations...${N}"

    for word in "${KEYWORDS[@]}"; do
        F_VARIANTS=($(generate_franco "$word"))
        
        for v in "${F_VARIANTS[@]}"; do
            W_CAP=$(echo "${v^}")
            W_LOW=$(echo "${v,,}")
            W_ALL=$(echo "${v^^}")
            W_LEET=$(leetspeak "$v")
            
            MUTATIONS=("$W_CAP" "$W_LOW" "$W_ALL" "$W_LEET")
            
            for m in "${MUTATIONS[@]}"; do
                echo "${m}123" >> /tmp/anbar_pass.tmp
                echo "${m}12345" >> /tmp/anbar_pass.tmp
                
                for y in "${YEARS[@]}"; do
                    yshort=${y: -2}
                    ALL_Y=("$y" "$yshort")
                    
                    for cur_y in "${ALL_Y[@]}"; do
                        echo "${m}${cur_y}" >> /tmp/anbar_pass.tmp
                        for s in "${SYMBOLS[@]}"; do
                            echo "${m}${s}${cur_y}" >> /tmp/anbar_pass.tmp
                            echo "${m}${cur_y}${s}" >> /tmp/anbar_pass.tmp
                            echo "${s}${m}${cur_y}" >> /tmp/anbar_pass.tmp
                            echo "${m}${s}${s}${cur_y}" >> /tmp/anbar_pass.tmp
                        done
                    done
                done
            done
        done
    done

    sort -u /tmp/anbar_pass.tmp -o /tmp/anbar_pass.tmp
    local count=$(wc -l < /tmp/anbar_pass.tmp)
    
    echo -e "\n${G}[+] Generated $count highly targeted passwords:${N}"
    echo -e "${G}┌──────┬──────────────────────────────────────────┐${N}"
    printf "${G}│ %-4s │ %-40s │${N}\n" "#" "Generated Password"
    echo -e "${G}├──────┼──────────────────────────────────────────┤${N}"
    idx=1
    while IFS= read -r line; do
        printf "${G}│ %-4s │ %-40s │${N}\n" "$idx" "$line"
        ((idx++))
    done < /tmp/anbar_pass.tmp
    echo -e "${G}└──────┴──────────────────────────────────────────┘${N}"
    
    echo -ne "\n${W}Save results to generated_passwords.txt? [y/n] (y): ${N}"
    read save_ans
    if [[ "$save_ans" == "y" || "$save_ans" == "Y" || -z "$save_ans" ]]; then
        mv /tmp/anbar_pass.tmp generated_passwords.txt
        echo -e "${G}[+] Saved to: generated_passwords.txt${N}\n"
    else
        rm -f /tmp/anbar_pass.tmp
        echo -e "${Y}[-] Results discarded.${N}\n"
    fi
    
    echo -ne "${Y}Press Enter to return to main menu...${N}"
    read
    main_menu
}

# Start Tool
main_menu
