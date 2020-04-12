# WormStraightener

![banner](banner.jpg)

This is a simple ImageJ macro to straighten objects in a directory of images, given the corresponding coordinates of the objects' middle axes. It was developed with *C. elegans* microscopy images in mind, but is generalisable to other objects.

## Running the macro
Download or clone this repository onto your computer.
```
git clone https://github.com/pittachalk/WormStraightener.git
```

The `WormStraightener.ijm` script can be run within the ImageJ interface. Use the dropdown menu: *Plugins > Macros > Run*, and choose the script.

In the folder selection window that comes up, choose the directory within which `img/`, `coord/` and `out/` are nested. For demonstration purposes, choose this folder (`WormStraightener`) you just downloaded .

ImageJ will iterate through the images in `img/` one by one, straighen the objects according to specified coordinates in `coord/`, and save the output into `out/`.

## Requirements
ImageJ version 1.46r.

Code was tested on (Fiji is Just) ImageJ version 2.0.0-rc-69/1.52p.

## Running on your own images
Create a directory (folder) on your computer. In that folder, create three sub-directories `img/`, `coord` and `out`.

Put the images to be straightened in `img/`, and the coordinates of the middle axis of the objects in `coord/`.

### Minimal example of input files
The contents of `img/` are:
```
sample1.jpg
sample2.jpg
```

The contents of `coord/` are:
```
sample1.txt
sample2.txt
```

Each image in `img/` should have a corresponding coordinate file in `coord/`. Ideally, use the same name, because the macros iterates through both file lists in ascending alphabetical order.

### Coordinates
The text files in `coord/` is a tab-delimited text file, each row representing one point.
```
204	132
540	405
795	1788
```

Note that the origin in images is the upper-left corner, rather than the bottom-left in Cartesian space. This means that larger y values corresponds to points closer to the bottom of the image.

## Issues
Please report in the issues [tab](https://github.com/fxquah/WormStraightener/issues).
