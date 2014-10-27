import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Control.Monad
import System.IO
import System.IO.Unsafe
import Data.List
import Data.Ratio ((%))
import XMonad.ManageHook
-- Actions
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Actions.OnScreen
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.Submap
import XMonad.Actions.Search
import XMonad.Actions.UpdatePointer
import XMonad.Actions.SpawnOn
-- Hooks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.UrgencyHook hiding (Never)
import XMonad.Hooks.ICCCMFocus
-- Layouts
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.TwoPane
import XMonad.Layout.NoBorders
import XMonad.Layout.Reflect
import XMonad.Layout.Tabbed
import qualified XMonad.Layout.Magnifier as Mag
import XMonad.Layout.MultiToggle
import XMonad.Layout.Minimize
import XMonad.Layout.BoringWindows
import qualified XMonad.Layout.ToggleLayouts as Tog
-- Prompts
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Workspace
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.AppendFile
-- Util
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)

-- Simple configuration
myBorderWidth = 1
myBrowser = "firefox"
myTerminal = "terminator"
myTermianl2 = "xterm"
myShell = "zsh"
myModMask = mod4Mask
myIconDir = "/home/dbyte/.dzen/dzenIcons/"
myStatusBar = "dzen2 -xs 2  -x '0' -y '0' -h '18' -w '750' -ta 'l' -bg '" ++ myDBGColor ++ "' -fn '" ++ myFont ++ "'"
myLeft      = ".dzen/left.zsh | dzen2 -xs 2 -x '750' -y '0' -h '18' -w '530' -ta 'r' -bg '" ++ myDBGColor ++ "' -fg '" ++ myFontCol ++ "' -fn '" ++ myFont ++ "'"
myFont = "-*-terminus-medium-*-*-*-12-120-75-75-*-*-iso8859-*"
myFont2 = "-*-terminus-bold-*-*-*-16-160-72-72-*-*-iso8859-*"

myWorkspaces = ["home", "web", "ws1", "ws2", "ws3", "ws4", "vm", "chat", "music"]
color1 = "#262621"
color2 = "#a3d930"
color3 = "#fdfdfd"
color4 = "#38a2d6"
color5 = "#1793d1"

myDFGColor = color4
myDBGColor = color1

myFFGColor = color3
myFBGColor = color4

myVFGColor = color3
myVBGColor = color1

myUFGColor = color1
myUBGColor = color2

myIFGColor = color3
myIBGColor = color1

mySColor   = color5
myBorder   = "#121212"
myFBorder  = color2
myFontCol  = color5


--
-- main
--

main = do
    dzen <- spawnPipe myStatusBar
    other <- spawnPipe myLeft
    xmonad $ withUrgencyHook dzenUrgencyHook {args = ["-bg", "green", "-xs", "0"] } $ defaultConfig
        { manageHook         = manageHook defaultConfig <+> namedScratchpadManageHook scratchpads<+> myManageHook
        , layoutHook         = mylayoutHook
        , startupHook        = setWMName "LG3D"
        , terminal           = myTerminal
        , modMask            = myModMask
        , borderWidth        = myBorderWidth
        , focusFollowsMouse  = True
        , normalBorderColor  = myBorder
        , focusedBorderColor = myFBorder
        , workspaces         = myWorkspaces
        , logHook            = myLogHook >> (dynamicLogWithPP $ myDzenPP dzen )
        } `additionalKeysP` myKeys

-- End Main


-- Layout Hook
mylayoutHook = mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) $
                    boringWindows $ minimize $ Mag.magnifierOff $
                    smartBorders $ avoidStruts $ lessBorders (Combine Difference Screen OnlyFloat)
                    (Tog.toggleLayouts Full (Mirror tiled ||| Grid ||| tabbedLayout  ||| onWorkspace "web" tabbedLayout tiled))
    where
        fullscreenLayout = smartBorders Full
        tiled = Tall nmaster delta ratio
        nmaster = 2
        delta = 3 / 100
        ratio = 11 / 20
        tabbedLayout = tabbed shrinkText myTabConfig
        reflected =  reflectHoriz $ tiled

