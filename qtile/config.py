import subprocess
from libqtile import qtile
from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, DropDown, Group, Key, KeyChord, Match, Screen, ScratchPad
from libqtile.lazy import lazy
import colors
import os

mod = "mod4"
terminal = "kitty"
browser = "firefox"

colors, backgroundColor, foregroundColor, workspaceColor, chordColor = colors.everforest()

keys = [
    # Open applications
    Key([mod], "Return", lazy.spawn(terminal),
        desc="Open terminal"),
    KeyChord([mod], "o", [
        Key([], "b", lazy.spawn(browser)),
        Key([], "s", lazy.spawn("spotify"))],
        name="launch"),

    # Rofi actions
    Key([mod], "space", lazy.spawn("rofi -show drun -show-icons"),
        desc="Run the application launcher"),
    Key([mod], "x", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"),
        desc="Show power menu"),
    # Key(["mod1"], "<Tab>", lazy.spawn("rofi -show window"),
        # desc="Open the window switcher"),

    # Qtile system actions
    Key([mod, "control"], "r", lazy.reload_config(),
        desc="Restart Qtile"),
    Key([mod, "control"], "x", lazy.shutdown(),
        desc="Shutdown Qtile"),

    # Active window actions
    Key([mod], "q", lazy.window.kill(),
        desc="Close active window"),
    Key([mod], "f", lazy.window.fullscreen(),
        desc="Toggle window fullscreen"),
    Key([mod, "control"], "h", lazy.layout.grow(), lazy.layout.increase_nmaster(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.shrink(), lazy.layout.decrease_nmaster(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),
        desc="Grow window up"),

    # Switch focus between windows
    Key([mod], "h", lazy.layout.left(),
        desc="Change focus to window on the left"),
    Key([mod], "l", lazy.layout.right(),
        desc="Change focus to window on the right"),
    Key([mod], "j", lazy.layout.down(),
        desc="Change focus to window below"),
    Key([mod], "k", lazy.layout.up(),
        desc="Change focus to window above"),
    Key([mod], "n", lazy.layout.next(),
        desc="Change focus to the next window"),

    # Qtile layout actions
    Key([mod], "r", lazy.layout.normalize(),
        desc="Reset the sizes of all windows"),
    Key([mod], "Tab", lazy.next_layout(),
        desc="Switch to next layout"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move window up"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    #
    Key([mod, "shift"], 'space',
        lazy.widget['keyboardlayout'].next_keyboard(),
        desc='Next keyboard layout.'),

    # Special keys
    Key([], "XF86AudioMute",
        lazy.spawn("pamixer -t"),
        desc="Mute toggle"),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("pamixer -u -d 5"),
        desc="Decrease the volume"),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("pamixer -u -i 5"),
        desc="Increase the volume"),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl set 5%-"),
        desc="Decrease the brightness"),
    Key([], "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl set 5%+"),
        desc="Increase the brightness"),
    Key([mod], "F1",
        lazy.spawn("pamixer -t"),
        desc="Mute toggle"),
    Key([mod], "F2",
        lazy.spawn("pamixer -u -d 5"),
        desc="Decrease the volume"),
    Key([mod], "F3",
        lazy.spawn("pamixer -u -i 5"),
        desc="Increase the volume"),
    Key([mod], "F5",
        lazy.spawn("brightnessctl set 5%-"),
        desc="Decrease the brightness"),
    Key([mod], "F6",
        lazy.spawn("brightnessctl set 5%+"),
        desc="Increase the brightness"),

    Key([mod], "s", lazy.spawn("flameshot gui"), desc='Screenshot'),
]

# Create labels for groups and assign them a default layout.
groups = []

group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

group_labels = ["", "", "", "", "", "", "", "", ""]

# Add group names, labels, and default layouts to the groups object.
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout="monadtall",
            label=group_names[i],
        ))

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

