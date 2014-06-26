for combo in $(curl -s  https://raw.githubusercontent.com/AICP/vendor_jenkins/kitkat/aicp-build-targets | sed -e 's/#.*$//' | grep kitkat | awk {'print $2'})
do
    add_lunch_combo $combo
done
