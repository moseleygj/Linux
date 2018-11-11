sudo lsblk > new_state.txt
    echo New device is at: $(diff old_state.txt new_state.txt)

