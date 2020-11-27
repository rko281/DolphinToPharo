# DolphinToPharo
Allows Dolphin packages and fileouts to be loaded into Pharo.

## To Install
```
Metacello new
	repository: 'github://rko281/DolphinToPharo:main';
	baseline: 'DolphinToPharo';
	load
```

## To Use
1. Copy your Dolphin Package (`.pac`) or fileout (`.cls` or `.st`) to your Pharo image directory
2. Change the file extension to `.st`
3. Open the File Browser in your Pharo image, select your Dolphin file and click Install
4. Your Dolphin code should now be loaded. In the case of a package file, a Pharo package with the same name will have been created.

## Notes
1. This project includes the `Wolphin` package from [ReStoreForPharo](https://github.com/rko281/ReStoreForPharo) to implement basic Dolphin-Pharo compatibility necessary during code file-in. Your filed-in code may introduce its own dependency on this package.
2. Loading this project overrides the normal Pharo file-in mechanism. To re-enable this, remove the method `ChunkFileFormatParser class>>new`
