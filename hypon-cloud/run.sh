#!/usr/bin/with-contenv bashio

source scripts/home-assistant.sh
source scripts/hypon.sh
source scripts/variables.sh

# Add these two debug lines
#bashio::log.info "INVERTER_AC_OUT_TODAY_TEMPLATE = ${INVERTER_AC_OUT_TODAY_TEMPLATE:-NOT DEFINED}"
#bashio::log.info "INVERTER_AC_OUT_TODAY_SENSOR_NAME = ${INVERTER_AC_OUT_TODAY_SENSOR_NAME:-NOT DEFINED}"

# Show configured hypon.cloud System ID in log to make it easier to spot issues if connection errors
bashio::log.info "Using system_id from config: $(bashio::config 'system_id')"

loadSensorData() {
  authToken=$1

  while true
  do
    solarData=$(retrieveSolarData "$authToken")
    realTimeData=$(retrieveRealTimeSolarData "$authToken")

    solarDataResponseCode=$(echo $solarData | jq -r '.code')

    bashio::log.info "Response Code From loading solar data: $solarDataResponseCode"

    if [ "$solarDataResponseCode" = "20000" ]; then
      bashio::log.info "Data retrieved successfully: $solarData"

      bashio::log.info "Updating SolarData Sensors" # 10
      update-sensor "$INVERTER_AC_OUT_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.kwhac')" $INVERTER_AC_OUT_TODAY_SENSOR_NAME

      update-sensor "$TOTAL_ENERGY_USED_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.load')" $TOTAL_ENERGY_USED_TODAY_SENSOR_NAME
      update-sensor "$BATTERY_USED_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.load_from_bat')" $BATTERY_USED_TODAY_SENSOR_NAME
      update-sensor "$GRID_USED_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.load_from_grid')" $GRID_USED_TODAY_SENSOR_NAME
      update-sensor "$PV_USED_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.load_from_pv')" $PV_USED_TODAY_SENSOR_NAME

      update-sensor "$TOTAL_PV_GENERATED_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.pvkwh')" $TOTAL_PV_GENERATED_TODAY_SENSOR_NAME
      update-sensor "$PV_TO_BATTERY_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.pv_to_bat')" $PV_TO_BATTERY_TODAY_SENSOR_NAME
      update-sensor "$PV_TO_GRID_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.pv_to_grid')" $PV_TO_GRID_TODAY_SENSOR_NAME
      update-sensor "$PV_TO_LOAD_TODAY_TEMPLATE" "$(echo "$solarData" | jq -r '.data.pv_to_load')" $PV_TO_LOAD_TODAY_SENSOR_NAME

      update-sensor "$TOTAL_ENERGY_USED_LESS_INVERTER_OUTPUT_TEMPLATE" "$(echo "$solarData" | jq -r '.data.balance')" $TOTAL_ENERGY_USED_LESS_INVERTER_OUTPUT_SENSOR_NAME

      bashio::log.info "Data retrieved successfully: $realTimeData"

      bashio::log.info "Updating RealTimeData Sensors"  # 12
      update-sensor "$PV_GENERATION_TOTAL_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.e_total')" $PV_GENERATION_TOTAL_SENSOR_NAME
      update-sensor "$PV_GENERATION_MONTH_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.e_month')" $PV_GENERATION_MONTH_SENSOR_NAME
      update-sensor "$PV_GENERATION_TODAY_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.e_today')" $PV_GENERATION_TODAY_SENSOR_NAME
      update-sensor "$PV_GENERATION_YEAR_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.e_year')" $PV_GENERATION_YEAR_SENSOR_NAME

      update-sensor "$SELF_CONSUMPTION_PERCENT_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.percent')" $SELF_CONSUMPTION_PERCENT_SENSOR_NAME

      update-sensor "$GRID_POWER_NOW_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.meter_power')" $GRID_POWER_NOW_SENSOR_NAME
      update-sensor "$LOAD_POWER_NOW_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.power_load')" $LOAD_POWER_NOW_SENSOR_NAME
      update-sensor "$BATTERY_CHARGE_POWER_NOW_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.w_cha')" $BATTERY_CHARGE_POWER_NOW_SENSOR_NAME
      update-sensor "$PV_POWER_NOW_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.power_pv')" $PV_POWER_NOW_SENSOR_NAME
      update-sensor "$BATTERY_SOC_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.soc')" $BATTERY_SOC_SENSOR_NAME

      update-sensor "$MICRO_POWER_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.micro')" $MICRO_POWER_SENSOR_NAME
      update-sensor "$INVERTER_WARNING_TEMPLATE" "$(echo "$realTimeData" | jq -r '.data.warning')" $INVERTER_WARNING_SENSOR_NAME
    fi

    if [ "$solarDataResponseCode" != "20000" ]; then
      if [ "$solarDataResponseCode" = "40000" ]; then
        bashio::log.error "Plant access denied - this system_id is not associated with your account: $(bashio::config 'system_id'). Check settings in hypon.cloud."
      else
        bashio::log.error "Unexpected API error code: $solarDataResponseCode - forcing token refresh"
        authToken=$(loginHypon)
      fi
    fi 

    sleep "$(bashio::config 'refresh_time')"
  done
}

bashio::log.info "Loading Authentication Token"
authToken=$(loginHypon)
loadSensorData "$authToken"
