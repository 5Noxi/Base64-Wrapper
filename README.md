# Base64-Wrapper
Base64 encodes your script to obfuscate it, iterations make the file very large very quickly, preview:
![b64pre](https://github.com/5Noxi/Base64-Wrapper/blob/main/NV-B64.png?raw=true)
### Before
![before](https://github.com/5Noxi/Base64-Wrapper/blob/main/Before.png?raw=true) 
### After
![after](https://github.com/5Noxi/Base64-Wrapper/blob/main/After1.1.png?raw=true)

## Discord Server 
- https://discord.gg/E2ybG4j9jU

## How it works
1. Gets content of input
2. Converts content to b64 & uses randomized MBA obfuscated iex command & strings
3. Writes encoded payload into
```
iex([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String(b64payload)))
```
4. Does this as often as you want (iterations)

## Example for `UTF8` after MBA obfuscation
```
([char](((-15212 -Band 4405) + (-15212 -Bor 4405) + 3213 + 7679))+[char](((-1237 -Band 5295) + (-1237 -Bor 5295) - 8168 + 4226))+[char](((3833 -Band 616) + (3833 -Bor 616) + 1393 - 5772))+[char](((-1442 -Band 9351) + (-1442 -Bor 9351) - 9352 + 1499)))
```

## Usage
`nvi` -> Input

`nvo` -> Output

`. \NV-Wrapper.ps1; main -nvi ".\Test.ps1" -nvo ".\Wrapped.ps1" -iterations 1`

Using too many iterations will end in a **big** file!


## Disclaimer
Do not use the encoder to create malware, **I take no responsibility for the abuse of this tool.**
