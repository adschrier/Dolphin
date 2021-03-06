﻿"Filed out from Dolphin Smalltalk 7"!

InternalBitmap subclass: #InternalIcon
	instanceVariableNames: 'tileColor'
	classVariableNames: ''
	poolDictionaries: 'GdiplusConstants'
	classInstanceVariableNames: ''!
InternalIcon guid: (GUID fromString: '{7446a3c1-e3ae-45b8-bca2-bbd493a5c7d3}')!
InternalIcon comment: 'An InternalIcon is capable of holding it''s image bytes internally in the Smalltalk image. Thus it is no longer necessary to refer to external files outside the image to make use of Icon resources. This has several advantages, including the ability to version InternalIcon resources into STS as part of a Smalltalk method and the fact that fewer external files need to be distributed with an application.

USAGE:

(1) If you want to install a class side #icon method for one of your classes simply go to any workspace and evaluate:

MyClass createIconMethod.

This will prompt for a (usually PNG) file, and then create a MyClass class>>icon method for it. If you browse this method you''ll see answers an instance of InternalIcon instantiated from a literal byte array. Note that InternalIcons automatically reformat any image to 48@48 pixels by default.

(2) If you want to add an InternalIcon to a toolbar, in the View Composer first create a ToolbarIconButton in your toolbar and locate the commandDescription/image aspect for this button. Then type and accept:

InternalIcon chooseFile

This will prompt you for a suitable image file (again PNG files work best) and will load the image bytes into a literal byte array from which the InternalIcon can be instantiated when required. 

'!
!InternalIcon categoriesForClass!Kernel-Objects! !
!InternalIcon methodsFor!

= comperand 
	^super = comperand and: [self tileColor = comperand tileColor]!

addToImageList: aWinImageList mask: aColorOrNil 
	^(tileColor isNil ifTrue: [gdiplusBitmap] ifFalse: [self tileBitmapWithExtent: aWinImageList extent]) 
		addToImageList: aWinImageList
		mask: aColorOrNil!

asAlphaBitmap: aPoint 
	"Answer a 32-bpp bitmap (i.e. with Alpha channel) that contains the receiver's
	image rendered at the specified size."

	| bmp |
	bmp := DIBSection 
				width: aPoint x
				height: aPoint y
				depth: 32.
	"Use the services of an ImageList to get the correct sized icon automagically, and to
	provide an alpha channel even if the original icon had no more than a simple mask."
	(self class imageManager imageListWithExtent: aPoint) 
		draw: self imageIndex
		on: bmp canvas
		at: Point.Zero
		flags: CommCtrlConstants.ILD_PRESERVEALPHA.
	bmp freeDC.
	^bmp!

asMenuBitmap
	"Answer a 32-bpp bitmap (i.e. with alpha channel) containing the receiver's image at system
	menu image extent. Note that the result will be a shared bitmap which is always the same
	instance for the same icon."

	^self class imageManager menuBitmapForIcon: self!

asParameter
	"Create an icon from the image list so we can answer the handle"

	^self asIcon detachHandle!

bitmap
	^tileColor isNil ifTrue: [gdiplusBitmap] ifFalse: [self tileBitmapWithExtent: gdiplusBitmap extent]!

drawOn: aCanvas at: dstOrigin extent: dstExtent 
	tileColor ifNotNil: [aCanvas fillRectangle: (dstOrigin extent: dstExtent) color: tileColor].
	self gdiplusBitmap 
		drawOn: aCanvas
		at: dstOrigin
		extent: dstExtent!

drawOnGraphics: aGraphics at: dstOrigin extent: dstExtent from: srcOrigin extent: srcExtent unit: aUnit attributes: aImageAtt
	tileColor
		ifNotNil: 
			[aGraphics fillRectangle: (dstOrigin extent: dstExtent) brush: (GdiplusSolidBrush color: tileColor)].
	^self gdiplusBitmap
		drawOnGraphics: aGraphics
		at: dstOrigin
		extent: dstExtent
		from: srcOrigin
		extent: srcExtent
		unit: aUnit
		attributes: aImageAtt!

hash
	^super hash + tileColor hash!

hotspot
	^self extent / 2!

imageIndex
	^Icon imageManager indexOfImage: self!

imageManager
	^Icon imageManager!

imageType
	^Win32Constants.IMAGE_ICON!

tileBitmapWithExtent: extent 
	| tileBitmap graphics |
	tileBitmap := GdiplusBitmap extent: extent.
	graphics := tileBitmap graphics.
	
	[graphics interpolationMode: InterpolationModeHighQualityBicubic.
	self 
		drawOnGraphics: graphics
		at: Point zero
		extent: extent
		from: Point zero
		extent: self extent
		unit: nil
		attributes: nil] 
			ensure: [graphics free].
	^tileBitmap!

tileColor
	^tileColor!

tileColor: aColor 
	tileColor := aColor! !
