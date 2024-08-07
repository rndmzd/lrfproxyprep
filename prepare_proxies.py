import logging
import os
import sys
from pathlib import Path

logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


def main():
    input_directory = Path(input("Path to directory with media files: "))
    logging.info(f"Input directory: {input_directory}")

    proxies_directory = input_directory / "proxies"

    if not proxies_directory.exists():
        proxies_directory.mkdir()
    
    for file in input_directory.iterdir():
        if file.is_file() and file.suffix.lower() == '.lrf':
            if file.suffix.isupper():
                new_suffix = '.MP4'
            else:
                new_suffix = '.mp4'
            logging.info(f"Renaming {file.name} to {file.stem}{new_suffix} and moving to {proxies_directory}.")
            os.rename(file, proxies_directory / f"{file.stem}{new_suffix}")

if __name__ == '__main__':
    main()
    logger.info("Done.")