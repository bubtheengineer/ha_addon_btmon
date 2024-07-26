#!/usr/bin/with-contenv bashio

bashio::log.info "Starting btmon service..."

btmon_server_args=()
oem_args=()
mqtt_args=()

btmon_server_args+=('--device-type' "$(bashio::config 'device_type')")
btmon_server_args+=('--serial-port' "$(bashio::config 'serial_port')")

if bashio::config.true "serial_read"; then
	btmon_server_args+=('--serial')
fi

if bashio::config.true "print"; then
	btmon_server_args+=('-p')
fi

if bashio::config.true "debug"; then
	btmon_server_args+=('--debug')
fi

if bashio::config.true "oem_out"; then
	oem_args+=('--oem')
	oem_args+=('--oem-url' "$(bashio::config 'oem_url')")
	oem_args+=('--oem-token' "$(bashio::config 'oem_token')")
	oem_args+=('--oem-node' "$(bashio::config 'oem_node')")
	btmon_server_args+=(${oem_args[@]})
fi

if bashio::config.true "mqtt_out"; then
	mqtt_args+=('--mqtt')
	mqtt_args+=('--mqtt-host' "$(bashio::config 'mqtt_host')")
	mqtt_args+=('--mqtt-port' "$(bashio::config 'mqtt_port')")
	mqtt_args+=('--mqtt-clientid' "$(bashio::config 'mqtt_clientid')")
	mqtt_args+=('--mqtt-base-topic' "$(bashio::config 'mqtt_base_topic')")
	mqtt_args+=('--mqtt-user' "$(bashio::config 'mqtt_user')")
	mqtt_args+=('--mqtt-passwd' "$(bashio::config 'mqtt_passwd')")
	btmon_server_args+=(${mqtt_args[@]})
fi

if bashio::config.true "debug"; then
	bashio::log.info "Command line parameters: ${btmon_server_args[@]}"
fi

python btmon3.py "${btmon_server_args[@]}"