#!/usr/bin/env python3
"""Give the decrypted /data block device time to appear in skkk TWRP."""

import pathlib
import sys


def main() -> None:
    source = pathlib.Path(sys.argv[1])
    old = (
        "\t\t\t\tint retry_count = 10;\n"
        "\t\t\t\twhile (!Decrypt_Data->Mount(false) && --retry_count)\n"
        "\t\t\t\t\tusleep(500);\n"
        "\t\t\t\tif (Decrypt_Data->Mount(false)) {"
    )
    new = (
        "\t\t\t\tbool data_mounted = false;\n"
        "\t\t\t\tfor (int attempt = 0; attempt < 30; ++attempt) {\n"
        "\t\t\t\t\tif (Decrypt_Data->Mount(false)) {\n"
        "\t\t\t\t\t\tdata_mounted = true;\n"
        "\t\t\t\t\t\tbreak;\n"
        "\t\t\t\t\t}\n"
        "\t\t\t\t\tusleep(100000);\n"
        "\t\t\t\t}\n"
        "\t\t\t\tif (data_mounted) {"
    )
    text = source.read_text(encoding="utf-8")
    if text.count(old) != 1:
        raise SystemExit("Unexpected skkk partitionmanager.cpp; refusing to patch")
    source.write_text(text.replace(old, new), encoding="utf-8")


if __name__ == "__main__":
    main()
