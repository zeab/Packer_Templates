[vpswitch]
s0_switch_to_1_key = <Super>Home

[animation]
s0_open_matches = ((type=Normal | Unknown) | name=sun-awt-X11-XFramePeer | name=sun-awt-X11-XDialogPeer) & !(role=toolTipTip | role=qtooltip_label) & !(type=Normal & override_redirect=1) & !(name=gnome-screensaver);((type=Menu | PopupMenu | DropdownMenu | Combo | Dialog | ModalDialog | Normal) & !(class=\.exe$));(type=Tooltip | Notification | Utility) & !(name=compiz) & !(title=notify-osd);
s0_close_matches = ((type=Normal | Unknown) | name=sun-awt-X11-XFramePeer | name=sun-awt-X11-XDialogPeer) & !(role=toolTipTip | role=qtooltip_label) & !(type=Normal & override_redirect=1) & !(name=gnome-screensaver) & !(name=gnome-screenshot);((type=Menu | PopupMenu | DropdownMenu | Combo | Dialog | ModalDialog | Normal) & !(class=\.exe$));(type=Tooltip | Notification | Utility) & !(name=compiz) & !(title=notify-osd);
s0_unminimize_effects = animation:Glide 2;

[switcher]
s0_background_color = #333333d9

[wall]
s0_thumb_highlight_gradient_shadow_color = #dfdfdfff
s0_arrow_base_color = #e6e6e6d9
s0_arrow_shadow_color = #dcdcdcd9

[core]
s0_active_plugins = core;composite;opengl;commands;compiztoolbox;grid;mousepoll;move;place;snap;resize;copytex;vpswitch;regex;imgpng;wall;session;workarounds;unitymtgrabhandles;expo;scale;ezoom;unityshell;
s0_outputs = 1128x1305+0+0;
s0_autoraise = false
s0_autoraise_delay = 500
s0_show_desktop_key = <Control><Super>d

[decor]
s0_active_shadow_color = #00000080
s0_inactive_shadow_color = #000000ff

[staticswitcher]
s0_next_key = Disabled
s0_prev_key = Disabled
s0_background_color = #333333d9

[unityshell]
s0_inactive_shadow_color = #000000a5
s0_launcher_minimize_window = true

[ezoom]
s0_zoom_box_outline_color = #2f2f4f9f
s0_zoom_box_fill_color = #2f2f2f4f

[grid]
s0_top_left_corner_action = 7
s0_top_edge_action = 8
s0_top_right_corner_action = 9
s0_bottom_left_corner_action = 1
s0_bottom_edge_action = 2
s0_bottom_right_corner_action = 3

[expo]
s0_distance = 0.005000
s0_vp_saturation = 40.000000
s0_ground_color1 = #b3b3b3cc
s0_ground_color2 = #b3b3b300

[gnomecompat]
s0_main_menu_key = <Super>s
s0_command_window_screenshot = gnome-screenshot -w
s0_command_terminal = x-terminal-emulator
s0_run_command_terminal_key = <Control><Alt>t

