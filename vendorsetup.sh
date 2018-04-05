for combo in $(curl -s https://raw.githubusercontent.com/AICP/vendor_jenkins/o8.1/aicp-build-targets   | sed -e 's/#.*$//' | grep o8.1 | awk {'print $2'})
do
    add_lunch_combo $combo
done
