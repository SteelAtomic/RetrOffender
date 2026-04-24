# RetrOffender - Vulnerable GUI finder 

This script helps developers of RetroStudio games look for GUIs within their game that are vulnerable, allowing for them to patch it before exploiters find them and abuse them.
This is especially important for game developers who utilise admin GUIs and may want to protect them. This script allows you to check whether your GUI is vulnerable or not.

I decided to release this script to the public after switching UI libraries because this script is really simple, all it does is scan your PlayerGui for GUIs created in RetroStudio that aren't enabled. 
If you are competent enough at block coding, this script shouldn't affect your games but just in case, you might as well use my script to check. 

loadstring: 
```lua
loadstring(game:HttpGet("https://github.com/SteelAtomic/RetrOffender/raw/refs/heads/main/RetrOffender.luau"))()
```
