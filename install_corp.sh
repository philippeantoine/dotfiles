#!/bin/zsh

echo "Corp env check..."

if command -v mule &> /dev/null; then
    echo "Roadwarrior setup (gcert)..."
    sudo mule install roadwarrior

    # here for internal tools
else
    echo "Not corp laptop."
fi
