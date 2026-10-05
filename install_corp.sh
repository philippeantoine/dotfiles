#!/bin/zsh

echo "Corp env check..."

if command -v mule &> /dev/null; then
    echo "Roadwarrior setup (gcert)..."
    sudo mule install roadwarrior
    sudo mule install gosso
else
    echo "Not corp laptop."
fi
