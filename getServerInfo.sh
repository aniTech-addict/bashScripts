#!/bin/zsh

get_processor_count() {
    grep -c "processor" /proc/cpuinfo
}

get_cpu_cores_count(){
    # -m 1 -> --max_count NUM stops reading lines after number of lines reach the max   
    # awk $4 -> read ccol 4 only
    grep -m 1 "cpu cores" /proc/cpuinfo | awk '{print $4}'
}

get_memory_info() {
    # 2nd col -> total memory , 7th col -> free memory
    free -g | grep -i mem | awk '{print $2} {print $7}' 
}

get_storage_info() {
    df -h | awk '$6 =="/"' | awk '{print $2}'
}

get_running_process_count() {
    # get all the running process and count by lines 
    ps aux | wc -l
}

get_public_ip_address() {
    ip route get 1.1.1.1 | awk '{print $7}'
}

get_public_ip_address
