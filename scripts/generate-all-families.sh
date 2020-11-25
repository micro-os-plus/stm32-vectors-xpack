#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Safety settings (see https://gist.github.com/ilg-ul/383869cbb01f61a51c4d).

if [[ ! -z ${DEBUG} ]]
then
  set ${DEBUG} # Activate the expand mode if DEBUG is anything but empty.
else
  DEBUG=""
fi

set -o errexit # Exit if command failed.
set -o pipefail # Exit if pipe failed.
set -o nounset # Exit if variable not set.

# Remove the initial space and instead use '\n'.
IFS=$'\n\t'

# -----------------------------------------------------------------------------
# Identify the script location, to reach, for example, the helper scripts.

script_path="$0"
if [[ "${script_path}" != /* ]]
then
  # Make relative path absolute.
  script_path="$(pwd)/$0"
fi

script_name="$(basename "${script_path}")"

script_folder_path="$(dirname "${script_path}")"
script_folder_name="$(basename "${script_folder_path}")"

# =============================================================================

# Script to generate the vector_*.c files from all templates
# from the CubeMX packages

src_folder_path="$(dirname "${script_folder_path}")/src"

f0_version="1.11.1"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F0_V${f0_version}/Drivers/CMSIS/Device/ST/STM32F0xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f0"

f1_version="1.8.3"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F1_V${f1_version}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f1"

f2_version="1.9.2"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F2_V${f2_version}/Drivers/CMSIS/Device/ST/STM32F2xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f2"

f3_version="1.11.1"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F3_V${f3_version}/Drivers/CMSIS/Device/ST/STM32F3xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f3"

f4_version="1.25.2"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F4_V${f4_version}/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f4"

f7_version="1.16.0"
bash "${script_folder_path}/generate-vectors-from-arm-startup.sh" \
  "${HOME}/STM32Cube/Repository/STM32Cube_FW_F7_V${f7_version}/Drivers/CMSIS/Device/ST/STM32F7xx/Source/Templates/arm" \
  "${src_folder_path}/stm32f7"
