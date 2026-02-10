#Names for Daily Sensors
declare SOLAR_PRODUCTION_SENSOR_NAME="sensor.solar_generated_today"
declare GRID_IMPORT_SENSOR_NAME="sensor.grid_import_today"
declare GRID_EXPORT_SENSOR_NAME="sensor.grid_export_amount"
declare ENERGY_CONSUMPTION_TODAY_SENSOR_NAME="sensor.energy_consumption_today"
declare SOLAR_USED_TODAY_SENSOR_NAME="sensor.solar_used_today"
declare BATTERY_USED_TODAY_SENSOR_NAME="sensor.battery_used_today"
declare SOLAR_CHARGE_USED_TODAY_SENSOR_NAME="sensor.solar_battery_charge_today"

#Names for Real Time Sensors
declare SOLAR_PRODUCTION_REAL_TIME_NAME="sensor.solar_energy_now"
declare GRID_IMPORT_REAL_TIME_NAME="sensor.grid_import_now"
declare SOLAR_USED_REAL_TIME_NAME="sensor.solar_used_now"

#Template Values for Daily Sensors
declare SOLAR_PRODUCTION_TODAY_TEMPLATE='{"state": "unknown", "attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Solar generated today"}}'
declare GRID_IMPORT_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Grid Import today"}}'
declare GRID_EXPORT_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Grid Export Amount"}}'
declare ENERGY_CONSUMPTION_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Energy Consumption today"}}'
declare SOLAR_USED_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Solar Used Today"}}'
declare BATTERY_USED_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Battery Used Today"}}'
declare SOLAR_CHARGE_USED_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Solar to Battery Used Today"}}'

#Template Values for Real Time Sensors
declare SOLAR_PRODUCTION_REAL_TIME_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "energy","friendly_name": "Solar Energy Realtime"}}'
declare GRID_IMPORT_REAL_TIME_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "energy","friendly_name": "Grid Used Now"}}'
declare SOLAR_USED_REAL_TIME_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "energy","friendly_name": "Solar Used Now"}}'

# Names and Templates for Additional Daily Sensors
declare NET_GRID_USAGE_TODAY_SENSOR_NAME="sensor.net_grid_usage_today"
declare NET_GRID_USAGE_TODAY_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "Net Grid Usage Today"}}'

# Names and Templates for Additional Realtime / Cumulative Sensors
declare PV_POWER_NOW_SENSOR_NAME="sensor.pv_power_now"  # Renamed from solar_energy_now for clarity
declare PV_POWER_NOW_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "power","friendly_name": "PV Power Now"}}'

declare GRID_POWER_NOW_SENSOR_NAME="sensor.grid_power_now"  # Renamed from grid_import_now (handles export as negative)
declare GRID_POWER_NOW_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "power","friendly_name": "Grid Power Now"}}'

declare LOAD_POWER_NOW_SENSOR_NAME="sensor.load_power_now"  # Renamed from solar_used_now (more accurate)
declare LOAD_POWER_NOW_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "power","friendly_name": "Load Power Now"}}'

declare BATTERY_SOC_SENSOR_NAME="sensor.battery_soc"
declare BATTERY_SOC_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "%","device_class": "battery","friendly_name": "Battery State of Charge"}}'

declare BATTERY_CHARGE_POWER_NOW_SENSOR_NAME="sensor.battery_charge_power_now"
declare BATTERY_CHARGE_POWER_NOW_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "power","friendly_name": "Battery Charge Power Now"}}'

declare PV_GENERATION_MONTH_SENSOR_NAME="sensor.pv_generation_month"
declare PV_GENERATION_MONTH_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "PV Generation This Month"}}'

declare PV_GENERATION_YEAR_SENSOR_NAME="sensor.pv_generation_year"
declare PV_GENERATION_YEAR_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "PV Generation This Year"}}'

declare PV_GENERATION_TOTAL_SENSOR_NAME="sensor.pv_generation_total"
declare PV_GENERATION_TOTAL_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "kWh","device_class": "energy","friendly_name": "PV Generation Lifetime"}}'

declare INVERTER_WARNING_SENSOR_NAME="sensor.inverter_warning"
declare INVERTER_WARNING_TEMPLATE='{"state": "unknown","attributes": {"friendly_name": "Inverter Warning Code"}}'  # No unit/class as it's a code

declare SELF_CONSUMPTION_PERCENT_SENSOR_NAME="sensor.self_consumption_percent"  # Assuming 'percent' is this
declare SELF_CONSUMPTION_PERCENT_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "%","friendly_name": "Self Consumption Percent"}}'

declare MICRO_POWER_SENSOR_NAME="sensor.micro_power"  # Unclear, but add for completeness
declare MICRO_POWER_TEMPLATE='{"state": "unknown","attributes": {"state_class": "measurement","unit_of_measurement": "W","device_class": "power","friendly_name": "Micro Power"}}'

declare DAILY_SAVINGS_SENSOR_NAME="sensor.daily_savings"
declare DAILY_SAVINGS_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "GBP","device_class": "monetary","friendly_name": "Daily Savings"}}'  # Adjust unit to your currency, e.g. "GBP" for UK

declare MONTHLY_SAVINGS_SENSOR_NAME="sensor.monthly_savings"
declare MONTHLY_SAVINGS_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "GBP","device_class": "monetary","friendly_name": "Monthly Savings"}}'

declare LIFETIME_SAVINGS_SENSOR_NAME="sensor.lifetime_savings"
declare LIFETIME_SAVINGS_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "GBP","device_class": "monetary","friendly_name": "Lifetime Savings"}}'

declare TREES_SAVED_SENSOR_NAME="sensor.trees_saved"
declare TREES_SAVED_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","friendly_name": "Trees Saved"}}'  # No standard unit/class

declare CO2_SAVED_SENSOR_NAME="sensor.co2_saved"
declare CO2_SAVED_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "tons","friendly_name": "CO2 Saved"}}'

declare DIESEL_SAVED_SENSOR_NAME="sensor.diesel_saved"
declare DIESEL_SAVED_TEMPLATE='{"state": "unknown","attributes": {"state_class": "total_increasing","unit_of_measurement": "liters","friendly_name": "Diesel Saved"}}'

declare MONETARY_UNIT_SENSOR_NAME="sensor.monetary_unit"
declare MONETARY_UNIT_TEMPLATE='{"state": "unknown","attributes": {"friendly_name": "Monetary Unit"}}'  # String, no unit
