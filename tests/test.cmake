set(cli_str "\"avr-g++\" -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -flto -mmcu=atmega2560 -march=avr -DF_CPU=16000000L -DARDUINO=108019 -DARDUINO_AVR_MEGA2560 -DARDUINO_ARCH_AVR {includes} \"{source_file}\" -o \"{object_file}\" a.c")
message(STATUS "cli_str ${cli_str}")

include("${CMAKE_CURRENT_LIST_DIR}/../GCCOptionsParser.cmake")
parseGCCOptions(parsed "${cli_str}")

set(RES "{\n\
	\"executable\": \"${parsed_executable}\"\n\
	\"rest\": [\"${parsed_rest}\"],\n\
	\"target\": [\"${parsed_target}\"],\n\
	\"language_version\": [\"${parsed_language_version}\"],\n\
	\"features\": [\"${parsed_features}\"],\n\
	\"warnings\": [\"${parsed_warnings}\"],\n\
	\"defines\": [\"${parsed_defines}\"],\n\
	\"opt\": [\"${parsed_opt}\"],\n\
	\"action\": [\"${parsed_action}\"],\n\
	\"debug_info\": [\"${parsed_debug_info}\"]\n\
}")
string(REPLACE ";" "\", \"" RES ${RES})

message(STATUS "${RES}")
#
#if(a MATCHES "^(-o|{.+}$)")
#	list(APPEND discarded "${a}")
#	continue()
#endif()
