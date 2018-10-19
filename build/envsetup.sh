# gzosp/aicp functions that extend build/envsetup.sh

function aicp_device_combos()
{
    for combo in $(curl -s https://raw.githubusercontent.com/AICP/vendor_jenkins/p9.0/aicp-build-targets   | sed -e 's/#.*$//' | grep p9.0 | awk {'print $2'})
    do
        add_lunch_combo $combo
    done
}

function gzosp_device_combos()
{
    local T list_file variant device

    T="$(gettop)"
    list_file="${T}/vendor/aicp/gzosp.devices"
    variant1="userdebug"
    variant2="user"

    if [[ $1 ]]
    then
        if [[ $2 ]]
        then
            list_file="$1"
            variant="$2"
        else
            if [[ ${VARIANT_CHOICES[@]} =~ (^| )$1($| ) ]]
            then
                variant="$1"
            else
                list_file="$1"
            fi
        fi
    fi

    if [[ ! -f "${list_file}" ]]
    then
        echo "unable to find device list: ${list_file}"
        list_file="${T}/vendor/aicp/gzosp.devices"
        echo "defaulting device list file to: ${list_file}"
    fi

    while IFS= read -r device
    do
        add_lunch_combo "aicp_${device}-${variant1}"
        add_lunch_combo "aicp_${device}-${variant2}"
    done < "${list_file}"
}

function gzosp_rename_function()
{
    eval "original_gzosp_$(declare -f ${1})"
}

function _gzosp_build_hmm() #hidden
{
    printf "%-8s %s" "${1}:" "${2}"
}

function gzosp_append_hmm()
{
    HMM_DESCRIPTIVE=("${HMM_DESCRIPTIVE[@]}" "$(_gzosp_build_hmm "$1" "$2")")
}

function gzosp_add_hmm_entry()
{
    for c in ${!HMM_DESCRIPTIVE[*]}
    do
        if [[ "${1}" == $(echo "${HMM_DESCRIPTIVE[$c]}" | cut -f1 -d":") ]]
        then
            HMM_DESCRIPTIVE[${c}]="$(_gzosp_build_hmm "$1" "$2")"
            return
        fi
    done
    gzosp_append_hmm "$1" "$2"
}

function gzospremote()
{
    local proj pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm gzosp 2> /dev/null

    proj="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"

    if (echo "$proj" | egrep -q 'external|system|build|bionic|art|libcore|prebuilt|dalvik') ; then
        pfx="android_"
    fi

    project="${proj//\//_}"

    git remote add gzosp "git@github.com:GZOSP/$pfx$project"
    echo "Remote 'gzosp' created"
}

function losremote()
{
    local proj pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm los 2> /dev/null

    proj="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    pfx="android_"
    project="${proj//\//_}"
    git remote add los "git@github.com:LineageOS/$pfx$project"
    echo "Remote 'los' created"
}

function aospremote()
{
    local pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
        return
    fi
    git remote rm aosp 2> /dev/null

    project="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    if [[ "$project" != device* ]]
    then
        pfx="platform/"
    fi
    git remote add aosp "https://android.googlesource.com/$pfx$project"
    echo "Remote 'aosp' created"
}

function cafremote()
{
    local pfx project

    if ! git rev-parse &> /dev/null
    then
        echo "Not in a git directory. Please run this from an Android repository you wish to set up."
    fi
    git remote rm caf 2> /dev/null

    project="$(pwd -P | sed "s#$ANDROID_BUILD_TOP/##g")"
    if [[ "$project" != device* ]]
    then
        pfx="platform/"
    fi
    git remote add caf "git://codeaurora.org/$pfx$project"
    echo "Remote 'caf' created"
}

function gzosp_push()
{
    local branch ssh_name path_opt proj
    branch="9.0"
    ssh_name="gzosp_review"
    path_opt=

    if [[ "$1" ]]
    then
        proj="$ANDROID_BUILD_TOP/$(echo "$1" | sed "s#$ANDROID_BUILD_TOP/##g")"
        path_opt="--git-dir=$(printf "%q/.git" "${proj}")"
    else
        proj="$(pwd -P)"
    fi
    proj="$(echo "$proj" | sed "s#$ANDROID_BUILD_TOP/##g")"
    proj="$(echo "$proj" | sed 's#/$##')"
    proj="${proj//\//_}"

    if (echo "$proj" | egrep -q 'external|system|build|bionic|art|libcore|prebuilt|dalvik') ; then
        proj="android_$proj"
    fi

    git $path_opt push "ssh://${ssh_name}/GZOSP/$proj" "HEAD:refs/for/$branch"
}


gzosp_rename_function hmm
function hmm() #hidden
{
    local i T
    T="$(gettop)"
    original_gzosp_hmm
    echo

    echo "vendor/aicp extended functions. The complete list is:"
    for i in $(grep -P '^function .*$' "$T/vendor/aicp/build/envsetup.sh" | grep -v "#hidden" | sed 's/function \([a-z_]*\).*/\1/' | sort | uniq); do
        echo "$i"
    done |column
}

gzosp_append_hmm "gzospremote" "Add a git remote for matching gzosp repository"
gzosp_append_hmm "aospremote" "Add git remote for matching AOSP repository"
gzosp_append_hmm "cafremote" "Add git remote for matching CodeAurora repository."
