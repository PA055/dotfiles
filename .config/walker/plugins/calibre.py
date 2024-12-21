import json
import subprocess

booksRaw = subprocess.run(['calibredb', 'list', '-f', 'title,authors,cover', '--for-machine'], capture_output=True).stdout
books = json.loads(booksRaw)

choices = [{
    "label": f'{book["title"]} - {book["authors"]}',
    "sub": "calibre",
    "icon": book["cover"],
    "exec": f'calibre calibre://view-book/Calibre_Library/{book["id"]}/epub',
    } for book in books]
print(json.dumps(choices, indent=2))
