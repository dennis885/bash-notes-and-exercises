#!/bin/bash

#Function to check network connectivity for a given IP address or domain name
check_connectivity() {
	target=$1
	ping -c 4 $target >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Connectivity to $target: Successful"
	else
		echo "Connectivity to $target: Failed"
	fi
}


# Main menu
while true; do
        clear
        echo "Network Connectivity Check"
        echo "-----------------"
        echo "1. Check connectivity for an IP address"
        echo "2. Check connectivity for a domain name"
        echo "3. Exit"
        echo
        read -p "Enter your choice (1-3): " choice

        case $choice in
                1)
                        read -p "Enter an IP address: " ip_address
			check_connectivity $ip_address
			read -p "Press Enter to continue..."
                        ;;
		2)
                        read -p "Enter a domain name: " domain_name
                        check_connectivity $domain_name
                        read -p "Press Enter to continue..."
                        ;;

                3)
                        break
                        ;;
                *)
                        echo "Invalid choice. Please try again."
                        read -p "Press Enter to contionue..."
                        ;;
        esac
done

