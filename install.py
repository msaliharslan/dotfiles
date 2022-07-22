#!/usr/bin/python3

import os
import platform
import yaml

# Directories
FILE_DIR = os.path.abspath(os.path.dirname(__file__))
HOME_DIR = os.path.expanduser('~')

# OS & Platform
OS = os.name
PLATFORM = platform.system()

seperator_line = "\n================================================================================\n"

# Print initial info
print(seperator_line)
print(f"Source directory: {FILE_DIR}")
print(f"Destination directory: {HOME_DIR}")
print(seperator_line)
print(f"Operating System: {OS}")
print(f"Platform: {PLATFORM}")
print(seperator_line)

# Create symbolic links
print("Creating symbolic links to dotfiles")

# Get the list of files & directories that are not supposed to be linked
ignore_file = open(os.path.abspath(f"{FILE_DIR}/ignore_link.yaml"), "r")
ignore_dict = yaml.safe_load(ignore_file)
ignore_file.close()


def is_ignore(path):
    if os.path.isfile(path):
        file = path.split('/')[-1]
        return True if file in ignore_dict['files'] else False

    elif os.path.isdir(path):
        directory = path.lstrip(FILE_DIR).split('/')[0]
        return True if directory in ignore_dict['directories'] else False


num_links = 0
for root, dirs, files in os.walk(FILE_DIR):
    if is_ignore(root):
        continue

    dest_prefix = root.lstrip(FILE_DIR)

    # Symlinks for the files
    for file in files:
        if is_ignore(file):
            continue

        source = os.path.abspath(f"{root}/{file}")
        destination = os.path.abspath(f"{HOME_DIR}/{dest_prefix}/{file}"
                                      ) if dest_prefix else os.path.abspath(
                                          f"{HOME_DIR}/{file}")

        # Remove destination if already existing
        if os.path.exists(destination):
            os.remove(destination)

        # Create symlink
        print(f"Source: {source}, Target: {destination}")
        os.symlink(source, destination)
        num_links += 1

    # Create directories in the target if not existing
    for dir in dirs:
        if is_ignore(dir):
            continue

        directory = os.path.abspath(f"{HOME_DIR}/{dest_prefix}/{dir}"
                                    ) if dest_prefix else os.path.abspath(
                                        f"{HOME_DIR}/{dir}")

        os.makedirs(directory, exist_ok=True)

print(seperator_line)
print(f"{num_links} symbolic links are created.")
