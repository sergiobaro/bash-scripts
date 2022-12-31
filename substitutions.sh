#!/bin/bash

customer_subnet_name='Acme Inc subnet 10.11.12.13/24'

echo ''
echo "Say we have this string: $customer_subnet_name"

customer_name=${customer_subnet_name%subnet*}
subnet=${customer_subnet_name##* }
ipa=${subnet%/*}
cidr=${subnet#*/}

fw_object_name=${customer_subnet_name// /_}
fw_object_name=${fw_object_name////-}
fw_object_name=${fw_object_name,,}

echo ''
echo 'When the code runs we get:'
echo ''
echo "Customer name : $customer_name"
echo "Subnet        : $subnet"
echo "IPA           : $ipa"
echo "CIDR mask     : $cidr"
echo "FW Object     : $fw_object_name"