-- Scratchpads
scratchpads = [
    NS "htop" "terminator -e htop" (title =? "htop") (customFloating $ W.RationalRect 0 0 1 (5/12)),
    NS "python" "terminator -e python" (title =? "python") (customFloating $ W.RationalRect 0 0 1 (5/12)),
    NS "skynet" "terminator -title skynet -e ssh skynet -t screen -Dr" (title =? "skynet") (customFloating $ W.RationalRect 0 0 1 (5/12)),
    NS "devmtp" "terminator -title devmtp -e ssh devmtp -t screen -Dr" (title =? "devmtp") (customFloating $ W.RationalRect 0 0 1 (5/12)),
    NS "andromeda" "terminator -title andromeda -e ssh andromeda -t screen -Dr" (title =? "andromeda") (customFloating $ W.RationalRect 0 0 1 (5/12))
    ]
-- Manage hook
myManageHook = composeAll
    [  className =? "Xmessage"  --> doFloat
      ,className =? "Dialogue"  --> doFloat
    ]
        <+> (fmap not isDialog --> doF avoidMaster)
        <+> composeOne [ isFullscreen -?> doFullFloat ]

-- Log Hook
myLogHook = takeTopFocus >> fadeInactiveLogHook fadeAmount >> updatePointer (Relative 0.2 0.5)
    where fadeAmount = 0.90

-- XP Config
myXPConfig :: XPConfig
myXPConfig = defaultXPConfig { font = myFont
                             , height = 22
                             , bgColor = myDBGColor
                             , fgColor = myDFGColor
                             , fgHLight = myFFGColor
                             , bgHLight = myFBGColor
                             , historySize = 10 }

myTabConfig = defaultTheme   { fontName = myFont
                              , activeColor = myFBGColor
                              , inactiveColor = myDBGColor
                              , activeTextColor = myFFGColor
                              , inactiveTextColor = myDFGColor }


-- Pretty Printing
myDzenPP h = defaultPP
     {  ppCurrent         = dzenColor myFFGColor myFBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") ""
      , ppVisible         = dzenColor myVFGColor myVBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") ""
      , ppHidden          = dzenColor myDFGColor myDBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win.xbm)") "" . filterNSP
      , ppHiddenNoWindows = dzenColor myDFGColor myDBGColor . wrap ("^i(" ++ myIconDir ++ "/dzen_bitmaps/has_win_nv.xbm)") ""  .filterNSP
      , ppUrgent          = dzenColor myUFGColor myUBGColor . wrap ("^i(" ++ myIconDir ++ "/info_03.xbm)") "" . dzenStrip
      , ppTitle           = dzenColor myDFGColor myDBGColor . trim . shorten 20
      , ppLayout          = dzenColor myDFGColor myDBGColor .
                            -- None of these match anymore, need to strip off Mag/Toggle/Reflect
                            (\x -> case x of
                            "Mirror Tall" -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/mtall.xbm)"
                            "Tall"    -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/tall.xbm)"
                            "Full"    -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/full.xbm)"
                            "Tabbed Simplest"     -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/full.xbm)"
                            "Grid"    -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/grid.xbm)"
                            "TwoPane"     -> "^fg(" ++ myIFGColor ++ ")^i(" ++ myIconDir ++ "/dzen_bitmaps/two_pane.xbm)"
                            _ -> x
                            )
      , ppSep             = "||"
      , ppOutput          = hPutStrLn h }
      where
        filterNSP ws = if ws /= "NSP" then ws else ""


