import qs.modules.bar.widgets
import Quickshell
import Quickshell.Wayland

Scope {
    id: bar

    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: root
            required property ShellScreen modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 32
            color: "transparent"

            WlrLayershell.namespace: "quickshell:bar"

            ClockWidget {
                implicitWidth: 100
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
            }

            WindowWidget {
                implicitWidth: 500
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    bottom: parent.bottom
                }
            }
        }
    }
}
