import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.0

Icon
{
    id : __resizer

    anchors.bottom: parent.bottom
    anchors.right : parent.right

    colorize : true
    z: 99
    color: Material.primary
    opacity: (window.visibility!=Window.FullScreen)? __resizer.opacity : 0

    name: "navigation/resize_bottom_right"

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        property var previousPosition

        onPressed: previousPosition=Qt.point(mouseX, mouseY)

        onPositionChanged: {
            if (pressedButtons==Qt.LeftButton){
                var width=(mouseX-previousPosition.x)+window.width;
                var height=(mouseY-previousPosition.y)+window.height;
                if(width>0) window.width=width;
                if(height>0) window.height=height;
            }
        }

        onEntered : {
            cursorShape=Qt.SizeFDiagCursor
            __resizer.opacity=1
        }

        onExited : {
            cursorShape=Qt.ArrowCursor
            __resizer.opacity=0
        }
    }

    Component.onCompleted: __resizer.opacity=0
}
