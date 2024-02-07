cmake_minimum_required(VERSION 3.1)
project(iot-sdk-cpp)

add_executable(${PROJECT_NAME} src/main.cpp)

target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wno-long-long -pedantic -Werror)

find_package(aws-crt-cpp REQUIRED)
target_link_libraries(${PROJECT_NAME} AWS::aws-crt-cpp)

add_custom_target(build ALL)

add_custom_target(build_deploy ALL)

add_custom_target(build_deploy_debug ALL DEPENDS ${PROJECT_NAME})

add_custom_command(TARGET build_deploy POST_BUILD
COMMAND /bin/bash   scripts/deploy_artifact_on_target.sh
)

add_custom_command(TARGET build_deploy_debug POST_BUILD
COMMAND /bin/bash   scripts/deploy_artifact_on_target.sh
COMMAND /bin/bash   scripts/start_gdbserver_on_target.sh
)