!InternalIcon categoriesFor: #=!comparing!comparison!public! !
!InternalIcon categoriesFor: #addToImageList:mask:!double dispatch!private! !
!InternalIcon categoriesFor: #asAlphaBitmap:!converting!public! !
!InternalIcon categoriesFor: #asMenuBitmap!converting!public! !
!InternalIcon categoriesFor: #asParameter!converting!public! !
!InternalIcon categoriesFor: #bitmap!accessing!public! !
!InternalIcon categoriesFor: #drawOn:at:extent:!drawing-bitmaps!public! !
!InternalIcon categoriesFor: #drawOnGraphics:at:extent:from:extent:unit:attributes:!drawing-gdiplus!public! !
!InternalIcon categoriesFor: #hash!comparing!comparison!public! !
!InternalIcon categoriesFor: #hotspot!accessing!public! !
!InternalIcon categoriesFor: #imageIndex!accessing!public! !
!InternalIcon categoriesFor: #imageManager!public! !
!InternalIcon categoriesFor: #imageType!constants!public! !
!InternalIcon categoriesFor: #tileBitmapWithExtent:!accessing!helpers!private! !
!InternalIcon categoriesFor: #tileColor!accessing!private! !
!InternalIcon categoriesFor: #tileColor:!accessing!private! !

!InternalIcon class methodsFor!

badgeTile: anIconBadge color: aColor 
	"Answer an instance of the receiver that is anIconBadge superimposed on a square tile of
	aColor."

	^self badgeTile: anIconBadge color: aColor extent: self defaultTileExtent!

badgeTile: anIconBadge color: aColor extent: extent 
	"Answer an instance of the receiver that is anIconBadge superimposed on a square tile of
	aColor."

	^(self fromGdiplusBitmap: anIconBadge bitmap)
		tileColor: aColor;
		yourself!

defaultExtent
	^48 @ 48!

defaultTileExtent
	^128 @ 128!

filesType
	"Private - Answer a two element array suitable for adding to the FileDialog
	with the fileTypes: message."

	^#('PNG Files (*.png)' '*.png')!

fromFile: aFilename 
	^self fromFile: aFilename extent: self defaultExtent!

fromFile: aFilename extent: aPoint 
	| bitmap |
	bitmap := GdiplusBitmap fromFile: aFilename.
	bitmap := (bitmap thumbnailWithExtent: aPoint asPoint) internalize.
	^self fromGdiplusBitmap: bitmap!

icon
	^Icon icon!

imageManager
	"Private - Answer an image manager to use for storing icons"

	^IconImageManager current!

new
	"Answer a new blank instance of the receiver with the default extent.
	Note that if the default extent is changed, this method should be regenerated
	by saving the printString of 'self withExtent: self defaultExtent'"

	^InternalIcon
		fromBytes: #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 48 0 0 0 48 8 6 0 0 0 87 2 249 135 0 0 0 1 115 82 71 66 0 174 206 28 233 0 0 0 4 103 65 77 65 0 0 177 143 11 252 97 5 0 0 0 9 112 72 89 115 0 0 14 195 0 0 14 195 1 199 111 168 100 0 0 0 31 73 68 65 84 104 67 237 193 1 1 0 0 0 130 32 255 175 110 72 64 0 0 0 0 0 0 0 0 192 137 26 36 48 0 1 192 219 208 191 0 0 0 0 73 69 78 68 174 66 96 130]!

newTile
	"Answer a new blank instance of the receiver with the default tile extent.
	Note that if the default extent is changed, this method should be regenerated
	by saving the printString of 'self withExtent: self defaultTileExtent'"

	^InternalIcon
		fromBytes: #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 128 0 0 0 128 8 6 0 0 0 195 62 97 203 0 0 0 1 115 82 71 66 0 174 206 28 233 0 0 0 4 103 65 77 65 0 0 177 143 11 252 97 5 0 0 0 9 112 72 89 115 0 0 14 195 0 0 14 195 1 199 111 168 100 0 0 0 87 73 68 65 84 120 94 237 193 49 1 0 0 0 194 160 245 79 109 12 31 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 184 171 1 0 143 0 1 171 181 19 127 0 0 0 0 73 69 78 68 174 66 96 130]!

stbConvertFrom: anSTBClassFormat
	"Convert from version 0 Resource. Version 1 adds the 'tileColor' instance var"

	^
	[:data |
	| newInstance |
	newInstance := self basicNew.
	1 to: data size do: [:i | newInstance instVarAt: i put: (data at: i)].
	newInstance]!

stbVersion
	^1! !
!InternalIcon class categoriesFor: #badgeTile:color:!instance creation!public! !
!InternalIcon class categoriesFor: #badgeTile:color:extent:!instance creation!public! !
!InternalIcon class categoriesFor: #defaultExtent!constants!private! !
!InternalIcon class categoriesFor: #defaultTileExtent!constants!private! !
!InternalIcon class categoriesFor: #filesType!constants!private! !
!InternalIcon class categoriesFor: #fromFile:!instance creation!public! !
!InternalIcon class categoriesFor: #fromFile:extent:!instance creation!public! !
!InternalIcon class categoriesFor: #icon!public! !
!InternalIcon class categoriesFor: #imageManager!accessing!private! !
!InternalIcon class categoriesFor: #new!instance creation!public! !
!InternalIcon class categoriesFor: #newTile!instance creation!public! !
!InternalIcon class categoriesFor: #stbConvertFrom:!binary filing!public! !
!InternalIcon class categoriesFor: #stbVersion!binary filing!public! !

