#!/bin/bash
#
# Return metrics

function get_metrics {
    my_cpu_idle=$(mpstat 5 1 | awk '{print $13}' | sort -rn | head -1)

    my_ram_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    my_ram_free=$(grep MemFree /proc/meminfo | awk '{print $2}')
    my_ram_avalible=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

    my_hd_capacity_total=$(df -h / -Bk | awk '{print $2}' | sort -rn | head -1 | sed 's/.$//')
    my_hd_capacity_avalible=$(df -h / -Bk | awk '{print $4}' | sort -rn | head -1 | sed 's/.$//')

    #echo "<html><head><meta name=\"color-scheme\" content=\"light dark\"</head><body cz-shortcut-listen=\"true\"><pre style=\"word-wrap: break-word; white-space: pre-wrap;\">"

    echo "my_cpu_idle $my_cpu_idle"

    echo "my_ram_total $my_ram_total.0"
    echo "my_ram_free $my_ram_free.0"
    echo "my_ram_avalible $my_ram_avalible.0"

    echo "my_hd_capacity_total $my_hd_capacity_total.0"
    echo "my_hd_capacity_avalible $my_hd_capacity_avalible.0"

    #echo "</pre><!----></body></html>"
}
