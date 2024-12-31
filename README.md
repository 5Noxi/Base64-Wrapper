# Base64-Wrapper
Base64 encodes your script to obfuscate it, iterations make the file very large very quickly, preview:
![b64pre](https://github.com/5Noxi/Base64-Wrapper/blob/main/NV-B64.png?raw=true)
### Before
![before](https://github.com/5Noxi/Base64-Wrapper/blob/main/Before.png?raw=true) 
### After
![after](https://github.com/5Noxi/Base64-Wrapper/blob/main/After.png?raw=true)

## Discord Server 
- https://discord.gg/E2ybG4j9jU

## How it works
1. Gets content of input
2. Converts content to b64
3. Writes encoded payload into
```
iex([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String(b64payload)))
```
4. Does this as often as you want (iterations)

## Usage
`nvi` -> Input

`nvo` -> Output

`. \NV-Wrapper.ps1; main -nvi ".\Test.ps1" -nvo ".\Wrapped.ps1" -iterations 1`

Using too many iterations will end in a **big** file!


## Disclaimer
Do not use the encoder to create malware, **I take no responsibility for the abuse of this tool.**
