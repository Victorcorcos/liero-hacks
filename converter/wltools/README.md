# wltools

## Building
Make sure you have development package installed for the following libraries:
- `libpng`

Then, simply run `make` to compile wltools. wltools has been tested on Linux with libpng12.

## Usage

```ruby
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

```ruby
./wltools data/liero.wlsprt data/dump/
# Convert the file data/liero.wlsprt into picture files inside data/dump/

cp -r data/dump data/import
# >> edit / add remove images <<

./wltools data/import/ data/import.wlsprt
# Convert back the pictures from data/import/ to data/import.wlsprt
```
