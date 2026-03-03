#!/bin/bash


# Function to display usage
usage() {
    echo "Usage: $0 [-n NUM_DRONES] [-h]"
    echo "  -n NUM_DRONES  Number of drones to start (default: 1)"
    echo "  -h             Run in headless mode (no Gazebo GUI)"
    exit 1
}

# Default values
NUM_DRONES=1
HEADLESS=0


# Parse command-line arguments
while getopts ":n:h" opt; do
    case $opt in
        n) NUM_DRONES="$OPTARG" ;;
        h) HEADLESS=1 ;;
        *) usage ;;
    esac
done
# very important as it can cause issues
pkill -x px4 || true
pkill -9 -f "gz sim"




echo $HEADLESS
konsole -e bash -c "PX4_SYS_AUTOSTART=4001 PX4_SIM_MODEL=gz_x500_mono_cam_down ./build/px4_sitl_default/bin/px4 -i 0" &
sleep 5
konsole -e bash -c "PX4_SYS_AUTOSTART=4001 PX4_GZ_MODEL_POSE="5.45,0.0,2.0" PX4_SIM_MODEL=gz_aruco_pad ./build/px4_sitl_default/bin/px4 -i 10" &
# for ((i = 1; i <= NUM_DRONES; i++)); do
#     # Calculate the model pose (spread out drones in a line)
#     POSE_X=$((i-1))
#     POSE_Y=0

#     echo "Starting drone $i at position ($POSE_X, $POSE_Y)..."
#     if [ "$HEADLESS" -eq 1 ]; then
#         konsole -e bash -c "PX4_SYS_AUTOSTART=4022 IGN_IP=127.0.0.1 GZ_IP=127.0.0.1 PX4_GZ_MODEL_POSE="$POSE_X,$POSE_Y" PX4_SIM_MODEL=gz_x500_mono_cam_down HEADLESS=1 ./build/px4_sitl_default/bin/px4 -i ${i}" &
#     else
#         konsole -e bash -c "PX4_SYS_AUTOSTART=4022 IGN_IP=127.0.0.1 GZ_IP=127.0.0.1 PX4_GZ_MODEL_POSE="$POSE_X,$POSE_Y" PX4_SIM_MODEL=gz_x500_mono_cam_down ./build/px4_sitl_default/bin/px4 -i ${i}" &
#     fi
#     if [ "$i" -eq 0 ]; then
#         sleep 5
#     else
#         sleep 3
#     fi
# done

# if [ "$HEADLESS" -eq 1 ]; then
#     konsole -e bash -c "PX4_SYS_AUTOSTART=4022 GZ_TRANSPORT_LOCALHOST_ONLY=1 IGN_TRANSPORT_DISABLE_MULTICAST=1 IGN_IP=127.0.0.1 GZ_IP=127.0.0.1 PX4_GZ_MODEL_POSE="5.45,0.0,2.0" PX4_SIM_MODEL=gz_aruco_pad HEADLESS=1 ./build/px4_sitl_default/bin/px4 -i 10" &
# else
#     konsole -e bash -c "PX4_SYS_AUTOSTART=4022 GZ_TRANSPORT_LOCALHOST_ONLY=1 IGN_TRANSPORT_DISABLE_MULTICAST=1 IGN_IP=127.0.0.1 GZ_IP=127.0.0.1 PX4_GZ_MODEL_POSE="5.45,0.0,2.0" PX4_SIM_MODEL=gz_aruco_pad ./build/px4_sitl_default/bin/px4 -i 10" &
# fi
sleep 5






# Start first drone
# konsole -e bash -c "cd ../PX4-Autopilot && PX4_SYS_AUTOSTART=4001 PX4_SIM_MODEL=gz_x500 HEADLESS=1  ./build/px4_sitl_default/bin/px4 -i 1" &
# sleep 5
# konsole  -e bash -c "cd ../PX4-Autopilot && PX4_SYS_AUTOSTART=4001 PX4_GZ_MODEL_POSE="0,1" PX4_SIM_MODEL=gz_x500 HEADLESS=1  ./build/px4_sitl_default/bin/px4 -i 2" &

# konsole  -e bash -c "cd ../PX4-Autopilot && PX4_SYS_AUTOSTART=4001 PX4_GZ_MODEL_POSE="0,1" PX4_SIM_MODEL=gz_x500 HEADLESS=1  ./build/px4_sitl_default/bin/px4 -i 3"
