<?php if (((int)getenv("DEV_MODE")) === 1): ?>
[Xdebug]
zend_extension=xdebug.so

; Set this to 1 to enable profiling
xdebug.profiler_enable=off

xdebug.profiler_output_dir = "/opt/"
xdebug.profiler_output_name = "cachegrind.out"
xdebug.remote_handler=dbgp

; Wait for http get-parameter to start session
xdebug.remote_autostart=on

xdebug.remote_start=on
xdebug.remote_enable=on

; Don't connect back: Security issue
xdebug.remote_connect_back=off

xdebug.remote_port=9000
xdebug.remote_host = <?= getenv("DOCKER_HOST_IP"); ?>
xdebug.idekey = <?= getenv("DEV_CONTAINER_NAME"); ?>
<?php endif; ?>
