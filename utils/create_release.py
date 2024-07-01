#!/usr/bin/env python3

import pathlib
import zipfile
import os
import argparse
import subprocess
import glob
import logging

logger = logging.getLogger(__name__)
logging.basicConfig(
    level=logging.INFO,
    format="[%(asctime)s] %(levelname)s [%(name)s.%(funcName)s:%(lineno)d] %(message)s",
)

FILE_GLOB_LIST = [
    # template files
    "LICENSE",
    "README.md",
    "CHANGELOG.md",
    "thuthesis.dtx",
    "thuthesis.ins",
    "tsinghua-name-bachelor.pdf",
    "thuthesis-*.bst",
    "thuthesis-*.bbx",
    "thuthesis-*.cbx",
    "Makefile",
    "latexmkrc",
    "thuthesis.pdf",
    "thuthesis.cls",
    # example files
    "thuthesis-example.tex",
    "thuthesis-example.pdf",
    "thusetup.tex",
    "data/*.tex",
    "figures/*",
    "ref/*.bib",
    # others
    ".vscode/*",
]


def generate_file_list():
    for g in FILE_GLOB_LIST:
        files = glob.glob(g)
        if len(files) == 0:
            raise FileNotFoundError(
                f"No file found for pattern '{g}', did you run `make all-dev` first?"
            )
        for f in files:
            yield f


def create_release_zip(version: str):
    dist_dir = pathlib.Path("dist")
    dist_dir.mkdir(exist_ok=True)
    release_zip = dist_dir / f"thuthesis-{version}.zip"
    if release_zip.exists():
        logger.info(f"Release {release_zip} already exists, will overwrite")
    with zipfile.ZipFile(release_zip, "w", compression=zipfile.ZIP_DEFLATED) as z:
        for f in generate_file_list():
            logger.debug(f"Adding to release zip: {f}")
            z.write(f)
    s = os.stat(release_zip)
    logger.info(f"Release {release_zip} created with size {s.st_size} bytes")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create release zip for thuthesis")
    parser.add_argument("--version", required=False)
    parser.add_argument("--debug", action="store_true")
    args = parser.parse_args()
    if not args.version:
        version = (
            subprocess.check_output(["git", "describe", "--tags"])
            .strip()
            .decode("utf-8")
        )
    else:
        version = args.version
    if args.debug:
        logger.setLevel(logging.DEBUG)
    logger.info(f"Creating release zip for version {version}")
    create_release_zip(version)
