import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
Row{
	Repeater{
		model:3
		Rectangle{
			width :100; height:40
			border.width:1
			color: "yellow"
		}
	}
	Column{
		Repeater{
			model:10
			Text{text:"I'm iterm " + index}
		}
	}
}
