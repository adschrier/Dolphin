"Filed out from Dolphin Smalltalk 7"!

Shell subclass: #GdiplusImageViewSampleShell
	instanceVariableNames: 'image edgeChoice viewChoice padding interpolationChoice classChoice useImageClass filename'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GdiplusImageViewSampleShell guid: (GUID fromString: '{8645634F-E895-424A-A4C8-4DB4AFB9647E}')!
GdiplusImageViewSampleShell comment: 'GdiplusImageViewSampleShell

Evaluate
	GdiplusImageViewSampleShell show

Instance Variables:
	image			<ImagePresenter>
	edgeChoice		<ChoicePresenter>
	viewChoice		<ChoicePresenter>
	padding			<NumberPresenter>
	interpolationChoice		<ChoicePresenter>
	classChoice		<ChoicePresenter>
	useImageClass		<GdiplusImage class>
	filename			<String>

'!
!GdiplusImageViewSampleShell categoriesForClass!MVP-Presenters! !
!GdiplusImageViewSampleShell methodsFor!

attemptDisplayOABitmap
	"Try opening an OA bitmap ... will show warning icon in deployed version"

	filename := FileLocator installRelative localFileSpecFor: 'Resources/Dolphin1.jpg'.
	[self displayImage] on: Error do: [:e | ]!

