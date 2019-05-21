import os
import snake

from google.cloud import translate

translate_client = translate.Client()

def translate_en_ru(text):
    translation = translate_client.translate(text, target_language='ru')
    print('translatedText: ')
    print(translation['translatedText'])

@snake.key_map("<leader>tv", mode=snake.VISUAL_MODE)
def translate_en_ru_visual_selection():
    translate_en_ru(snake.get_visual_selection())
