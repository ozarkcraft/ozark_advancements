#!/bin/bash
#
# update_all_advancements: 
#
set -euo pipefail
IFS=$'\n\t'

unzip -oq ~/Library/Application\ Support/minecraft/versions/1.17.1/1.17.1.jar \
    "data/minecraft/advancements/adventure/*" \
    "data/minecraft/advancements/end/*" \
    "data/minecraft/advancements/husbandry/*" \
    "data/minecraft/advancements/nether/*" \
    "data/minecraft/advancements/story/*" \
    -d "ozark_advancements"

DIR="ozark_advancements/data/minecraft/advancements"
find "${DIR}" -name "*.json" | while read -r line; do
    ADVANCEMENT="$(echo ${line%%.*} | sed "s#${DIR}/##" )"
    echo "execute as @a[advancements={minecraft:"${ADVANCEMENT}"=true}] run scoreboard players add @s ozark_adv 1" >> update_score.mcfuntion
    jq '.rewards |= {"function": "ozark:add_score"}' "${line}" > "${line}.tmp"
    mv "${line}.tmp" "${line}"
done
