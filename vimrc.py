import os

if 'GOOGLE_APPLICATION_CREDENTIALS' in os.environ:
    from snake.plugins import gtranslate