beachBallBytes
	"Answer the bytes of the Dolphin BeachBall in png format 48x48"

	^ByteArray 
		fromHexString: '89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9870000002C744558744372656174696F6E2054696D65005475652031352041707220323030332031323A30363A3435202B313030302B5023010000000774494D4507D3040F02082EE216211E000000097048597300000B1200000B1201D2DD7EFC0000000467414D410000B18F0BFC610500000B2F4944415478DAB55A6B6C1D47153EBB7BAFEDEBD88EEDC4A4891392E6499A56244E82489AD08AD207528BDAA20A29A848402A88043F80AA0209812A7E20AA42A9400A6A8B28E90F8AFA20A8557F4440DAD236210D367D84A471ECC6891DE7E5C7B57D9FBB3BC339F3D89DDDBBF75EC709238DEE3E6667BEEF9CEF9C999DBD165CA3F2A71737F3C78E6C875BC76F8173A779C5FD3FFFED8126FC61587DF57B4D8A75B51D3CF7DDE7F9BA63FB60F193A3C0DA39FCA00830D808C0872DE0076F82D4FEFB83B6691CAD25ED4167865F33427322F0D2370EF3932BA7E0DE779E86E5A3A720BFAD091A1F2B805B0698CE017CDD05984C23093CE748C83989C3FCF51EB08EF5047D70360D969383A347BEDD85A7D358DDB910B9220204FCFC6A0FA6581EBE72F8F7B07CE42494F07ADF4F007ABEC8058122022EE0C5FB3450450290181CE986D41F1F0A4970172C7B0C7CF723E8EB7B624E44664D80C00F7EAA085EB90CDF7CF729587866009FB6A0C839786F70684441E02D2821D82212F84B3FC01F56192466F000AF5B53F87B602738076F0B49F069F0D9070886416FDF935744A42E8103BB8FF3812523906B6D00E67BF0D5B77F078B87FBD5D316E46F6885E67D530804F195B8205128482F3C82100649E9788F292F58051C32CB810F84DE3049D85611FEDDBB773D5EBE8895E87AB5F0D9F5C0F7AF1C83C2FC0CD8B603F7BCB937042F06E6905D5CD05C500ED82156C7C15F3C7F682834938531010DF84C03B29987E7AB46C0FBD6133216F026B75AC149AF03C69B6073CF9EE3D87A1DD60EACA93911D0E0DD8C7CBEEBF4595887011B2F932B4203D976E01841E6FAA5005BB3EA1A7593563565895F67C114F87B9E0949F8F302125B363FF80EB65C5B8F445502241B2F9316C7996C01761D7ABCA20D09B4ED73D19C4FC08980A37ADE3561DC4B4B28C20BE80DD6C4C16941F93DF84BB05ACE6003D49BDF2048F86C216CDD7AF75BF548241278EAE157B8DBD9169CDFD9FB3458BE0FF58A83BA21F042465853886741BBE105A7D20B807306EBB0C1BDFD59B05B47315CD2A181FC65B0F53337D7245141E0B5DD1FF0E2D245C1F982C1D3B002D365B5D2BD21DAA76DA4059B4B22F79FD72E5024C80B29C30B8D1CEC6606DEB667653BE5059212B0EB6A9288101019E7865C708EB9026EF9F8E53A76AF4C123A16B822B3707EE80548F002C39999BCC03B70C44FFF2AEA05F609EC2843871BB1AEC6DA66E2AEF000B7C34B64FDA523FD905438A5D03AD4CCCCB4FD6C2C639B2393EC2CF4421A0974E36CC07AA35EE0F36153CFA6DF624B4AAFC8887C17EB86AC7FE2C6E91020A6C8CF0EBE5C89C8968818DEE75BE655DCD68552A9796D450B8776574A282223E511AB41C60219DBBAF975BC568C7821956AA643CC6BD08DB54563AF9A851A26A661D5B9FE083AF20E599EAA6DD59FC44546A24110A483073B2FC51AD0E88A2805B378A689016FC3C6D73D63189326900ECC4A5F78946C8175A1F64240C0B43E959689CB51C920F8F2F24F025BBB520D5E730E4C2CDB300ED2CC1855784265239032B21429D6C9C51A8964C4E901DE089E3F06CA03811744579479CC81186770E799170D4B49F0699C172C4C33749C543887AA45F3DD487622B7A4A3F799633C4C790615E3B4BF61F4DDAC0F69ADB41C6B27B514DD0E2DB910E92C5DF0E4624D3F8C7221F033BBBF06E53DF742AAB1E6EC5EB590756F341D6B7A028C3810CB0E6489D98B7BEF29022D907216504AFD8E02DF2A0850F09A9316056FDBE87064607F7517F80FDF0199F6F3507665DBD22C26B6880754C82C9AB4A1C358638A40869847281BD11480810FF6D1483F9E27721F8158407EB2BD581EA7DCBF65E025C36C166A31037EAE39ECA454738158B7ACC9AB4C54CD538ECA4E14BB8E8793E16519C8D0A49BD0844619A9331289647D8EFA9F674EA7B16C435E70D205B1584F2A14070C2D4C0EE25556F3818CB41263642C8D0ABD6237A301F987AAF346DDA45991C8D8C3EDA723D62712DDE78C55279E13E086BDFB85179CC70F80734AE6432F1D9591CFA887E4C28C1B2D83EA2D2D5E1A8D63B57AB51AA4019DD480D9522760DB2E2DE98A589F569E562C9D68C04482795342FFA51A1E308F9308D93829AC6E8059159E913D78FE08B2A91CD5F62D055E593F9EFF3522024E95C868F9CC1C2A260ECA94742CAE249510EF1BC66747C02C82449C00595D826738707266218F1070E1892AC95E6B5FEBDEC75F66840F8BC5432BA5F8ABCB0592C0F7BEBF3D2348D49A8570748B10602D2924E1D8564080CB2686DE792490CDE314AD89E25EA8A6CB5A04089E06CF798D4D006CC3543B3D0EBEBFC3850B09CF70E901AF68859EE15252C21EBE3CB02F28175DD9945241C09346F6D142F5B763E2E9D3BB2C415006F259650A6531C7FA5EA8AB07867862C7E2592F61B06A1E10E0796DF07EACBFB269705EA971AD48EA561033EFA993F161482C9C328BF28AEDD65EF58A2983F67BC8FABE37BBA8D2ADCAF8F4D49B56A07FAEAC4F80B9B23E53E43C5783537DA85FEBBCB20E971B6091E2D25A287AA9AFB7EF7930F6540581477EF8F98C6E50689C5731FB72657DAA497126263043EBA6A529B1C565C40C50D6A0B2A44A59F6043E8456B78AD2CDBC5C915C083C2D8868BFA3A0276D46D62F97CA309AB12A325292B8B4B1161D93D327339610E448AF089198F0F0378BC39107C8FA9E1A62D12508B4C9D44BB445E7041CADC5F215043C059E0438AE09783FFAF11D5DBAC548F79A88F5AB81276F0CFDAB88D20B532881062521AD7FE9260552B98329D0ED334667100D60D23F37024FC987EED29623BDDDE4030F60D55D41CEF0398BC9271E25591606B10E645283960E5D2B2B1094812885EA50CB6B726606D201ECAA7DD464F9D00C42AF469EB91A2DFFF467770B2F1C5DF565D1473CF3981E281B4F8E0F5A89F2A1C0F5947C2438BCEE4A029E72E3C029270860D2BF950FF5EF4F86E255D6A7A74874438A448440E085FF3A8D604833627D3351E8803E773CCC3E71F9E80CA5F54F01AC335089CB2C637D2CF51FC827876FC133A17C0CE9D0EE12697F446165F137F3C00BD9C5AB6B661EF35A67BF2DAC4A80CB25291F4F0125F9E819D8735910C0336ACF94B20C432593F579D1068BF6D5720A6AD4B824195A53D3CEF5456DCB3801E1859FFFFABEF5FBD6EE12FD68A0DAFAA67C8AD89ABC7DE2D5B4B4B627AD4FE05D2F9A7DBC52A87F1DC0336999656CB50016D94759DFCFF2B874E8C5FD04564ABC530A6BE2BE1035BE8824B69317BC04E9C43D50745D28652D617DCA48A6F575F621EDFB65F9F586F49F3773F3A4F4829595D667A311F05A3A6755CD82914B920830C5F0D4FAD75ED871BC657E005E5BDF045F5693DEE50F65D6710DEBD3AFB6BE5766023C7DC121F990FE4F9D70A4CEA729E34822CE255B5C33C093D8FAE3D2A945008C074FDEF6CFD7778CD951F025433EBABC7A486517575ADED43E59BF54885A7F266DCCB2F4696002A5338E442FB13878DA1AFF0F19D4948E2EF5F607E9CD945E9ED7FE7DE7AD6FB5E7B30178211DF2B813DA60D96FA45E72054984ACEF625A2CE57DC8A334A6D0D293A8E4096CF6DE9003EC3CAEBF140767BE05470FF6EA754E5949A55F813FA9C8542CD666F39532208175E33F36895D62019EE4E31A3B18D9DD3EACD980F7F2A1744A391F72087C061F2863E6BE88C96F0C7BFCE870D55996B2CD05A5F7E3CAF289E0674BC02441FBF3B4C5BD747F4FCFA326782AEFEFF461C75D55C0A3072E8E49F0FDEFDB22CBD08EF3BB47DE8E5B9D52E50945A0EE97CA2BF9D04D2468478CF6E769737585FAED7A61CB66DAEE835FE074FCA5DB395C7F134A077546B249026F484527395A1ED0DC39ACAC4EA9721266F1ADF84AFF6A4082A74D40DA975CA808E88DD636E5A566A8F3F916A24B62B2302D0B687930321BAB5F0D8124221D0A3C915886B51DEA7CDB55E0C8C26715F82945E6FFF757831A44D4F716FA7C3D270FE414A139FD6BE57F6D2335A46FCED3780000000049454E44AE426082'!

