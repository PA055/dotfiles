#!/usr/bin/env python
from subprocess import run
from time import sleep
from tqdm import tqdm

MPD_HOST = "/home/lufimio/.mpd/socket"
MPD_MUSIC_DIR = "/home/lufimio/Music/"

mpd_songs = run(["mpc", "--host", MPD_HOST, "--format", "%file%", "listall"], capture_output=True).stdout.decode().splitlines()
songs_by_rating = {}
for song in mpd_songs:
    stickers = run(["mpc", "--host", MPD_HOST, "sticker", song, "list"], capture_output=True).stdout.decode().splitlines()
    stickers = filter(lambda x: "rating" in x, stickers)
    if stickers:
        rating = int(next(stickers).split("=")[1])
    else:
        rating = -1
    if songs_by_rating.get(rating) is None:
        songs_by_rating[rating] = [song]
    else:
        songs_by_rating[rating].append(song)

unrated = songs_by_rating.pop(-1, [])
ordered_songs = [i[1] for i in sorted(songs_by_rating.items(), key=lambda x: x[0])] + [unrated]

progress = tqdm(total=len(mpd_songs))
for rank in ordered_songs:
    for song in rank:
        run(["cp", f'{MPD_MUSIC_DIR}{song}', "/home/lufimio/Downloads/ios/"])
        progress.update()
    progress.refresh()
    sleep(300)
progress.close()
