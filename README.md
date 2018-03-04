# AutoSuffix

If you must maintain one package for several different versions of Delphi, then the usual way is
to have a new project for each version with a different `{$LIBSUFFIX }` for the current version, i.e. for 
Tokyo, the lib suffix is `250`, for Berlin it is `240`, etc.

This simple wizard adds a menu item to the project manager, with the title "Add Version Suffix", under
the "Rename" context menu item. This allows you to set the lib suffix for a package to the suffix that
is generally used for this version, so `'250'` for Tokyo, etc.

## Files:

| File | Contents | 
| --- | --- |
| .gitignore | Git ignores the files in this file |
| AddAutoSuffixProjectMenu.pas | The main wizard that adds the menu item and sets the suffix |
| AutoSuffix.dpk | The compiler project file |
| AutoSuffix.dproj | The MSBUILD project file |
| AutoSuffix.res | The resource file for this project |
| LICENSE.md | The BSD two clause license for this project |
| OpenTools.LocalMenus.pas | A stub implementation for IOTALocalMenu |
| README.md | The readme for this project |