createComponents
	super createComponents.
	image := self add: ImagePresenter new name: 'image'.
	edgeChoice := self add: ChoicePresenter new name: 'edgeChoice'.
	viewChoice := self add: ChoicePresenter new name: 'viewChoice'.
	interpolationChoice := self add: ChoicePresenter new name: 'interpolationChoice'.
	classChoice := self add: ChoicePresenter new name: 'classChoice'.
	padding := self add: NumberPresenter new name: 'padding'!

displayImage
	| theImage |
	theImage := self useImageClass fromFile: filename.
	theImage handle.
	image value: theImage!

fileOpen
	| newFilename |
	newFilename := (FileOpenDialog new)
				fileTypes: (Array with: FileDialog allFilesType);
				showModal.
	newFilename notNil 
		ifTrue: 
			[filename := newFilename.
			self displayImage]!

helpAbout
	(MessageBox new)
		caption: 'About ' , self class name asString;
		icon: self class icon;
		text: self class aboutText;
		open!

initialize
	useImageClass := GdiplusImage.
	super initialize!

onViewOpened
	super onViewOpened.
	edgeChoice choices: GdiplusImageView edgeStyles.
	viewChoice choices: GdiplusImageView viewModes.
	interpolationChoice choices: GdiplusImageView interpolationStyles.
	classChoice choices: (Array 
				with: GdiplusImage
				with: GdiplusBitmap
				with: Bitmap
				with: Icon
				with: OLEPicture).
	edgeChoice model: (image view aspectValue: #imageBorder).
	viewChoice model: (image view aspectValue: #viewMode).
	interpolationChoice model: (image view aspectValue: #interpolationMode).
	padding model: (image view aspectValue: #insets).
	classChoice model: (self aspectValue: #useImageClass).
	self attemptDisplayOABitmap!

useImageClass
	"Answer the image class to use"

	^useImageClass!

useImageClass: aClass
	useImageClass := aClass.
	self displayImage! !
!GdiplusImageViewSampleShell categoriesFor: #attemptDisplayOABitmap!operations!public! !
!GdiplusImageViewSampleShell categoriesFor: #beachBallBytes!accessing!public! !
!GdiplusImageViewSampleShell categoriesFor: #createComponents!initializing!public! !
!GdiplusImageViewSampleShell categoriesFor: #displayImage!operations!public! !
!GdiplusImageViewSampleShell categoriesFor: #fileOpen!commands!public! !
!GdiplusImageViewSampleShell categoriesFor: #helpAbout!commands!public! !
!GdiplusImageViewSampleShell categoriesFor: #initialize!event handling!public! !
!GdiplusImageViewSampleShell categoriesFor: #onViewOpened!event handling!public! !
!GdiplusImageViewSampleShell categoriesFor: #useImageClass!accessing!public! !
!GdiplusImageViewSampleShell categoriesFor: #useImageClass:!accessing!public! !

!GdiplusImageViewSampleShell class methodsFor!

aboutText
	^'GdiplusImageViewSampleShell

Copyright: 2003
  Steve Waring <swaring@ozemail.com.au>


DISCLAIMER: This software is freely provided purely as a sample and as such it
is provided "as is", WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE' 
		formatWith: SessionManager current versionInfo productVersionString!

icon
	"Answers an Icon that can be used to represent this class"

	^Icon fromId: 43 in: (ExternalResourceLibrary open: 'Shell32')!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 3 788558 10 ##(Smalltalk.STBViewProxy)  8 ##(Smalltalk.ShellView)  98 27 0 0 98 2 27131905 131073 416 0 721158 ##(Smalltalk.SystemColor)  31 328198 ##(Smalltalk.Point)  1021 721 519 0 0 0 416 852230 ##(Smalltalk.FramingLayout)  234 240 98 4 410 8 ##(Smalltalk.ContainerView)  98 15 0 416 98 2 8 1140850688 131073 608 0 482 31 0 7 0 0 0 608 788230 ##(Smalltalk.BorderLayout)  1 1 0 0 0 0 410 8 ##(Smalltalk.GdiplusImageView)  98 28 0 608 98 2 8 1140850944 1 736 721990 2 ##(Smalltalk.ValueHolder)  0 32 1114638 ##(Smalltalk.STBSingletonProxy)  8 ##(Smalltalk.SearchPolicy)  8 #equality 0 482 31 0 7 0 0 0 736 0 8 4294903833 852486 ##(Smalltalk.NullConverter)  0 0 0 0 0 3 0 8 #normal 8 #default 8 #none 1 0 0 0 0 983302 ##(Smalltalk.MessageSequence)  202 208 98 1 721670 ##(Smalltalk.MessageSend)  8 #createAt:extent: 98 2 514 21 21 514 965 273 736 983302 ##(Smalltalk.WINDOWPLACEMENT)  8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 10 0 0 0 236 1 0 0 146 0 0 0] 98 0 514 193 193 0 27 234 256 98 2 736 8 'image' 590342 ##(Smalltalk.Rectangle)  514 21 21 514 21 21 1026 202 208 98 1 1090 1120 98 2 514 1 301 514 1005 313 608 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 150 0 0 0 246 1 0 0 50 1 0 0] 98 1 736 1248 0 27 1181766 2 ##(Smalltalk.FramingConstraints)  858 8 ##(Smalltalk.FramingCalculation)  8 #fixedParentLeft 1 858 1584 8 #fixedParentRight 1 858 1584 8 #fixedPreviousBottom 1 858 1584 8 #fixedParentBottom 1 410 624 98 15 0 416 98 2 8 1140850688 131073 1712 0 482 31 0 7 0 0 0 1712 0 234 256 98 10 410 8 ##(Smalltalk.ListBox)  98 17 0 1712 98 2 8 1144062209 1025 1824 590662 2 ##(Smalltalk.ListModel)  202 208 98 0 0 858 880 8 #identity 524550 ##(Smalltalk.ColorRef)  8 4278190080 0 7 0 0 0 1824 0 8 4294905329 8 ##(Smalltalk.BasicListAbstract)  1952 32 1026 202 208 98 2 1090 1120 98 2 514 31 11 514 181 221 1824 1090 8 #horizontalExtent: 98 1 1 1824 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 15 0 0 0 5 0 0 0 105 0 0 0 115 0 0 0] 98 0 1248 0 27 8 'edgeChoice' 410 8 ##(Smalltalk.TextEdit)  98 16 0 1712 98 2 8 1140924416 1025 2304 0 2002 2032 0 7 0 0 0 2304 0 8 4294904413 852742 ##(Smalltalk.IntegerToText)  0 8 '' 0 1 1026 202 208 98 3 1090 1120 98 2 514 831 11 514 141 51 2304 1090 8 #selectionRange: 98 1 525062 ##(Smalltalk.Interval)  3 1 3 2304 1090 8 #isTextModified: 98 1 32 2304 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 159 1 0 0 5 0 0 0 229 1 0 0 30 0 0 0] 98 0 1248 0 27 8 'padding' 410 1840 98 17 0 1712 98 2 8 1144062209 1025 2768 1906 202 208 1952 0 1968 2002 2032 0 7 0 0 0 2768 0 8 4294905329 2064 1952 32 1026 202 208 98 2 1090 1120 98 2 514 221 11 514 181 221 2768 1090 2208 98 1 1 2768 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 110 0 0 0 5 0 0 0 200 0 0 0 115 0 0 0] 98 0 1248 0 27 8 'viewChoice' 410 1840 98 17 0 1712 98 2 8 1144062209 1025 3104 1906 202 208 1952 0 1968 2002 2032 0 7 0 0 0 3104 0 8 4294905329 2064 1952 32 1026 202 208 98 2 1090 1120 98 2 514 601 11 514 181 221 3104 1090 2208 98 1 1 3104 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 44 1 0 0 5 0 0 0 134 1 0 0 115 0 0 0] 98 0 1248 0 27 8 'classChoice' 410 1840 98 17 0 1712 98 2 8 1144062209 1025 3440 1906 202 208 1952 0 1968 2002 2032 0 7 0 0 0 3440 0 8 4294905329 2064 1952 32 1026 202 208 98 2 1090 1120 98 2 514 411 11 514 181 221 3440 1090 2208 98 1 1 3440 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 205 0 0 0 5 0 0 0 39 1 0 0 115 0 0 0] 98 0 1248 0 27 8 'interpolationChoice' 0 1026 202 208 98 1 1090 1120 98 2 514 1 1 514 1005 301 1712 1186 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 246 1 0 0 150 0 0 0] 98 5 1824 2768 2304 3440 3104 1248 0 27 1538 1568 1 1616 1 858 1584 8 #fixedParentTop 1 858 1584 8 #fixedViewTop 301 234 256 1952 0 461638 4 ##(Smalltalk.MenuBar)  0 16 98 2 265030 4 ##(Smalltalk.Menu)  0 16 98 1 984134 2 ##(Smalltalk.CommandMenuItem)  1 1180998 4 ##(Smalltalk.CommandDescription)  8 #fileOpen 8 '&Open ...' 9375 1 0 0 0 8 '&File' 0 1 0 0 52823 0 0 4082 0 16 98 1 4130 1 4162 8 #helpAbout 8 'About' 1 1 0 0 0 8 'Help' 0 1 0 0 52827 0 0 8 '' 0 1 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 1026 202 208 98 3 1090 1120 98 2 514 2799 21 514 1021 721 416 1090 8 #text: 98 1 8 'GdiplusImageView Sample' 416 1090 8 #updateMenuBar 1952 416 1186 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 119 5 0 0 10 0 0 0 117 7 0 0 114 1 0 0] 98 2 1712 608 1248 0 27 )! !
!GdiplusImageViewSampleShell class categoriesFor: #aboutText!enquiries!public! !
!GdiplusImageViewSampleShell class categoriesFor: #icon!constants!public! !
!GdiplusImageViewSampleShell class categoriesFor: #resource_Default_view!public!resources-views! !
