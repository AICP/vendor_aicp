for combo in $(curl -s  https://raw.githubusercontent.com/AICP/vendor_jenkins/o8.0/aicp-{Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,nightly}-targets | sed -e 's/#.*$//' | grep o8.0 | awk {'print $2'})
do
    add_lunch_combo $combo
done