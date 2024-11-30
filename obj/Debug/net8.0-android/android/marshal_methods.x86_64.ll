; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [402 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [804 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 270
	i64 41476505231138781, ; 1: System.ServiceModel.Syndication.dll => 0x935aa968d39fdd => 228
	i64 44359872337921045, ; 2: System.ServiceModel.NetTcp => 0x9d9911a0fbc415 => 224
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 184
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 170
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 190
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 57
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 255
	i64 229794953483747371, ; 8: System.ValueTuple.dll => 0x330654aed93802b => 150
	i64 232391251801502327, ; 9: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 305
	i64 233177144301842968, ; 10: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 256
	i64 295915112840604065, ; 11: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 308
	i64 316157742385208084, ; 12: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 264
	i64 333197648493663934, ; 13: System.DirectoryServices => 0x49fc17ef675d6be => 208
	i64 350667413455104241, ; 14: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 131
	i64 396868157601372792, ; 15: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 400
	i64 422779754995088667, ; 16: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 55
	i64 435118502366263740, ; 17: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 307
	i64 439161221770931646, ; 18: System.ServiceModel.Security => 0x61836cdeec86dbe => 227
	i64 453109487449598763, ; 19: cs/System.Web.Services.Description.resources.dll => 0x649c4ad9bcaeb2b => 385
	i64 467327040140386790, ; 20: ru/System.Private.ServiceModel.resources.dll => 0x67c47778d80a1e6 => 381
	i64 484539834484692102, ; 21: CheckInOutCGA.dll => 0x6b96e6989fc9486 => 0
	i64 502670939551102150, ; 22: System.Management.dll => 0x6f9d88e66daf4c6 => 214
	i64 535107122908063503, ; 23: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 182
	i64 545109961164950392, ; 24: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 345
	i64 560278790331054453, ; 25: System.Reflection.Primitives => 0x7c6829760de3975 => 94
	i64 590337075967009532, ; 26: Microsoft.Maui.Maps.dll => 0x8314c715ec1a2fc => 192
	i64 592295183581559413, ; 27: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x8384154d38dba75 => 281
	i64 598946427227332230, ; 28: pl\System.Private.ServiceModel.resources => 0x84fe29a2a5fde86 => 379
	i64 634308326490598313, ; 29: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 286
	i64 649145001856603771, ; 30: System.Security.SecureString => 0x90239f09b62167b => 128
	i64 702024105029695270, ; 31: System.Drawing.Common => 0x9be17343c0e7726 => 211
	i64 703889276121812442, ; 32: System.ServiceModel.Duplex.dll => 0x9c4b79138728dda => 222
	i64 720058930071658100, ; 33: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x9fe29c82844de74 => 277
	i64 750875890346172408, ; 34: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 144
	i64 798450721097591769, ; 35: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 257
	i64 799765834175365804, ; 36: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 37: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 348
	i64 872800313462103108, ; 38: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 269
	i64 895210737996778430, ; 39: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 288
	i64 926586271160641525, ; 40: ja/System.Web.Services.Description.resources.dll => 0xcdbe54dea48a7f5 => 390
	i64 940822596282819491, ; 41: System.Transactions => 0xd0e792aa81923a3 => 149
	i64 960778385402502048, ; 42: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 103
	i64 1010599046655515943, ; 43: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 94
	i64 1024474055230782933, ; 44: it/System.Private.ServiceModel.resources.dll => 0xe37a9b9afa27dd5 => 376
	i64 1120440138749646132, ; 45: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 321
	i64 1121665720830085036, ; 46: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 356
	i64 1190058439354357255, ; 47: System.Data.Odbc => 0x1083efd86bac1607 => 202
	i64 1268860745194512059, ; 48: System.Drawing.dll => 0x119be62002c19ebb => 35
	i64 1301626418029409250, ; 49: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 27
	i64 1315114680217950157, ; 50: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 245
	i64 1369545283391376210, ; 51: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 298
	i64 1404195534211153682, ; 52: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 49
	i64 1425944114962822056, ; 53: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 114
	i64 1471138319665509160, ; 54: de/System.Web.Services.Description.resources.dll => 0x146a8881df20b328 => 386
	i64 1476839205573959279, ; 55: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 69
	i64 1486715745332614827, ; 56: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 186
	i64 1491290866305144020, ; 57: Xamarin.Google.AutoValue.Annotations.dll => 0x14b2212446e714d4 => 322
	i64 1492954217099365037, ; 58: System.Net.HttpListener => 0x14b809f350210aad => 64
	i64 1513467482682125403, ; 59: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 169
	i64 1537168428375924959, ; 60: System.Threading.Thread.dll => 0x15551e8a954ae0df => 144
	i64 1556147632182429976, ; 61: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 354
	i64 1576750169145655260, ; 62: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 320
	i64 1624659445732251991, ; 63: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 244
	i64 1628611045998245443, ; 64: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 293
	i64 1636321030536304333, ; 65: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 278
	i64 1651782184287836205, ; 66: System.Globalization.Calendars => 0x16ec4f2524cb982d => 39
	i64 1659332977923810219, ; 67: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 88
	i64 1682513316613008342, ; 68: System.Net.dll => 0x17597cf276952bd6 => 80
	i64 1731380447121279447, ; 69: Newtonsoft.Json => 0x18071957e9b889d7 => 195
	i64 1735388228521408345, ; 70: System.Net.Mail.dll => 0x181556663c69b759 => 65
	i64 1743969030606105336, ; 71: System.Memory.dll => 0x1833d297e88f2af8 => 61
	i64 1767386781656293639, ; 72: System.Private.Uri.dll => 0x188704e9f5582107 => 85
	i64 1795316252682057001, ; 73: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 243
	i64 1825687700144851180, ; 74: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 105
	i64 1835311033149317475, ; 75: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 344
	i64 1836611346387731153, ; 76: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 305
	i64 1854145951182283680, ; 77: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 101
	i64 1865037103900624886, ; 78: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 174
	i64 1875417405349196092, ; 79: System.Drawing.Primitives => 0x1a06d2319b6c713c => 34
	i64 1875917498431009007, ; 80: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 240
	i64 1881198190668717030, ; 81: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 366
	i64 1897575647115118287, ; 82: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 307
	i64 1920760634179481754, ; 83: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 188
	i64 1959996714666907089, ; 84: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 366
	i64 1972385128188460614, ; 85: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 118
	i64 1977960130541776444, ; 86: pt-BR/System.Private.ServiceModel.resources.dll => 0x1b73204250d3ee3c => 380
	i64 1981742497975770890, ; 87: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 290
	i64 1983698669889758782, ; 88: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 340
	i64 2019660174692588140, ; 89: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 358
	i64 2040001226662520565, ; 90: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 141
	i64 2062890601515140263, ; 91: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 140
	i64 2065882923250578731, ; 92: System.Reflection.Context => 0x1cab7d92bbe5752b => 216
	i64 2080945842184875448, ; 93: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 52
	i64 2102659300918482391, ; 94: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 34
	i64 2106033277907880740, ; 95: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 140
	i64 2133195048986300728, ; 96: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 195
	i64 2146774709456442227, ; 97: Microsoft.Win32.Registry.AccessControl.dll => 0x1dcae03961f19373 => 193
	i64 2165252314452558154, ; 98: Xamarin.AndroidX.Camera.Camera2.dll => 0x1e0c85820c09814a => 250
	i64 2165310824878145998, ; 99: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 237
	i64 2165725771938924357, ; 100: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 249
	i64 2179044287603734398, ; 101: zh-Hans/System.Private.ServiceModel.resources.dll => 0x1e3d853c0876f77e => 383
	i64 2200176636225660136, ; 102: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 181
	i64 2203565783020068373, ; 103: Xamarin.KotlinX.Coroutines.Core => 0x1e94a367981dde15 => 332
	i64 2262844636196693701, ; 104: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 269
	i64 2287834202362508563, ; 105: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 106: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 107: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 362
	i64 2304837677853103545, ; 108: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 304
	i64 2315304989185124968, ; 109: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 50
	i64 2329709569556905518, ; 110: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 283
	i64 2335503487726329082, ; 111: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 135
	i64 2337758774805907496, ; 112: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 100
	i64 2468706141094522700, ; 113: tr\System.Web.Services.Description.resources => 0x22429b27d2c3af4c => 395
	i64 2470498323731680442, ; 114: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 262
	i64 2479423007379663237, ; 115: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 315
	i64 2497223385847772520, ; 116: System.Runtime => 0x22a7eb7046413568 => 115
	i64 2547086958574651984, ; 117: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 238
	i64 2554797818648757682, ; 118: System.Runtime.Caching.dll => 0x23747714858085b2 => 217
	i64 2592350477072141967, ; 119: System.Xml.dll => 0x23f9e10627330e8f => 162
	i64 2602673633151553063, ; 120: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 365
	i64 2624866290265602282, ; 121: mscorlib.dll => 0x246d65fbde2db8ea => 165
	i64 2632269733008246987, ; 122: System.Net.NameResolution => 0x2487b36034f808cb => 66
	i64 2656907746661064104, ; 123: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 177
	i64 2662981627730767622, ; 124: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 340
	i64 2699342487583673876, ; 125: ru\System.Private.ServiceModel.resources => 0x2575fdb0d38b4e14 => 381
	i64 2706075432581334785, ; 126: System.Net.WebSockets => 0x258de944be6c0701 => 79
	i64 2739068961103071885, ; 127: ko\System.Private.ServiceModel.resources => 0x260320b539d8ca8d => 378
	i64 2783046991838674048, ; 128: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 100
	i64 2787234703088983483, ; 129: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 309
	i64 2815524396660695947, ; 130: System.Security.AccessControl => 0x2712c0857f68238b => 116
	i64 2851879596360956261, ; 131: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 201
	i64 2895129759130297543, ; 132: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 345
	i64 2923871038697555247, ; 133: Jsr305Binding => 0x2893ad37e69ec52f => 323
	i64 2963340820641411084, ; 134: ja/System.Private.ServiceModel.resources.dll => 0x291fe6c6a2bef00c => 377
	i64 3017136373564924869, ; 135: System.Net.WebProxy => 0x29df058bd93f63c5 => 77
	i64 3017704767998173186, ; 136: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 321
	i64 3062772059105072826, ; 137: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 399
	i64 3106852385031680087, ; 138: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 113
	i64 3110390492489056344, ; 139: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 120
	i64 3135773902340015556, ; 140: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 47
	i64 3200246253487496677, ; 141: ko\System.Web.Services.Description.resources => 0x2c698f030ce59de5 => 391
	i64 3238539556702659506, ; 142: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 194
	i64 3244151229865893572, ; 143: pt-BR\System.Private.ServiceModel.resources => 0x2d058a5af5cd9ec4 => 380
	i64 3281594302220646930, ; 144: System.Security.Principal => 0x2d8a90a198ceba12 => 127
	i64 3289520064315143713, ; 145: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 280
	i64 3303437397778967116, ; 146: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 241
	i64 3311221304742556517, ; 147: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 81
	i64 3325875462027654285, ; 148: System.Runtime.Numerics => 0x2e27e21c8958b48d => 109
	i64 3328853167529574890, ; 149: System.Net.Sockets.dll => 0x2e327651a008c1ea => 74
	i64 3344514922410554693, ; 150: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 333
	i64 3349304712359604436, ; 151: Xamarin.KotlinX.Serialization.Core => 0x2e7b1ee3f8bc70d4 => 334
	i64 3402559797031278872, ; 152: zh-Hant\System.Private.ServiceModel.resources => 0x2f38521b9d131918 => 384
	i64 3429672777697402584, ; 153: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 190
	i64 3437845325506641314, ; 154: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 52
	i64 3493805808809882663, ; 155: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 311
	i64 3494946837667399002, ; 156: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 175
	i64 3508450208084372758, ; 157: System.Net.Ping => 0x30b084e02d03ad16 => 68
	i64 3522470458906976663, ; 158: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 310
	i64 3531994851595924923, ; 159: System.Numerics => 0x31042a9aade235bb => 82
	i64 3551103847008531295, ; 160: System.Private.CoreLib.dll => 0x31480e226177735f => 171
	i64 3567343442040498961, ; 161: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 360
	i64 3571415421602489686, ; 162: System.Runtime.dll => 0x319037675df7e556 => 115
	i64 3634544395678783861, ; 163: System.ServiceModel => 0x32707edf08d21975 => 226
	i64 3638003163729360188, ; 164: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 176
	i64 3647754201059316852, ; 165: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 155
	i64 3655542548057982301, ; 166: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 175
	i64 3659371656528649588, ; 167: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 235
	i64 3716579019761409177, ; 168: netstandard.dll => 0x3393f0ed5c8c5c99 => 166
	i64 3727469159507183293, ; 169: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 303
	i64 3772598417116884899, ; 170: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 270
	i64 3808596350265393157, ; 171: System.Diagnostics.PerformanceCounter.dll => 0x34dada33a66b0005 => 207
	i64 3869221888984012293, ; 172: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 179
	i64 3869649043256705283, ; 173: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 31
	i64 3890352374528606784, ; 174: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 188
	i64 3919223565570527920, ; 175: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 121
	i64 3933965368022646939, ; 176: System.Net.Requests => 0x369840a8bfadc09b => 71
	i64 3966267475168208030, ; 177: System.Memory => 0x370b03412596249e => 61
	i64 3977057140822825553, ; 178: zh-Hans/System.Web.Services.Description.resources.dll => 0x37315865f22cda51 => 396
	i64 4006972109285359177, ; 179: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 160
	i64 4009997192427317104, ; 180: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 112
	i64 4059240797296412435, ; 181: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 0x385551ff94a04713 => 289
	i64 4073500526318903918, ; 182: System.Private.Xml.dll => 0x3887fb25779ae26e => 87
	i64 4073631083018132676, ; 183: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 185
	i64 4120493066591692148, ; 184: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 371
	i64 4148881117810174540, ; 185: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 104
	i64 4154383907710350974, ; 186: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 187: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 145
	i64 4168469861834746866, ; 188: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 117
	i64 4187479170553454871, ; 189: System.Linq.Expressions => 0x3a1cea1e912fa117 => 57
	i64 4201423742386704971, ; 190: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 264
	i64 4205801962323029395, ; 191: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 192: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 51
	i64 4282138915307457788, ; 193: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 91
	i64 4321177614414309855, ; 194: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 399
	i64 4321865999928413850, ; 195: System.Diagnostics.EventLog.dll => 0x3bfa5a3a8c924e9a => 206
	i64 4326933140005261798, ; 196: Xamarin.AndroidX.Biometric => 0x3c0c5ac408e111e6 => 248
	i64 4356591372459378815, ; 197: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 368
	i64 4373617458794931033, ; 198: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 54
	i64 4388777479429739993, ; 199: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 398
	i64 4397634830160618470, ; 200: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 128
	i64 4416438729942139093, ; 201: ko/System.Private.ServiceModel.resources.dll => 0x3d4a57a0267a80d5 => 378
	i64 4477672992252076438, ; 202: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 151
	i64 4484706122338676047, ; 203: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 40
	i64 4533124835995628778, ; 204: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 91
	i64 4620536241703500132, ; 205: System.Data.SqlClient.dll => 0x401f713b2e8e3964 => 204
	i64 4636684751163556186, ; 206: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 316
	i64 4672453897036726049, ; 207: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 49
	i64 4679594760078841447, ; 208: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 338
	i64 4716677666592453464, ; 209: System.Xml.XmlSerializer => 0x417501590542f358 => 161
	i64 4725285941539738176, ; 210: Xamarin.AndroidX.Camera.Lifecycle => 0x41939687379f9240 => 252
	i64 4743821336939966868, ; 211: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 212: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 285
	i64 4782108999019072045, ; 213: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0x425d76cc43bb0a2d => 247
	i64 4794310189461587505, ; 214: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 238
	i64 4795410492532947900, ; 215: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 310
	i64 4809057822547766521, ; 216: System.Drawing => 0x42bd349c3145ecf9 => 35
	i64 4814660307502931973, ; 217: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 66
	i64 4853321196694829351, ; 218: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 108
	i64 5055365687667823624, ; 219: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 239
	i64 5081566143765835342, ; 220: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 98
	i64 5099468265966638712, ; 221: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 98
	i64 5103417709280584325, ; 222: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5182934613077526976, ; 223: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 224: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 295
	i64 5244375036463807528, ; 225: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5250007912929493792, ; 226: Xamarin.KotlinX.Serialization.Core.dll => 0x48dbc6618e270320 => 334
	i64 5262971552273843408, ; 227: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 127
	i64 5266851800019912408, ; 228: System.Data.SqlClient => 0x49179dcea0d046d8 => 204
	i64 5269787546958309973, ; 229: Xamarin.KotlinX.Serialization.Core.Jvm => 0x49220bda7a3a2a55 => 335
	i64 5278787618751394462, ; 230: System.Net.WebClient.dll => 0x4942055efc68329e => 75
	i64 5280980186044710147, ; 231: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 284
	i64 5290267788238057277, ; 232: ko/System.Web.Services.Description.resources.dll => 0x496ace863c9eef3d => 391
	i64 5290786973231294105, ; 233: System.Runtime.Loader => 0x496ca6b869b72699 => 108
	i64 5348796042099802469, ; 234: Xamarin.AndroidX.Media => 0x4a3abda9415fc165 => 296
	i64 5376510917114486089, ; 235: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 315
	i64 5408338804355907810, ; 236: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 313
	i64 5423376490970181369, ; 237: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 105
	i64 5440320908473006344, ; 238: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5444389399195432018, ; 239: System.ServiceProcess.ServiceController.dll => 0x4b8e5b501df23452 => 229
	i64 5446034149219586269, ; 240: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 241: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 260
	i64 5457765010617926378, ; 242: System.Xml.Serialization => 0x4bbde05c557002ea => 156
	i64 5471532531798518949, ; 243: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 364
	i64 5488847537322884930, ; 244: System.Windows.Extensions => 0x4c2c4dc108687f42 => 233
	i64 5507995362134886206, ; 245: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 246: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 367
	i64 5527431512186326818, ; 247: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 48
	i64 5570799893513421663, ; 248: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 42
	i64 5573260873512690141, ; 249: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 125
	i64 5573669443803475672, ; 250: Microsoft.Maui.Controls.Maps => 0x4d59a6d41d5aeed8 => 187
	i64 5574231584441077149, ; 251: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 242
	i64 5591791169662171124, ; 252: System.Linq.Parallel => 0x4d9a087135e137f4 => 58
	i64 5624241181704787056, ; 253: de/System.Private.ServiceModel.resources.dll => 0x4e0d518e66a31470 => 373
	i64 5650097808083101034, ; 254: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 118
	i64 5650370239627215726, ; 255: System.ServiceModel.Security.dll => 0x4e6a25cbc66b436e => 227
	i64 5692067934154308417, ; 256: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 318
	i64 5724799082821825042, ; 257: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 273
	i64 5757522595884336624, ; 258: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 258
	i64 5765166532294674667, ; 259: Xamarin.KotlinX.AtomicFU.Jvm.dll => 0x5001fc6a7c6508eb => 330
	i64 5783556987928984683, ; 260: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5803012130663436218, ; 261: System.DirectoryServices.AccountManagement.dll => 0x508870c9837a0fba => 209
	i64 5807471020555457579, ; 262: ja\System.Web.Services.Description.resources => 0x5098481fb795542b => 390
	i64 5896680224035167651, ; 263: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 282
	i64 5959344983920014087, ; 264: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 306
	i64 5974002045223400615, ; 265: Plugin.Fingerprint => 0x52e7eb3560ff74a7 => 196
	i64 5979151488806146654, ; 266: System.Formats.Asn1 => 0x52fa3699a489d25e => 37
	i64 5984759512290286505, ; 267: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 123
	i64 6068057819846744445, ; 268: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 361
	i64 6102788177522843259, ; 269: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 306
	i64 6200764641006662125, ; 270: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 361
	i64 6222399776351216807, ; 271: System.Text.Json.dll => 0x565a67a0ffe264a7 => 136
	i64 6251069312384999852, ; 272: System.Transactions.Local => 0x56c0426b870da1ac => 148
	i64 6278736998281604212, ; 273: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 84
	i64 6284145129771520194, ; 274: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 89
	i64 6319713645133255417, ; 275: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 286
	i64 6357457916754632952, ; 276: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 401
	i64 6401687960814735282, ; 277: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 283
	i64 6478287442656530074, ; 278: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 349
	i64 6504860066809920875, ; 279: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 249
	i64 6548213210057960872, ; 280: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 266
	i64 6557084851308642443, ; 281: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 319
	i64 6560151584539558821, ; 282: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 183
	i64 6571268269913383179, ; 283: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 0x5b31d5ace7fba10b => 289
	i64 6589202984700901502, ; 284: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 325
	i64 6591971792923354531, ; 285: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 284
	i64 6617685658146568858, ; 286: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 132
	i64 6659513131007730089, ; 287: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0x5c6b57e8b6c3e1a9 => 277
	i64 6713440830605852118, ; 288: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 95
	i64 6739853162153639747, ; 289: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 290: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 357
	i64 6763861193558508191, ; 291: System.IO.Ports => 0x5dde0feb481ac29f => 213
	i64 6772837112740759457, ; 292: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 104
	i64 6777482997383978746, ; 293: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 360
	i64 6786606130239981554, ; 294: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 32
	i64 6798329586179154312, ; 295: System.Windows => 0x5e5884bd523ca188 => 153
	i64 6814185388980153342, ; 296: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 157
	i64 6876862101832370452, ; 297: System.Xml.Linq => 0x5f6f85a57d108914 => 154
	i64 6894844156784520562, ; 298: System.Numerics.Vectors => 0x5faf683aead1ad72 => 81
	i64 6987056692196838363, ; 299: System.Management => 0x60f7030ae3e88bdb => 214
	i64 7011053663211085209, ; 300: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 275
	i64 7033815339267038729, ; 301: tr\System.Private.ServiceModel.resources => 0x619d21c8c8b49e09 => 382
	i64 7036436454368433159, ; 302: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x61a671acb33d5407 => 279
	i64 7060448593242414269, ; 303: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 220
	i64 7060896174307865760, ; 304: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 142
	i64 7083547580668757502, ; 305: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 86
	i64 7101497697220435230, ; 306: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 307: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 276
	i64 7105430439328552570, ; 308: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 218
	i64 7112547816752919026, ; 309: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 50
	i64 7192745174564810625, ; 310: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 237
	i64 7220009545223068405, ; 311: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 364
	i64 7270811800166795866, ; 312: System.Linq => 0x64e71ccf51a90a5a => 60
	i64 7299370801165188114, ; 313: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 53
	i64 7316205155833392065, ; 314: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 315: System.Reflection => 0x65d67f295d0740ad => 96
	i64 7349431895026339542, ; 316: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 236
	i64 7377312882064240630, ; 317: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7487567311228912585, ; 318: tr/System.Web.Services.Description.resources.dll => 0x67e92ecc79a043c9 => 395
	i64 7488575175965059935, ; 319: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 154
	i64 7489048572193775167, ; 320: System.ObjectModel => 0x67ee71ff6b419e3f => 83
	i64 7503526963013706253, ; 321: System.ServiceModel.dll => 0x6821e20478ff620d => 226
	i64 7592577537120840276, ; 322: System.Diagnostics.Process => 0x695e410af5b2aa54 => 28
	i64 7637303409920963731, ; 323: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 44
	i64 7654504624184590948, ; 324: System.Net.Http => 0x6a3a4366801b8264 => 63
	i64 7694700312542370399, ; 325: System.Net.Mail => 0x6ac9112a7e2cda5f => 65
	i64 7708790323521193081, ; 326: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 355
	i64 7714652370974252055, ; 327: System.Private.CoreLib => 0x6b0ff375198b9c17 => 171
	i64 7725404731275645577, ; 328: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 288
	i64 7735176074855944702, ; 329: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 330: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 328
	i64 7756332380610150586, ; 331: Xamarin.Google.AutoValue.Annotations => 0x6ba407349220c0ba => 322
	i64 7791074099216502080, ; 332: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 46
	i64 7820441508502274321, ; 333: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 334: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 244
	i64 8025517457475554965, ; 335: WindowsBase => 0x6f605d9b4786ce95 => 164
	i64 8031450141206250471, ; 336: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 107
	i64 8044118961405839122, ; 337: System.ComponentModel.Composition => 0x6fa2739369944712 => 199
	i64 8064050204834738623, ; 338: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 339: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 280
	i64 8085230611270010360, ; 340: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 62
	i64 8087206902342787202, ; 341: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 205
	i64 8103644804370223335, ; 342: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 343: System.Reflection.Extensions => 0x70995ab73cf916ec => 92
	i64 8167236081217502503, ; 344: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 167
	i64 8185542183669246576, ; 345: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 346: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 331
	i64 8205325986359039106, ; 347: System.DirectoryServices.dll => 0x71df2c82cb365482 => 208
	i64 8246048515196606205, ; 348: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 191
	i64 8264926008854159966, ; 349: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 28
	i64 8290740647658429042, ; 350: System.Runtime.Extensions => 0x730ea0b15c929a72 => 102
	i64 8311982169281665208, ; 351: System.Threading.AccessControl => 0x735a17be836a18b8 => 231
	i64 8318905602908530212, ; 352: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8320777595162576093, ; 353: Xamarin.AndroidX.Camera.View => 0x737957232eb1c4dd => 253
	i64 8368701292315763008, ; 354: System.Security.Cryptography => 0x7423997c6fd56140 => 125
	i64 8398329775253868912, ; 355: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 261
	i64 8400357532724379117, ; 356: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 300
	i64 8410671156615598628, ; 357: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 90
	i64 8414464712956060639, ; 358: cs\System.Web.Services.Description.resources => 0x74c62f131ece23df => 385
	i64 8426919725312979251, ; 359: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 285
	i64 8476857680833348370, ; 360: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 221
	i64 8518412311883997971, ; 361: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 362: System.Private.Uri => 0x76d841191140ca5b => 85
	i64 8598790081731763592, ; 363: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 272
	i64 8601935802264776013, ; 364: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 313
	i64 8614108721271900878, ; 365: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 359
	i64 8623059219396073920, ; 366: System.Net.Quic.dll => 0x77ab42ac514299c0 => 70
	i64 8626175481042262068, ; 367: Java.Interop => 0x77b654e585b55834 => 167
	i64 8629545377263870989, ; 368: Xamarin.AndroidX.Camera.Core.dll => 0x77c24dcca0ed640d => 251
	i64 8638972117149407195, ; 369: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 370: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 299
	i64 8648495978913578441, ; 371: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 372: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 359
	i64 8684531736582871431, ; 373: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 43
	i64 8725526185868997716, ; 374: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 205
	i64 8737466138135583923, ; 375: Xamarin.AndroidX.Concurrent.Futures.Ktx.dll => 0x7941b728d8935cb3 => 259
	i64 8941376889969657626, ; 376: System.Xml.XDocument => 0x7c1626e87187471a => 157
	i64 8951477988056063522, ; 377: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 302
	i64 8954753533646919997, ; 378: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 111
	i64 9031035476476434958, ; 379: Xamarin.KotlinX.Coroutines.Core.dll => 0x7d54aeead9541a0e => 332
	i64 9045785047181495996, ; 380: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 369
	i64 9072430189789714220, ; 381: fr\System.Web.Services.Description.resources => 0x7de7bf3097f2172c => 388
	i64 9131857290992441898, ; 382: Xamarin.AndroidX.Camera.Core => 0x7ebadfd2d12a5a2a => 251
	i64 9138683372487561558, ; 383: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 120
	i64 9312692141327339315, ; 384: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 318
	i64 9324707631942237306, ; 385: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 243
	i64 9468215723722196442, ; 386: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 158
	i64 9554839972845591462, ; 387: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 130
	i64 9575902398040817096, ; 388: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 324
	i64 9584643793929893533, ; 389: System.IO.dll => 0x85037ebfbbd7f69d => 56
	i64 9602387229852750659, ; 390: fr/System.Private.ServiceModel.resources.dll => 0x8542884f571ed343 => 375
	i64 9659729154652888475, ; 391: System.Text.RegularExpressions => 0x860e407c9991dd9b => 137
	i64 9662334977499516867, ; 392: System.Numerics.dll => 0x8617827802b0cfc3 => 82
	i64 9667360217193089419, ; 393: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 29
	i64 9678050649315576968, ; 394: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 262
	i64 9698341835325479878, ; 395: it\System.Web.Services.Description.resources => 0x86976e83e4e29bc6 => 389
	i64 9702891218465930390, ; 396: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9711637524876806384, ; 397: Xamarin.AndroidX.Media.dll => 0x86c6aadfd9a2c8f0 => 296
	i64 9733219566593817111, ; 398: es\System.Web.Services.Description.resources => 0x871357a083b4ba17 => 387
	i64 9780093022148426479, ; 399: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 320
	i64 9808709177481450983, ; 400: Mono.Android.dll => 0x881f890734e555e7 => 170
	i64 9825649861376906464, ; 401: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 258
	i64 9834056768316610435, ; 402: System.Transactions.dll => 0x8879968718899783 => 149
	i64 9836529246295212050, ; 403: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 93
	i64 9855729604559733082, ; 404: System.ComponentModel.Composition.Registration.dll => 0x88c695db8215815a => 200
	i64 9907349773706910547, ; 405: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 272
	i64 9933555792566666578, ; 406: System.Linq.Queryable.dll => 0x89db145cf475c552 => 59
	i64 9944651556817100360, ; 407: ru/System.Web.Services.Description.resources.dll => 0x8a027fe6e31e5e48 => 394
	i64 9956195530459977388, ; 408: Microsoft.Maui => 0x8a2b8315b36616ac => 189
	i64 9959489431142554298, ; 409: System.CodeDom => 0x8a3736deb7825aba => 198
	i64 9974604633896246661, ; 410: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 156
	i64 9982270450505025232, ; 411: pt-BR/System.Web.Services.Description.resources.dll => 0x8a8826161e3b06d0 => 393
	i64 9990311192647791659, ; 412: cs\System.Private.ServiceModel.resources => 0x8aa4b7194961742b => 372
	i64 9991543690424095600, ; 413: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 344
	i64 10017511394021241210, ; 414: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 181
	i64 10038780035334861115, ; 415: System.Net.Http.dll => 0x8b50e941206af13b => 63
	i64 10051358222726253779, ; 416: System.Private.Xml => 0x8b7d990c97ccccd3 => 87
	i64 10078727084704864206, ; 417: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 78
	i64 10089571585547156312, ; 418: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 46
	i64 10092835686693276772, ; 419: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 186
	i64 10096670194649521199, ; 420: System.ServiceModel.Primitives => 0x8c1e940c2e5bdc2f => 225
	i64 10105485790837105934, ; 421: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 142
	i64 10143853363526200146, ; 422: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 341
	i64 10200072684231079950, ; 423: System.IO.Ports.dll => 0x8d8df01062c2380e => 213
	i64 10229024438826829339, ; 424: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 266
	i64 10236703004850800690, ; 425: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 73
	i64 10245369515835430794, ; 426: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 90
	i64 10252714262739571204, ; 427: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 398
	i64 10260006279618500994, ; 428: Microsoft.Win32.Registry.AccessControl => 0x8e62dd59f9f01982 => 193
	i64 10318047534812931528, ; 429: Xamarin.AndroidX.Biometric.dll => 0x8f311190c81ea5c8 => 248
	i64 10321854143672141184, ; 430: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 327
	i64 10360651442923773544, ; 431: System.Text.Encoding => 0x8fc86d98211c1e68 => 134
	i64 10364469296367737616, ; 432: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 89
	i64 10376576884623852283, ; 433: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 311
	i64 10376957530341161767, ; 434: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 0x90025be4f54cbb27 => 287
	i64 10406448008575299332, ; 435: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 333
	i64 10430153318873392755, ; 436: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 263
	i64 10447083246144586668, ; 437: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 174
	i64 10462351817401264119, ; 438: System.ComponentModel.Composition.Registration => 0x9131bd8bc75d67f7 => 200
	i64 10497767309912479810, ; 439: System.Speech => 0x91af8fbfb20a9842 => 230
	i64 10506226065143327199, ; 440: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 339
	i64 10539440363036643513, ; 441: Xamarin.KotlinX.AtomicFU.dll => 0x92439d2b7a3690b9 => 329
	i64 10546663366131771576, ; 442: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 111
	i64 10566960649245365243, ; 443: System.Globalization.dll => 0x92a562b96dcd13fb => 41
	i64 10595762989148858956, ; 444: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 158
	i64 10650478070646097812, ; 445: System.IO.Packaging => 0x93ce196068f2c794 => 212
	i64 10664060258477486268, ; 446: Xamarin.AndroidX.Lifecycle.Runtime.Android => 0x93fe5a4df1e930bc => 287
	i64 10670374202010151210, ; 447: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 448: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 102
	i64 10785150219063592792, ; 449: System.Net.Primitives => 0x95ac8cfb68830758 => 69
	i64 10822644899632537592, ; 450: System.Linq.Queryable => 0x9631c23204ca5ff8 => 59
	i64 10830817578243619689, ; 451: System.Formats.Tar => 0x964ecb340a447b69 => 38
	i64 10847732767863316357, ; 452: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 245
	i64 10899834349646441345, ; 453: System.Web => 0x9743fd975946eb81 => 152
	i64 10943875058216066601, ; 454: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 55
	i64 10947994639507038094, ; 455: System.Private.ServiceModel.dll => 0x97ef171ea2b29f8e => 215
	i64 10964653383833615866, ; 456: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 33
	i64 11002576679268595294, ; 457: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 180
	i64 11009005086950030778, ; 458: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 189
	i64 11019817191295005410, ; 459: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 242
	i64 11023048688141570732, ; 460: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 461: System.Xml => 0x992e31d0412bf7fc => 162
	i64 11047101296015504039, ; 462: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 194
	i64 11071824625609515081, ; 463: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 325
	i64 11081793513277281410, ; 464: System.ServiceProcess.ServiceController => 0x99ca707c891ed482 => 229
	i64 11103970607964515343, ; 465: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 350
	i64 11136029745144976707, ; 466: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 323
	i64 11157832426039186247, ; 467: System.ServiceModel.NetTcp.dll => 0x9ad8957989669347 => 224
	i64 11162124722117608902, ; 468: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 317
	i64 11188319605227840848, ; 469: System.Threading.Overlapped => 0x9b44e5671724e550 => 139
	i64 11220793807500858938, ; 470: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 353
	i64 11226290749488709958, ; 471: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 183
	i64 11235648312900863002, ; 472: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 88
	i64 11279799931850920893, ; 473: zh-Hans\System.Private.ServiceModel.resources => 0x9c89e6466b7313bd => 383
	i64 11299661109949763898, ; 474: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 256
	i64 11329751333533450475, ; 475: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 146
	i64 11340910727871153756, ; 476: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 265
	i64 11341245327015630248, ; 477: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 201
	i64 11347436699239206956, ; 478: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 161
	i64 11392833485892708388, ; 479: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 301
	i64 11432101114902388181, ; 480: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 481: Mono.Android.Export => 0x9edabf8623efc131 => 168
	i64 11448276831755070604, ; 482: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 30
	i64 11485890710487134646, ; 483: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 106
	i64 11503653075602048397, ; 484: System.ServiceModel.Http => 0x9fa52f85f697058d => 223
	i64 11508496261504176197, ; 485: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 275
	i64 11518296021396496455, ; 486: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 351
	i64 11529969570048099689, ; 487: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 317
	i64 11530571088791430846, ; 488: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 179
	i64 11578238080964724296, ; 489: Xamarin.AndroidX.Legacy.Support.V4 => 0xa0ae2a30c4cd8648 => 279
	i64 11580057168383206117, ; 490: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 240
	i64 11591352189662810718, ; 491: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 309
	i64 11597940890313164233, ; 492: netstandard => 0xa0f429ca8d1805c9 => 166
	i64 11672361001936329215, ; 493: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 276
	i64 11675352430687308415, ; 494: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa2072f2d529c4a7f => 281
	i64 11692977985522001935, ; 495: System.Threading.Overlapped.dll => 0xa245cd869980680f => 139
	i64 11705530742807338875, ; 496: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 347
	i64 11707554492040141440, ; 497: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 58
	i64 11743665907891708234, ; 498: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 143
	i64 11837738194031363949, ; 499: Xamarin.KotlinX.AtomicFU => 0xa448182b1f50476d => 329
	i64 11855742605498539013, ; 500: zh-Hant/System.Web.Services.Description.resources.dll => 0xa4880f15d5345c05 => 397
	i64 11939416560205642949, ; 501: Camera.MAUI => 0xa5b1541a90793cc5 => 172
	i64 11991047634523762324, ; 502: System.Net => 0xa668c24ad493ae94 => 80
	i64 12011556116648931059, ; 503: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 219
	i64 12040886584167504988, ; 504: System.Net.ServicePoint => 0xa719d28d8e121c5c => 73
	i64 12063623837170009990, ; 505: System.Security => 0xa76a99f6ce740786 => 129
	i64 12065128715402553028, ; 506: fr/System.Web.Services.Description.resources.dll => 0xa76ff2a492ef26c4 => 388
	i64 12075303808054746781, ; 507: Plugin.Maui.Audio.dll => 0xa79418d5f2065e9d => 197
	i64 12096697103934194533, ; 508: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 509: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 510: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 92
	i64 12137774235383566651, ; 511: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 314
	i64 12145679461940342714, ; 512: System.Text.Json => 0xa88e1f1ebcb62fba => 136
	i64 12191646537372739477, ; 513: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 234
	i64 12200538574958299032, ; 514: System.Web.Services.Description => 0xa951053154d70798 => 232
	i64 12201331334810686224, ; 515: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 112
	i64 12269460666702402136, ; 516: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12310643388884616687, ; 517: fr\System.Private.ServiceModel.resources => 0xaad830f006fa85ef => 375
	i64 12332222936682028543, ; 518: System.Runtime.Handles => 0xab24db6c07db5dff => 103
	i64 12342184558428949313, ; 519: System.ServiceModel.Primitives.dll => 0xab483f76d5780b41 => 225
	i64 12375446203996702057, ; 520: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 521: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 274
	i64 12463830609398393788, ; 522: zh-Hant\System.Web.Services.Description.resources => 0xacf86be72dd4ebbc => 397
	i64 12466513435562512481, ; 523: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 294
	i64 12466556713286443662, ; 524: pl\System.Web.Services.Description.resources => 0xad021b47b3b3228e => 392
	i64 12475113361194491050, ; 525: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 401
	i64 12487638416075308985, ; 526: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 268
	i64 12517810545449516888, ; 527: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 32
	i64 12538491095302438457, ; 528: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 254
	i64 12550732019250633519, ; 529: System.IO.Compression => 0xae2d28465e8e1b2f => 45
	i64 12681088699309157496, ; 530: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 352
	i64 12699999919562409296, ; 531: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 29
	i64 12700543734426720211, ; 532: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 255
	i64 12708238894395270091, ; 533: System.IO => 0xb05cbbf17d3ba3cb => 56
	i64 12708922737231849740, ; 534: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 133
	i64 12717050818822477433, ; 535: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 113
	i64 12753841065332862057, ; 536: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 319
	i64 12760970142902902754, ; 537: Xamarin.AndroidX.Camera.Lifecycle.dll => 0xb11812bc0517dfe2 => 252
	i64 12800878955599098772, ; 538: ja\System.Private.ServiceModel.resources => 0xb1a5db969141f394 => 377
	i64 12823819093633476069, ; 539: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 365
	i64 12835242264250840079, ; 540: System.IO.Pipes => 0xb21ff0d5d6c0740f => 54
	i64 12843321153144804894, ; 541: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 184
	i64 12843770487262409629, ; 542: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 543: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 76
	i64 12963446364377008305, ; 544: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 211
	i64 12982280885948128408, ; 545: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 267
	i64 13041731019321118825, ; 546: Plugin.Maui.Audio => 0xb4fd894396d41069 => 197
	i64 13066492115845567480, ; 547: Camera.MAUI.dll => 0xb5558159a16ad3f8 => 172
	i64 13068258254871114833, ; 548: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 110
	i64 13129914918964716986, ; 549: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 271
	i64 13162471042547327635, ; 550: System.Security.Permissions => 0xb6aa7dace9662293 => 221
	i64 13173818576982874404, ; 551: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 101
	i64 13213887216798908466, ; 552: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 0xb7612869db5fc032 => 335
	i64 13221551921002590604, ; 553: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 339
	i64 13222659110913276082, ; 554: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 353
	i64 13343850469010654401, ; 555: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 169
	i64 13370592475155966277, ; 556: System.Runtime.Serialization => 0xb98de304062ea945 => 114
	i64 13381594904270902445, ; 557: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 347
	i64 13398095068838674139, ; 558: cs/System.Private.ServiceModel.resources.dll => 0xb9ef987a9d0abedb => 372
	i64 13401370062847626945, ; 559: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 314
	i64 13404347523447273790, ; 560: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 261
	i64 13431476299110033919, ; 561: System.Net.WebClient => 0xba663087f18829ff => 75
	i64 13454009404024712428, ; 562: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 326
	i64 13463706743370286408, ; 563: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 84
	i64 13465488254036897740, ; 564: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 328
	i64 13467053111158216594, ; 565: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 367
	i64 13483465587927207415, ; 566: zh-Hant/System.Private.ServiceModel.resources.dll => 0xbb1ee483859acdf7 => 384
	i64 13491513212026656886, ; 567: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 246
	i64 13540124433173649601, ; 568: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 368
	i64 13545416393490209236, ; 569: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 351
	i64 13572454107664307259, ; 570: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 303
	i64 13578472628727169633, ; 571: System.Xml.XPath => 0xbc706ce9fba5c261 => 159
	i64 13580399111273692417, ; 572: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 573: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 267
	i64 13647894001087880694, ; 574: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 575: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 239
	i64 13702626353344114072, ; 576: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 31
	i64 13710614125866346983, ; 577: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 116
	i64 13713329104121190199, ; 578: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 36
	i64 13717397318615465333, ; 579: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 580: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 346
	i64 13763943339562189755, ; 581: es/System.Private.ServiceModel.resources.dll => 0xbf03598af73543bb => 374
	i64 13768883594457632599, ; 582: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 51
	i64 13814445057219246765, ; 583: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 349
	i64 13830070810343648044, ; 584: System.ServiceModel.Http.dll => 0xbfee48208d082b2c => 223
	i64 13880527146319145818, ; 585: System.Private.ServiceModel => 0xc0a189e5bb84eb5a => 215
	i64 13881769479078963060, ; 586: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 587: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 233
	i64 13911222732217019342, ; 588: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 122
	i64 13928444506500929300, ; 589: System.Windows.dll => 0xc14bc67b8bba9714 => 153
	i64 13959074834287824816, ; 590: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 274
	i64 14075334701871371868, ; 591: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 130
	i64 14100563506285742564, ; 592: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 341
	i64 14109164557138018902, ; 593: System.Data.OleDb => 0xc3cdd26941be4256 => 203
	i64 14121501470435755008, ; 594: pl/System.Private.ServiceModel.resources.dll => 0xc3f9a6c4b87ac400 => 379
	i64 14124974489674258913, ; 595: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 254
	i64 14125464355221830302, ; 596: System.Threading.dll => 0xc407bafdbc707a9e => 147
	i64 14178052285788134900, ; 597: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 235
	i64 14212104595480609394, ; 598: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 119
	i64 14220608275227875801, ; 599: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 27
	i64 14226382999226559092, ; 600: System.ServiceProcess => 0xc56e43f6938e2a74 => 131
	i64 14232023429000439693, ; 601: System.Resources.Writer.dll => 0xc5824de7789ba78d => 99
	i64 14243015553087820727, ; 602: Xamarin.AndroidX.Tracing.Tracing.Ktx => 0xc5a95b2ecc29d3b7 => 312
	i64 14254574811015963973, ; 603: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 133
	i64 14261073672896646636, ; 604: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 301
	i64 14298246716367104064, ; 605: System.Web.dll => 0xc66d93a217f4e840 => 152
	i64 14313943731169726568, ; 606: it/System.Web.Services.Description.resources.dll => 0xc6a557fc274d1068 => 389
	i64 14315150835241960386, ; 607: Xamarin.AndroidX.Concurrent.Futures.Ktx => 0xc6a9a1d6f8bbc3c2 => 259
	i64 14316535876961222820, ; 608: Xamarin.AndroidX.Camera.Camera2 => 0xc6ae8d872068c0a4 => 250
	i64 14326243353657240871, ; 609: CheckInOutCGA => 0xc6d10a6d2c8a6d27 => 0
	i64 14327695147300244862, ; 610: System.Reflection.dll => 0xc6d632d338eb4d7e => 96
	i64 14327709162229390963, ; 611: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 124
	i64 14331727281556788554, ; 612: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 236
	i64 14346402571976470310, ; 613: System.Net.Ping.dll => 0xc718a920f3686f26 => 68
	i64 14369223479411641854, ; 614: System.ServiceModel.Syndication => 0xc769bc9f84888dfe => 228
	i64 14461014870687870182, ; 615: System.Net.Requests.dll => 0xc8afd8683afdece6 => 71
	i64 14464374589798375073, ; 616: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 362
	i64 14486659737292545672, ; 617: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 282
	i64 14495724990987328804, ; 618: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 304
	i64 14522721392235705434, ; 619: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 343
	i64 14551742072151931844, ; 620: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 135
	i64 14561513370130550166, ; 621: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 123
	i64 14574160591280636898, ; 622: System.Net.Quic => 0xca41d1d72ec783e2 => 70
	i64 14622043554576106986, ; 623: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 110
	i64 14644440854989303794, ; 624: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 295
	i64 14669215534098758659, ; 625: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 177
	i64 14690985099581930927, ; 626: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 151
	i64 14705122255218365489, ; 627: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 354
	i64 14744092281598614090, ; 628: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 370
	i64 14792063746108907174, ; 629: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 326
	i64 14795403873026468413, ; 630: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0xcd53d56ee02e6a3d => 291
	i64 14832630590065248058, ; 631: System.Security.Claims => 0xcdd816ef5d6e873a => 117
	i64 14839664071391251657, ; 632: System.ServiceModel.Duplex => 0xcdf113d959670cc9 => 222
	i64 14852515768018889994, ; 633: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 265
	i64 14889905118082851278, ; 634: GoogleGson.dll => 0xcea391d0969961ce => 173
	i64 14892012299694389861, ; 635: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 371
	i64 14904040806490515477, ; 636: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 338
	i64 14912225920358050525, ; 637: System.Security.Principal.Windows => 0xcef2de7759506add => 126
	i64 14935719434541007538, ; 638: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 132
	i64 14954917835170835695, ; 639: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 178
	i64 14975762817949312873, ; 640: System.DirectoryServices.AccountManagement => 0xcfd498f01c5f2769 => 209
	i64 14984936317414011727, ; 641: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 76
	i64 14987728460634540364, ; 642: System.IO.Compression.dll => 0xcfff1ba06622494c => 45
	i64 14988210264188246988, ; 643: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 268
	i64 15015154896917945444, ; 644: System.Net.Security.dll => 0xd0608bd33642dc64 => 72
	i64 15024878362326791334, ; 645: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 62
	i64 15071021337266399595, ; 646: System.Resources.Reader.dll => 0xd127060e7a18a96b => 97
	i64 15076659072870671916, ; 647: System.ObjectModel.dll => 0xd13b0d8c1620662c => 83
	i64 15111608613780139878, ; 648: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 355
	i64 15112104672788120691, ; 649: de\System.Web.Services.Description.resources => 0xd1b8fb21ee0e8473 => 386
	i64 15115185479366240210, ; 650: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 42
	i64 15133485256822086103, ; 651: System.Linq.dll => 0xd204f0a9127dd9d7 => 60
	i64 15150743910298169673, ; 652: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 302
	i64 15164929985498817373, ; 653: Xamarin.KotlinX.AtomicFU.Jvm => 0xd274a7797d53a35d => 330
	i64 15227001540531775957, ; 654: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 176
	i64 15234786388537674379, ; 655: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 36
	i64 15250465174479574862, ; 656: System.Globalization.Calendars.dll => 0xd3a489469852174e => 39
	i64 15255283452148687628, ; 657: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xd3b5a7794937a30c => 291
	i64 15272359115529052076, ; 658: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 257
	i64 15279429628684179188, ; 659: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 331
	i64 15299439993936780255, ; 660: System.Xml.XPath.dll => 0xd452879d55019bdf => 159
	i64 15338463749992804988, ; 661: System.Resources.Reader => 0xd4dd2b839286f27c => 97
	i64 15370334346939861994, ; 662: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 263
	i64 15391712275433856905, ; 663: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 178
	i64 15415041375254054955, ; 664: ru\System.Web.Services.Description.resources => 0xd5ed3a7559f7882b => 394
	i64 15475196252089753159, ; 665: System.Diagnostics.EventLog => 0xd6c2f1000b441e47 => 206
	i64 15526743539506359484, ; 666: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 134
	i64 15527772828719725935, ; 667: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 668: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 64
	i64 15536481058354060254, ; 669: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 342
	i64 15540815214206815676, ; 670: Plugin.Fingerprint.dll => 0xd7ac11193ac88dbc => 196
	i64 15541854775306130054, ; 671: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 124
	i64 15557562860424774966, ; 672: System.Net.Sockets => 0xd7e790fe7a6dc536 => 74
	i64 15582737692548360875, ; 673: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 293
	i64 15609085926864131306, ; 674: System.dll => 0xd89e9cf3334914ea => 163
	i64 15627282834847616226, ; 675: System.Speech.dll => 0xd8df42f0ffa6cce2 => 230
	i64 15661133872274321916, ; 676: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 155
	i64 15664356999916475676, ; 677: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 342
	i64 15710114879900314733, ; 678: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15743187114543869802, ; 679: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 350
	i64 15748096149817933707, ; 680: System.Data.Odbc.dll => 0xda8c7a02e2983f8b => 202
	i64 15750144475371186037, ; 681: Xamarin.AndroidX.Camera.View.dll => 0xda93c0f3d794a775 => 253
	i64 15755368083429170162, ; 682: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 48
	i64 15777549416145007739, ; 683: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 308
	i64 15783653065526199428, ; 684: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 343
	i64 15817206913877585035, ; 685: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 143
	i64 15817855017947507027, ; 686: es\System.Private.ServiceModel.resources => 0xdb844f550d642953 => 374
	i64 15819921090585165167, ; 687: pt-BR\System.Web.Services.Description.resources => 0xdb8ba66a1309fd6f => 393
	i64 15847085070278954535, ; 688: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 138
	i64 15885744048853936810, ; 689: System.Resources.Writer => 0xdc75800bd0b6eaaa => 99
	i64 15928521404965645318, ; 690: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 185
	i64 15934062614519587357, ; 691: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 122
	i64 15937190497610202713, ; 692: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 119
	i64 15949342492168962360, ; 693: it\System.Private.ServiceModel.resources => 0xdd57727e4ec64138 => 376
	i64 15963349826457351533, ; 694: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 141
	i64 15971679995444160383, ; 695: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 38
	i64 16018552496348375205, ; 696: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 67
	i64 16046481083542319511, ; 697: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 182
	i64 16054465462676478687, ; 698: System.Globalization.Extensions => 0xdecceb47319bdadf => 40
	i64 16154507427712707110, ; 699: System => 0xe03056ea4e39aa26 => 163
	i64 16182611612321266217, ; 700: Microsoft.Maui.Maps => 0xe0942f85b2853a29 => 192
	i64 16201041905702586336, ; 701: System.Diagnostics.PerformanceCounter => 0xe0d5a9c6c49ec7e0 => 207
	i64 16219561732052121626, ; 702: System.Net.Security => 0xe1177575db7c781a => 72
	i64 16274182383641215830, ; 703: zxing.dll => 0xe1d982a752dac356 => 336
	i64 16288847719894691167, ; 704: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 356
	i64 16315482530584035869, ; 705: WindowsBase.dll => 0xe26c3ceb1e8d821d => 164
	i64 16321164108206115771, ; 706: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 180
	i64 16337011941688632206, ; 707: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 126
	i64 16361933716545543812, ; 708: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 273
	i64 16454459195343277943, ; 709: System.Net.NetworkInformation => 0xe459fb756d988f77 => 67
	i64 16496768397145114574, ; 710: Mono.Android.Export.dll => 0xe4f04b741db987ce => 168
	i64 16565028646146589191, ; 711: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 199
	i64 16589693266713801121, ; 712: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 292
	i64 16621146507174665210, ; 713: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 260
	i64 16649148416072044166, ; 714: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 191
	i64 16677317093839702854, ; 715: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 300
	i64 16702652415771857902, ; 716: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 150
	i64 16709499819875633724, ; 717: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 44
	i64 16737807731308835127, ; 718: System.Runtime.Intrinsics => 0xe848a3736f733137 => 107
	i64 16758309481308491337, ; 719: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 47
	i64 16762783179241323229, ; 720: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 95
	i64 16765015072123548030, ; 721: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 30
	i64 16822611501064131242, ; 722: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 723: mscorlib => 0xe99c30c1484d7f4f => 165
	i64 16856067890322379635, ; 724: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16885326587688996227, ; 725: ZXing.Net.MAUI.dll => 0xea54bb11b7a94d83 => 337
	i64 16890310621557459193, ; 726: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 137
	i64 16933958494752847024, ; 727: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 77
	i64 16942731696432749159, ; 728: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 363
	i64 16967834437018967906, ; 729: System.DirectoryServices.Protocols => 0xeb79db856227df62 => 210
	i64 16977952268158210142, ; 730: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 53
	i64 16989020923549080504, ; 731: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 292
	i64 16998075588627545693, ; 732: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 298
	i64 17008137082415910100, ; 733: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 734: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 241
	i64 17026344819618783825, ; 735: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 400
	i64 17027804579603049667, ; 736: Microsoft.Maui.Controls.Maps.dll => 0xec4eea0c48026cc3 => 187
	i64 17031351772568316411, ; 737: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 297
	i64 17037200463775726619, ; 738: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 278
	i64 17040771374769818752, ; 739: zxing => 0xec7cfb478bcccc80 => 336
	i64 17062143951396181894, ; 740: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 741: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 370
	i64 17118171214553292978, ; 742: System.Threading.Channels => 0xed8ff6060fc420b2 => 138
	i64 17182518643522243283, ; 743: zh-Hans\System.Web.Services.Description.resources => 0xee7491ab5dab8ad3 => 396
	i64 17187273293601214786, ; 744: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 745: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 746: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 121
	i64 17230721278011714856, ; 747: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 86
	i64 17234219099804750107, ; 748: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 148
	i64 17260702271250283638, ; 749: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17260747228778910608, ; 750: tr/System.Private.ServiceModel.resources.dll => 0xef8a7e27392cd390 => 382
	i64 17306917412052548875, ; 751: ZXing.Net.MAUI => 0xf02e85b0b66a3d0b => 337
	i64 17333249706306540043, ; 752: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 33
	i64 17338386382517543202, ; 753: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 78
	i64 17342750010158924305, ; 754: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 348
	i64 17360349973592121190, ; 755: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 324
	i64 17371436720558481852, ; 756: System.Runtime.Caching => 0xf113bda8d710a1bc => 217
	i64 17382413002971650120, ; 757: System.DirectoryServices.Protocols.dll => 0xf13abc87bd419848 => 210
	i64 17438153253682247751, ; 758: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 363
	i64 17470386307322966175, ; 759: System.Threading.Timer => 0xf27347c8d0d5709f => 146
	i64 17495905265624574316, ; 760: Xamarin.AndroidX.Tracing.Tracing.Ktx.dll => 0xf2cdf1244d70696c => 312
	i64 17509662556995089465, ; 761: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 79
	i64 17514990004910432069, ; 762: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 346
	i64 17522591619082469157, ; 763: GoogleGson => 0xf32cc03d27a5bf25 => 173
	i64 17523946658117960076, ; 764: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 219
	i64 17526180965016000830, ; 765: es/System.Web.Services.Description.resources.dll => 0xf33980bae0fdd93e => 387
	i64 17544493274320527064, ; 766: Xamarin.AndroidX.AsyncLayoutInflater => 0xf37a8fada41aded8 => 247
	i64 17590473451926037903, ; 767: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 234
	i64 17623389608345532001, ; 768: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 358
	i64 17627500474728259406, ; 769: System.Globalization => 0xf4a176498a351f4e => 41
	i64 17669028469918894580, ; 770: System.Reflection.Context.dll => 0xf534ffc763c789f4 => 216
	i64 17685921127322830888, ; 771: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 772: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 369
	i64 17704177640604968747, ; 773: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 294
	i64 17710060891934109755, ; 774: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 290
	i64 17712670374920797664, ; 775: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 106
	i64 17743407583038752114, ; 776: System.CodeDom.dll => 0xf63d3f302bff4572 => 198
	i64 17751885584336325282, ; 777: System.Data.OleDb.dll => 0xf65b5de2abbe8aa2 => 203
	i64 17777860260071588075, ; 778: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 109
	i64 17779483900781686980, ; 779: pl/System.Web.Services.Description.resources.dll => 0xf6bd6a6873de70c4 => 392
	i64 17838668724098252521, ; 780: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 781: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 327
	i64 17928294245072900555, ; 782: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 43
	i64 17992315986609351877, ; 783: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 160
	i64 17996292990076949210, ; 784: System.Web.Services.Description.dll => 0xf9bfad20436392da => 232
	i64 18025913125965088385, ; 785: System.Threading => 0xfa28e87b91334681 => 147
	i64 18032611295476759751, ; 786: de\System.Private.ServiceModel.resources => 0xfa40b46eaf96bcc7 => 373
	i64 18099568558057551825, ; 787: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 357
	i64 18116111925905154859, ; 788: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 246
	i64 18121036031235206392, ; 789: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 297
	i64 18146411883821974900, ; 790: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 37
	i64 18146811631844267958, ; 791: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 792: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 218
	i64 18225059387460068507, ; 793: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 145
	i64 18236439618683771511, ; 794: System.Threading.AccessControl.dll => 0xfd14d9365f819a77 => 231
	i64 18245806341561545090, ; 795: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 796: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 271
	i64 18284618658670613420, ; 797: System.IO.Packaging.dll => 0xfdc003cb438a93ac => 212
	i64 18305135509493619199, ; 798: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 299
	i64 18318849532986632368, ; 799: System.Security.dll => 0xfe39a097c37fa8b0 => 129
	i64 18324163916253801303, ; 800: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 352
	i64 18380184030268848184, ; 801: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 316
	i64 18428404840311395189, ; 802: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 220
	i64 18439108438687598470 ; 803: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 93
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [804 x i32] [
	i32 270, ; 0
	i32 228, ; 1
	i32 224, ; 2
	i32 184, ; 3
	i32 170, ; 4
	i32 190, ; 5
	i32 57, ; 6
	i32 255, ; 7
	i32 150, ; 8
	i32 305, ; 9
	i32 256, ; 10
	i32 308, ; 11
	i32 264, ; 12
	i32 208, ; 13
	i32 131, ; 14
	i32 400, ; 15
	i32 55, ; 16
	i32 307, ; 17
	i32 227, ; 18
	i32 385, ; 19
	i32 381, ; 20
	i32 0, ; 21
	i32 214, ; 22
	i32 182, ; 23
	i32 345, ; 24
	i32 94, ; 25
	i32 192, ; 26
	i32 281, ; 27
	i32 379, ; 28
	i32 286, ; 29
	i32 128, ; 30
	i32 211, ; 31
	i32 222, ; 32
	i32 277, ; 33
	i32 144, ; 34
	i32 257, ; 35
	i32 18, ; 36
	i32 348, ; 37
	i32 269, ; 38
	i32 288, ; 39
	i32 390, ; 40
	i32 149, ; 41
	i32 103, ; 42
	i32 94, ; 43
	i32 376, ; 44
	i32 321, ; 45
	i32 356, ; 46
	i32 202, ; 47
	i32 35, ; 48
	i32 27, ; 49
	i32 245, ; 50
	i32 298, ; 51
	i32 49, ; 52
	i32 114, ; 53
	i32 386, ; 54
	i32 69, ; 55
	i32 186, ; 56
	i32 322, ; 57
	i32 64, ; 58
	i32 169, ; 59
	i32 144, ; 60
	i32 354, ; 61
	i32 320, ; 62
	i32 244, ; 63
	i32 293, ; 64
	i32 278, ; 65
	i32 39, ; 66
	i32 88, ; 67
	i32 80, ; 68
	i32 195, ; 69
	i32 65, ; 70
	i32 61, ; 71
	i32 85, ; 72
	i32 243, ; 73
	i32 105, ; 74
	i32 344, ; 75
	i32 305, ; 76
	i32 101, ; 77
	i32 174, ; 78
	i32 34, ; 79
	i32 240, ; 80
	i32 366, ; 81
	i32 307, ; 82
	i32 188, ; 83
	i32 366, ; 84
	i32 118, ; 85
	i32 380, ; 86
	i32 290, ; 87
	i32 340, ; 88
	i32 358, ; 89
	i32 141, ; 90
	i32 140, ; 91
	i32 216, ; 92
	i32 52, ; 93
	i32 34, ; 94
	i32 140, ; 95
	i32 195, ; 96
	i32 193, ; 97
	i32 250, ; 98
	i32 237, ; 99
	i32 249, ; 100
	i32 383, ; 101
	i32 181, ; 102
	i32 332, ; 103
	i32 269, ; 104
	i32 8, ; 105
	i32 14, ; 106
	i32 362, ; 107
	i32 304, ; 108
	i32 50, ; 109
	i32 283, ; 110
	i32 135, ; 111
	i32 100, ; 112
	i32 395, ; 113
	i32 262, ; 114
	i32 315, ; 115
	i32 115, ; 116
	i32 238, ; 117
	i32 217, ; 118
	i32 162, ; 119
	i32 365, ; 120
	i32 165, ; 121
	i32 66, ; 122
	i32 177, ; 123
	i32 340, ; 124
	i32 381, ; 125
	i32 79, ; 126
	i32 378, ; 127
	i32 100, ; 128
	i32 309, ; 129
	i32 116, ; 130
	i32 201, ; 131
	i32 345, ; 132
	i32 323, ; 133
	i32 377, ; 134
	i32 77, ; 135
	i32 321, ; 136
	i32 399, ; 137
	i32 113, ; 138
	i32 120, ; 139
	i32 47, ; 140
	i32 391, ; 141
	i32 194, ; 142
	i32 380, ; 143
	i32 127, ; 144
	i32 280, ; 145
	i32 241, ; 146
	i32 81, ; 147
	i32 109, ; 148
	i32 74, ; 149
	i32 333, ; 150
	i32 334, ; 151
	i32 384, ; 152
	i32 190, ; 153
	i32 52, ; 154
	i32 311, ; 155
	i32 175, ; 156
	i32 68, ; 157
	i32 310, ; 158
	i32 82, ; 159
	i32 171, ; 160
	i32 360, ; 161
	i32 115, ; 162
	i32 226, ; 163
	i32 176, ; 164
	i32 155, ; 165
	i32 175, ; 166
	i32 235, ; 167
	i32 166, ; 168
	i32 303, ; 169
	i32 270, ; 170
	i32 207, ; 171
	i32 179, ; 172
	i32 31, ; 173
	i32 188, ; 174
	i32 121, ; 175
	i32 71, ; 176
	i32 61, ; 177
	i32 396, ; 178
	i32 160, ; 179
	i32 112, ; 180
	i32 289, ; 181
	i32 87, ; 182
	i32 185, ; 183
	i32 371, ; 184
	i32 104, ; 185
	i32 18, ; 186
	i32 145, ; 187
	i32 117, ; 188
	i32 57, ; 189
	i32 264, ; 190
	i32 17, ; 191
	i32 51, ; 192
	i32 91, ; 193
	i32 399, ; 194
	i32 206, ; 195
	i32 248, ; 196
	i32 368, ; 197
	i32 54, ; 198
	i32 398, ; 199
	i32 128, ; 200
	i32 378, ; 201
	i32 151, ; 202
	i32 40, ; 203
	i32 91, ; 204
	i32 204, ; 205
	i32 316, ; 206
	i32 49, ; 207
	i32 338, ; 208
	i32 161, ; 209
	i32 252, ; 210
	i32 13, ; 211
	i32 285, ; 212
	i32 247, ; 213
	i32 238, ; 214
	i32 310, ; 215
	i32 35, ; 216
	i32 66, ; 217
	i32 108, ; 218
	i32 239, ; 219
	i32 98, ; 220
	i32 98, ; 221
	i32 11, ; 222
	i32 11, ; 223
	i32 295, ; 224
	i32 25, ; 225
	i32 334, ; 226
	i32 127, ; 227
	i32 204, ; 228
	i32 335, ; 229
	i32 75, ; 230
	i32 284, ; 231
	i32 391, ; 232
	i32 108, ; 233
	i32 296, ; 234
	i32 315, ; 235
	i32 313, ; 236
	i32 105, ; 237
	i32 2, ; 238
	i32 229, ; 239
	i32 26, ; 240
	i32 260, ; 241
	i32 156, ; 242
	i32 364, ; 243
	i32 233, ; 244
	i32 21, ; 245
	i32 367, ; 246
	i32 48, ; 247
	i32 42, ; 248
	i32 125, ; 249
	i32 187, ; 250
	i32 242, ; 251
	i32 58, ; 252
	i32 373, ; 253
	i32 118, ; 254
	i32 227, ; 255
	i32 318, ; 256
	i32 273, ; 257
	i32 258, ; 258
	i32 330, ; 259
	i32 3, ; 260
	i32 209, ; 261
	i32 390, ; 262
	i32 282, ; 263
	i32 306, ; 264
	i32 196, ; 265
	i32 37, ; 266
	i32 123, ; 267
	i32 361, ; 268
	i32 306, ; 269
	i32 361, ; 270
	i32 136, ; 271
	i32 148, ; 272
	i32 84, ; 273
	i32 89, ; 274
	i32 286, ; 275
	i32 401, ; 276
	i32 283, ; 277
	i32 349, ; 278
	i32 249, ; 279
	i32 266, ; 280
	i32 319, ; 281
	i32 183, ; 282
	i32 289, ; 283
	i32 325, ; 284
	i32 284, ; 285
	i32 132, ; 286
	i32 277, ; 287
	i32 95, ; 288
	i32 3, ; 289
	i32 357, ; 290
	i32 213, ; 291
	i32 104, ; 292
	i32 360, ; 293
	i32 32, ; 294
	i32 153, ; 295
	i32 157, ; 296
	i32 154, ; 297
	i32 81, ; 298
	i32 214, ; 299
	i32 275, ; 300
	i32 382, ; 301
	i32 279, ; 302
	i32 220, ; 303
	i32 142, ; 304
	i32 86, ; 305
	i32 19, ; 306
	i32 276, ; 307
	i32 218, ; 308
	i32 50, ; 309
	i32 237, ; 310
	i32 364, ; 311
	i32 60, ; 312
	i32 53, ; 313
	i32 4, ; 314
	i32 96, ; 315
	i32 236, ; 316
	i32 17, ; 317
	i32 395, ; 318
	i32 154, ; 319
	i32 83, ; 320
	i32 226, ; 321
	i32 28, ; 322
	i32 44, ; 323
	i32 63, ; 324
	i32 65, ; 325
	i32 355, ; 326
	i32 171, ; 327
	i32 288, ; 328
	i32 1, ; 329
	i32 328, ; 330
	i32 322, ; 331
	i32 46, ; 332
	i32 24, ; 333
	i32 244, ; 334
	i32 164, ; 335
	i32 107, ; 336
	i32 199, ; 337
	i32 12, ; 338
	i32 280, ; 339
	i32 62, ; 340
	i32 205, ; 341
	i32 23, ; 342
	i32 92, ; 343
	i32 167, ; 344
	i32 12, ; 345
	i32 331, ; 346
	i32 208, ; 347
	i32 191, ; 348
	i32 28, ; 349
	i32 102, ; 350
	i32 231, ; 351
	i32 14, ; 352
	i32 253, ; 353
	i32 125, ; 354
	i32 261, ; 355
	i32 300, ; 356
	i32 90, ; 357
	i32 385, ; 358
	i32 285, ; 359
	i32 221, ; 360
	i32 9, ; 361
	i32 85, ; 362
	i32 272, ; 363
	i32 313, ; 364
	i32 359, ; 365
	i32 70, ; 366
	i32 167, ; 367
	i32 251, ; 368
	i32 1, ; 369
	i32 299, ; 370
	i32 5, ; 371
	i32 359, ; 372
	i32 43, ; 373
	i32 205, ; 374
	i32 259, ; 375
	i32 157, ; 376
	i32 302, ; 377
	i32 111, ; 378
	i32 332, ; 379
	i32 369, ; 380
	i32 388, ; 381
	i32 251, ; 382
	i32 120, ; 383
	i32 318, ; 384
	i32 243, ; 385
	i32 158, ; 386
	i32 130, ; 387
	i32 324, ; 388
	i32 56, ; 389
	i32 375, ; 390
	i32 137, ; 391
	i32 82, ; 392
	i32 29, ; 393
	i32 262, ; 394
	i32 389, ; 395
	i32 10, ; 396
	i32 296, ; 397
	i32 387, ; 398
	i32 320, ; 399
	i32 170, ; 400
	i32 258, ; 401
	i32 149, ; 402
	i32 93, ; 403
	i32 200, ; 404
	i32 272, ; 405
	i32 59, ; 406
	i32 394, ; 407
	i32 189, ; 408
	i32 198, ; 409
	i32 156, ; 410
	i32 393, ; 411
	i32 372, ; 412
	i32 344, ; 413
	i32 181, ; 414
	i32 63, ; 415
	i32 87, ; 416
	i32 78, ; 417
	i32 46, ; 418
	i32 186, ; 419
	i32 225, ; 420
	i32 142, ; 421
	i32 341, ; 422
	i32 213, ; 423
	i32 266, ; 424
	i32 73, ; 425
	i32 90, ; 426
	i32 398, ; 427
	i32 193, ; 428
	i32 248, ; 429
	i32 327, ; 430
	i32 134, ; 431
	i32 89, ; 432
	i32 311, ; 433
	i32 287, ; 434
	i32 333, ; 435
	i32 263, ; 436
	i32 174, ; 437
	i32 200, ; 438
	i32 230, ; 439
	i32 339, ; 440
	i32 329, ; 441
	i32 111, ; 442
	i32 41, ; 443
	i32 158, ; 444
	i32 212, ; 445
	i32 287, ; 446
	i32 4, ; 447
	i32 102, ; 448
	i32 69, ; 449
	i32 59, ; 450
	i32 38, ; 451
	i32 245, ; 452
	i32 152, ; 453
	i32 55, ; 454
	i32 215, ; 455
	i32 33, ; 456
	i32 180, ; 457
	i32 189, ; 458
	i32 242, ; 459
	i32 21, ; 460
	i32 162, ; 461
	i32 194, ; 462
	i32 325, ; 463
	i32 229, ; 464
	i32 350, ; 465
	i32 323, ; 466
	i32 224, ; 467
	i32 317, ; 468
	i32 139, ; 469
	i32 353, ; 470
	i32 183, ; 471
	i32 88, ; 472
	i32 383, ; 473
	i32 256, ; 474
	i32 146, ; 475
	i32 265, ; 476
	i32 201, ; 477
	i32 161, ; 478
	i32 301, ; 479
	i32 6, ; 480
	i32 168, ; 481
	i32 30, ; 482
	i32 106, ; 483
	i32 223, ; 484
	i32 275, ; 485
	i32 351, ; 486
	i32 317, ; 487
	i32 179, ; 488
	i32 279, ; 489
	i32 240, ; 490
	i32 309, ; 491
	i32 166, ; 492
	i32 276, ; 493
	i32 281, ; 494
	i32 139, ; 495
	i32 347, ; 496
	i32 58, ; 497
	i32 143, ; 498
	i32 329, ; 499
	i32 397, ; 500
	i32 172, ; 501
	i32 80, ; 502
	i32 219, ; 503
	i32 73, ; 504
	i32 129, ; 505
	i32 388, ; 506
	i32 197, ; 507
	i32 25, ; 508
	i32 7, ; 509
	i32 92, ; 510
	i32 314, ; 511
	i32 136, ; 512
	i32 234, ; 513
	i32 232, ; 514
	i32 112, ; 515
	i32 9, ; 516
	i32 375, ; 517
	i32 103, ; 518
	i32 225, ; 519
	i32 19, ; 520
	i32 274, ; 521
	i32 397, ; 522
	i32 294, ; 523
	i32 392, ; 524
	i32 401, ; 525
	i32 268, ; 526
	i32 32, ; 527
	i32 254, ; 528
	i32 45, ; 529
	i32 352, ; 530
	i32 29, ; 531
	i32 255, ; 532
	i32 56, ; 533
	i32 133, ; 534
	i32 113, ; 535
	i32 319, ; 536
	i32 252, ; 537
	i32 377, ; 538
	i32 365, ; 539
	i32 54, ; 540
	i32 184, ; 541
	i32 6, ; 542
	i32 76, ; 543
	i32 211, ; 544
	i32 267, ; 545
	i32 197, ; 546
	i32 172, ; 547
	i32 110, ; 548
	i32 271, ; 549
	i32 221, ; 550
	i32 101, ; 551
	i32 335, ; 552
	i32 339, ; 553
	i32 353, ; 554
	i32 169, ; 555
	i32 114, ; 556
	i32 347, ; 557
	i32 372, ; 558
	i32 314, ; 559
	i32 261, ; 560
	i32 75, ; 561
	i32 326, ; 562
	i32 84, ; 563
	i32 328, ; 564
	i32 367, ; 565
	i32 384, ; 566
	i32 246, ; 567
	i32 368, ; 568
	i32 351, ; 569
	i32 303, ; 570
	i32 159, ; 571
	i32 2, ; 572
	i32 267, ; 573
	i32 24, ; 574
	i32 239, ; 575
	i32 31, ; 576
	i32 116, ; 577
	i32 36, ; 578
	i32 16, ; 579
	i32 346, ; 580
	i32 374, ; 581
	i32 51, ; 582
	i32 349, ; 583
	i32 223, ; 584
	i32 215, ; 585
	i32 20, ; 586
	i32 233, ; 587
	i32 122, ; 588
	i32 153, ; 589
	i32 274, ; 590
	i32 130, ; 591
	i32 341, ; 592
	i32 203, ; 593
	i32 379, ; 594
	i32 254, ; 595
	i32 147, ; 596
	i32 235, ; 597
	i32 119, ; 598
	i32 27, ; 599
	i32 131, ; 600
	i32 99, ; 601
	i32 312, ; 602
	i32 133, ; 603
	i32 301, ; 604
	i32 152, ; 605
	i32 389, ; 606
	i32 259, ; 607
	i32 250, ; 608
	i32 0, ; 609
	i32 96, ; 610
	i32 124, ; 611
	i32 236, ; 612
	i32 68, ; 613
	i32 228, ; 614
	i32 71, ; 615
	i32 362, ; 616
	i32 282, ; 617
	i32 304, ; 618
	i32 343, ; 619
	i32 135, ; 620
	i32 123, ; 621
	i32 70, ; 622
	i32 110, ; 623
	i32 295, ; 624
	i32 177, ; 625
	i32 151, ; 626
	i32 354, ; 627
	i32 370, ; 628
	i32 326, ; 629
	i32 291, ; 630
	i32 117, ; 631
	i32 222, ; 632
	i32 265, ; 633
	i32 173, ; 634
	i32 371, ; 635
	i32 338, ; 636
	i32 126, ; 637
	i32 132, ; 638
	i32 178, ; 639
	i32 209, ; 640
	i32 76, ; 641
	i32 45, ; 642
	i32 268, ; 643
	i32 72, ; 644
	i32 62, ; 645
	i32 97, ; 646
	i32 83, ; 647
	i32 355, ; 648
	i32 386, ; 649
	i32 42, ; 650
	i32 60, ; 651
	i32 302, ; 652
	i32 330, ; 653
	i32 176, ; 654
	i32 36, ; 655
	i32 39, ; 656
	i32 291, ; 657
	i32 257, ; 658
	i32 331, ; 659
	i32 159, ; 660
	i32 97, ; 661
	i32 263, ; 662
	i32 178, ; 663
	i32 394, ; 664
	i32 206, ; 665
	i32 134, ; 666
	i32 20, ; 667
	i32 64, ; 668
	i32 342, ; 669
	i32 196, ; 670
	i32 124, ; 671
	i32 74, ; 672
	i32 293, ; 673
	i32 163, ; 674
	i32 230, ; 675
	i32 155, ; 676
	i32 342, ; 677
	i32 5, ; 678
	i32 350, ; 679
	i32 202, ; 680
	i32 253, ; 681
	i32 48, ; 682
	i32 308, ; 683
	i32 343, ; 684
	i32 143, ; 685
	i32 374, ; 686
	i32 393, ; 687
	i32 138, ; 688
	i32 99, ; 689
	i32 185, ; 690
	i32 122, ; 691
	i32 119, ; 692
	i32 376, ; 693
	i32 141, ; 694
	i32 38, ; 695
	i32 67, ; 696
	i32 182, ; 697
	i32 40, ; 698
	i32 163, ; 699
	i32 192, ; 700
	i32 207, ; 701
	i32 72, ; 702
	i32 336, ; 703
	i32 356, ; 704
	i32 164, ; 705
	i32 180, ; 706
	i32 126, ; 707
	i32 273, ; 708
	i32 67, ; 709
	i32 168, ; 710
	i32 199, ; 711
	i32 292, ; 712
	i32 260, ; 713
	i32 191, ; 714
	i32 300, ; 715
	i32 150, ; 716
	i32 44, ; 717
	i32 107, ; 718
	i32 47, ; 719
	i32 95, ; 720
	i32 30, ; 721
	i32 23, ; 722
	i32 165, ; 723
	i32 22, ; 724
	i32 337, ; 725
	i32 137, ; 726
	i32 77, ; 727
	i32 363, ; 728
	i32 210, ; 729
	i32 53, ; 730
	i32 292, ; 731
	i32 298, ; 732
	i32 10, ; 733
	i32 241, ; 734
	i32 400, ; 735
	i32 187, ; 736
	i32 297, ; 737
	i32 278, ; 738
	i32 336, ; 739
	i32 16, ; 740
	i32 370, ; 741
	i32 138, ; 742
	i32 396, ; 743
	i32 13, ; 744
	i32 15, ; 745
	i32 121, ; 746
	i32 86, ; 747
	i32 148, ; 748
	i32 22, ; 749
	i32 382, ; 750
	i32 337, ; 751
	i32 33, ; 752
	i32 78, ; 753
	i32 348, ; 754
	i32 324, ; 755
	i32 217, ; 756
	i32 210, ; 757
	i32 363, ; 758
	i32 146, ; 759
	i32 312, ; 760
	i32 79, ; 761
	i32 346, ; 762
	i32 173, ; 763
	i32 219, ; 764
	i32 387, ; 765
	i32 247, ; 766
	i32 234, ; 767
	i32 358, ; 768
	i32 41, ; 769
	i32 216, ; 770
	i32 26, ; 771
	i32 369, ; 772
	i32 294, ; 773
	i32 290, ; 774
	i32 106, ; 775
	i32 198, ; 776
	i32 203, ; 777
	i32 109, ; 778
	i32 392, ; 779
	i32 7, ; 780
	i32 327, ; 781
	i32 43, ; 782
	i32 160, ; 783
	i32 232, ; 784
	i32 147, ; 785
	i32 373, ; 786
	i32 357, ; 787
	i32 246, ; 788
	i32 297, ; 789
	i32 37, ; 790
	i32 15, ; 791
	i32 218, ; 792
	i32 145, ; 793
	i32 231, ; 794
	i32 8, ; 795
	i32 271, ; 796
	i32 212, ; 797
	i32 299, ; 798
	i32 129, ; 799
	i32 352, ; 800
	i32 316, ; 801
	i32 220, ; 802
	i32 93 ; 803
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
