<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### await
> Wait last background job with a nice progress spinner

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](http://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Install

```fish
$ omf install await
```


## Usage

```fish
$ sleep 10 &
$ await "Sleeping..."
$ git pull origin master &
$ await "Sleeping..." '/' '\\' '-' '|'
```

## Known issues

You need a double <kbd>Ctrl</kbd> <kbd>C</kbd> to get terminal cursor back.

# License

[MIT][mit] © [Derek W. Stavis][author]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/derekstavis
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
