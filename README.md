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
1. Copy your Dolphin Package structure (`.pac`) or fileouts (`.cls` or `.st`) to your Pharo image directory
2. Evaluate the expression `CodeImporter evaluateDolphinFileNamed: '<your file name>'`
3. Your Dolphin code should now be loaded. In the case of a package file, a Pharo package with the same name will have been created.

## Notes
1. This project includes the `Wolphin` package from [ReStoreForPharo](https://github.com/rko281/ReStoreForPharo) to implement basic Dolphin-Pharo compatibility necessary during code file-in. Your filed-in code may introduce its own dependency on this package.
2. Loading a package file will also load any specified Dolphin prerequisite packages provided their .pac file exists in the correct location relative to your Pharo image directory
3. Dolphin static expressions ( `##(...)` ) are automatically rewritten, removing the `##`prefix and thus rendering them as regular Smalltalk expressions
