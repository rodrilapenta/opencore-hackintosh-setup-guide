#!/usr/bin/env python3
"""
usb-watch-map.py

Generic experimental USB watcher for macOS.

It repeatedly captures `system_profiler SPUSBDataType` and prints when the USB tree
changes. This is optional; the recommended helpers are:

  ./scripts/usb-watch-simple.sh
  ./scripts/usb-ssp-test.sh

This script does not modify EFI, kexts, config.plist, or system settings.
"""

from __future__ import annotations

import hashlib
import subprocess
import time
from datetime import datetime


def capture() -> str:
    return subprocess.run(
        ["system_profiler", "SPUSBDataType"],
        check=False,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    ).stdout


def digest(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8", errors="replace")).hexdigest()


def main() -> int:
    print("USB watcher")
    print("===========")
    print()
    print("Watching system_profiler SPUSBDataType for changes.")
    print("Press Ctrl+C to stop.")
    print()

    previous = capture()
    previous_hash = digest(previous)

    try:
        while True:
            time.sleep(3)
            current = capture()
            current_hash = digest(current)
            if current_hash != previous_hash:
                print()
                print("------------------------------------------------------------")
                print(f"USB tree changed at {datetime.now().isoformat(timespec='seconds')}")
                print("Run usb-watch-simple.sh or usb-ssp-test.sh for guided mapping.")
                print("------------------------------------------------------------")
                previous = current
                previous_hash = current_hash
    except KeyboardInterrupt:
        print()
        print("Stopped.")
        return 0


if __name__ == "__main__":
    raise SystemExit(main())