-- Key Bindings
myKeys = [ ("M-u",  spawnHere myBrowser)
         -- run
         , ("M-r",  submap . M.fromList $
            [ ((0, xK_i),  spawnHere "/opt/idea/bin/idea.sh")
            , ((0, xK_c),  spawnHere "google-chrome")
            ])

         -- web apps
         , ("M-a",  submap . M.fromList $
            [ ((0, xK_p),  spawnHere "google-chrome http://plus.google.com")
            , ((0, xK_f),  spawnHere "google-chrome http://facebook.com")
            , ((0, xK_t),  spawnHere "google-chrome http://www.toodledo.com/tasks/index.php")
            , ((0, xK_g),  spawnHere "google-chrome http://gmail.com")
            , ((0, xK_m),  spawnHere "google-chrome http://mint.com")
            ])

         -- bookmarks
         , ("M-b",  submap . M.fromList $
            [ ((0, xK_r),    spawnHere "uzbl-browser reddit.com")
            ])
         -- searches
         , ("M-s",         promptSearchBrowser myXPConfig myBrowser google)
         , ("M-S-s",      submap . M.fromList $
            [ ((0, xK_a),    promptSearchBrowser myXPConfig myBrowser amazon)
            , ((0, xK_c),    promptSearchBrowser myXPConfig myBrowser codesearch)
            , ((0, xK_d),    promptSearchBrowser myXPConfig myBrowser dictionary)
            , ((0, xK_g),    promptSearchBrowser myXPConfig myBrowser google)
            , ((0, xK_i),    promptSearchBrowser myXPConfig myBrowser imdb)
            , ((0, xK_m),    promptSearchBrowser myXPConfig myBrowser maps)
            , ((0, xK_t),    promptSearchBrowser myXPConfig myBrowser thesaurus)
            , ((0, xK_y),    promptSearchBrowser myXPConfig myBrowser youtube)
            ])
         -- documentation
         , ("M-d",  submap . M.fromList $
            [ ((0, xK_p),    spawnHere "uzbl-browser http://docs.python.org/modindex.html")
            , ((0, xK_t),    spawnHere "uzbl-browser twistedmatrix.com/documents/current/api/classIndex.html")
            , ((0, xK_u),    spawnHere "uzbl-browser uzbl.org")
            , ((0, xK_e),    spawnHere "uzbl-browser http://erldocs.com/")
            , ((0, xK_x),    spawnHere "uzbl-browser xmonad.org/xmonad-docs/xmonad-contrib/index.html")
            ])
        -- scratchpads
         , ("M-p",  submap . M.fromList $
            [ ((0, xK_h),    namedScratchpadAction scratchpads "htop")
            , ((0, xK_p),    namedScratchpadAction scratchpads "python")
            , ((0, xK_n),    namedScratchpadAction scratchpads "skynet")
            , ((0, xK_d),    namedScratchpadAction scratchpads "devmtp")
            , ((0, xK_a),    namedScratchpadAction scratchpads "andromeda")
            ])

         -- alsa volume
         , ("M-C-e",    spawn "amixer set Master 2%-")
         , ("M-C-u",    spawn "amixer set Master 2%+")

         -- lock
         , ("M-S-x",    spawn "xscreensaver-command -lock")

         -- prompt
         , ("M-C-p",    runOrRaisePrompt myXPConfig)

         -- toggle Struts
         , ("M-C-s",    sendMessage ToggleStruts)

         -- zoom
         , ("M-S-i",    sendMessage Mag.MagnifyMore)
         , ("M-S-o",    sendMessage Mag.MagnifyLess)
         , ("M-S-z",    sendMessage Mag.Toggle)

         -- reflectoggle
         , ("M-x",  sendMessage $ Toggle REFLECTX)
         , ("M-y",  sendMessage $ Toggle REFLECTY)

         -- minimize
         , ("M-c",  withFocused minimizeWindow)
         , ("M-g",  sendMessage RestoreNextMinimizedWin)

         -- boring Windows
         , ("M-j",  focusDown)
         , ("M-k",  focusUp)
         , ("M-m",  focusMaster)

         -- toggleLayouts
         , ("M-n",     sendMessage (Tog.ToggleLayout))

         -- restart
         , ("M-q",       spawn myRestart)
         ]
         ++

         -- Change Xinerama bindings
         [ ("M-"++key, screenWorkspace sc >>= flip whenJust (windows . f))
             |(key, sc) <- zip ["w", "v", "z"] [0..]
             , (f, m) <- [(W.view, 0)]]

-- Helper functions
--
-- Avoid changing master on new window creation
avoidMaster :: W.StackSet i l a s sd -> W.StackSet i l a s sd
avoidMaster = W.modify' $ \c -> case c of
    W.Stack t [] (r:rs) -> W.Stack t [r] rs
    otherwise           -> c

-- Kill zombie dzens before normal xmonad restart
myRestart :: String
myRestart = "for pid in `pgrep dzen2`; do kill -9 $pid; done && xmonad --recompile && xmonad --restart"
