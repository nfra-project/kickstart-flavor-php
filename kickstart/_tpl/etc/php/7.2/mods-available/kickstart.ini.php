<?php if (((int)getenv("DEV_MODE")) === 1): ?>
display_errors = no

<?php else: ?>
display_errors = yes
display_startup_errors = yes
zend.assertions = 1
assert.exception = 1

<?php endif; ?>