# Define scratchpads
groups.append(ScratchPad("scratchpad", [
    DropDown("term", "kitty --class=scratch", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1),
    DropDown("ranger", "kitty --class=ranger -e ranger", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
]))

# Scratchpad keybindings
keys.extend([
    Key([mod], "n", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "c", lazy.group['scratchpad'].dropdown_toggle('ranger')),
])

# Define layouts and layout themes
layout_theme = {
        "margin":8,
        "border_width": 4,
        "border_focus": colors[2],
        "border_normal": backgroundColor
    }

layouts = [
    # layout.Columns(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font = "JetBrainsMono Nerd Font",
    fontsize = 12,
    padding = 0,
    background=backgroundColor
)
spacer_defaults = dict(
    background = workspaceColor,
    length = 10
)
border_defaults = dict(
    background = workspaceColor,
    font = "JetBrainsMono Nerd Font",
    fontsize = 30,
)
extension_defaults = widget_defaults.copy()

wireless_interface = subprocess.run(
    "ip link show | grep wlp | awk '{print $2}' | tr -d :",
    shell=True, capture_output=True).stdout.decode('utf-8').strip()

def get_widgets(systray=False):
    widgets = [
        widget.Spacer(**spacer_defaults),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.CurrentLayoutIcon(
            scale=0.5
        ),
        widget.GroupBox(
            padding = 3
        ),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.Spacer(**spacer_defaults),
        widget.Spacer(**spacer_defaults),
        widget.TaskList(
            icon_size=0,
            font = "JetBrainsMono Nerd Font",
            foreground = foregroundColor,
            background = workspaceColor,
            borderwidth = 1,
            border = workspaceColor,
            margin = 0,
            padding = 10,
            highlight_method = "block",
            title_width_method = "uniform",
            urgent_alert_method = "border",
            urgent_border = colors[6],
            rounded = False,
            txt_floating = "🗗 ",
            txt_maximized = "🗖 ",
            txt_minimized = "🗕 ",
        ),
        widget.Spacer(**spacer_defaults),
        widget.Spacer(**spacer_defaults),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.Chord(
            chords_colors={
                "launch": (foregroundColor, backgroundColor),
            },
            name_transform=lambda name: name.upper(),
            foreground=chordColor,
            padding = 10,
        ),
        widget.Wlan(
            foreground=foregroundColor,
            padding = 5,
            interface=wireless_interface,
            format='  {quality}%',
            mouse_callbacks=dict(
                Button1=lambda: qtile.cmd_spawn('gnome-control-center network'))),
        widget.PulseVolume(
            foreground=colors[4],
            padding = 5,
            fmt="墳 {}",
            update_interval=0.1,
            volume_app="pavucontrol",
            step=5),
        # widget.Bluetooth(
        #     foreground = colors[2],
        #     fmt=" {}",
        #     padding=10,
        #     mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("blueman-manager")},
        # ),
        widget.Battery(
            foreground=colors[8],
            padding = 5,
            format="{char} {percent:2.0%}",
            charge_char="",
            discharge_char="",
            empty_char="",
            full_char="",
            unknown_char="",
            low_foreground=colors[9],
            low_percentage=0.15,
            show_short_text=False,
            notify_below=15
        ),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.Spacer(**spacer_defaults),
        widget.Spacer(**spacer_defaults),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.Clock(
            format=" %a %b %d  %I:%M %P",
            foreground=foregroundColor,
            font="JetBrainsMono Nerd Font",
        ),
        widget.Spacer(
            length = 10,
            background = backgroundColor,
        ),
        widget.KeyboardLayout(
                padding = 0,
                foreground = colors[5],
                configured_keyboards=['us', 'latam'],
                display_map={'us': 'EN', 'latam': 'ES'}),
        widget.TextBox(
            **border_defaults,
            text="",
            foreground = backgroundColor,
        ),
        widget.Spacer(**spacer_defaults),
        # widget.QuickExit(),
    ]

    if systray:
        widgets.append(widget.Spacer(**spacer_defaults))
        widgets.append(
            widget.TextBox(
                **border_defaults,
                text="",
                foreground = backgroundColor,
            )
        )
        widgets.append(widget.Systray(background=backgroundColor))
        widgets.append(
            widget.TextBox(
                **border_defaults,
                text="",
                foreground = backgroundColor,
            )
        )
        widgets.append(widget.Spacer(**spacer_defaults))

    return widgets

wallpaper_config = dict(
    wallpaper="~/Pictures/wallpapers/fantasy-4k-hd.jpg",
    wallpaper_mode="stretch"
)

def status_bar(widget_list):
    return bar.Bar(widget_list, 36, background = workspaceColor)

screens = [
    Screen(top=status_bar(get_widgets(systray=True)), **wallpaper_config),
]

connected_monitors = (subprocess.run(
    "xrandr | busybox grep 'connected' | busybox cut -d' ' -f2",
    check=True,
    shell=True,
    stdout=subprocess.PIPE,
).stdout.decode("UTF-8").split("\n")[:-1].count("connected"))

if connected_monitors > 1:
  for i in range(1, connected_monitors):
    screens.append(
        Screen(top=status_bar(get_widgets()), **wallpaper_config))

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="Gnome-screenshot"),
        Match(wm_class="notification"),
        Match(wm_class="Pavucontrol"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="Emulator"),
        # Match(wm_name="Android Emulator - Pixel_XL_API_30:5554"),
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def autostart():
   subprocess.call([os.path.expanduser('.config/qtile/scripts/autostart.sh')])

@hook.subscribe.client_new
def client_new(client):
    if client.name == 'firefox':
        client.togroup('1')
    if client.name == 'kitty':
        client.togroup('2')
    if client.name == 'Spotify':
        client.togroup('9')

wmname = "LG3D"
