# wltools

## Building
Make sure you have development package installed for the following libraries:
- `libpng`

Then, simply run `make` to compile wltools. wltools has been tested on Linux with libpng12.

## Usage

```
Usage:
  wltools [-?|-h|--help] <source> <destination>

Options, arguments:
  -?, -h, --help

    Display usage information.

  <source>

    Source wlsprt or directory

  <destination>

    Destination wlsprt or directory
```

## Example
```
./wltools data/liero.wlsprt data/dump/
# contents of data/liero.wlsprt converted to data/dump/

cp -r data/dump data/import
# >> edit / add remove images <<

./wltools data/import/ data/import.wlsprt
# contents of data/import/ converted to data/import.wlsprt
```