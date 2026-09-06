# Anbar Generator Pro 🎯

An advanced, highly targeted Username and Password generator designed specifically for Penetration Testers and Red Teamers. It goes beyond simple combinations by integrating regional patterns (like the Egyptian Franco-Arabic engine), Leetspeak mutations, and smart artifact cleanup.

## 🚀 Features

- **100+ Professional Patterns:** Generates highly targeted usernames using names, nicknames, companies, years, and common IT/Admin prefixes.
- **Franco-Arabic Engine:** Intelligently converts Arabic names/keywords into their "Franco" equivalents (e.g., `khaled` -> `5aled`, `ahmed` -> `27med`) to expand password guessing horizons.
- **Leetspeak Mutation:** Automatically mutates generated passwords using common leetspeak character replacements.
- **Smart Cleanup Engine:** Automatically filters out broken syntax (like `..`, `__`, or trailing dots) caused by missing user inputs, ensuring every generated string is usable.
- **Terminal UI:** Beautiful and fast pure Bash ANSI interface with clean table outputs.
- **Export Options:** Easily save outputs to clean `.txt` files for immediate use in tools like Hydra, Burp Suite, or Hashcat.

## 🛠️ Installation & Usage

It's a standalone Bash script. Just clone, make it executable, and run!

```bash
git clone [https://github.com/Seiff2004/AnbarGen.git](https://github.com/Seiff2004/AnbarGen.git)
cd AnbarGen
chmod +x AnbarGen.sh
./AnbarGen.sh
