/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2021 Raspberry Pi Ltd
 */

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.2
import Qt.labs.settings 1.0
import "qmlcomponents"

Popup {
    id: popup
    //x: 62
    x: (parent.width-width)/2
    y: 10
    //width: parent.width-125
    width: popupbody.implicitWidth+60
    height: parent.height-20
    padding: 0
    closePolicy: Popup.CloseOnEscape
    property bool initialized: false
    property bool hasSavedSettings: false
    property string config
    property string cmdline
    property string openHDAir
    property string openHDIp
    property string openHDGround
    property string cloudinit
    property string cloudinitrun
    property string cloudinitwrite
    property string cloudinitnetwork
    // refactored settings
    property string bootType
    property string fileName
    property string sbc
    property string camera
    property string bindPhrase
    property string mode
    property string hotSpot
    property string beep
    property string eject





    // background of title
    Rectangle {
        color: "#f5f5f5"
        anchors.right: parent.right
        anchors.top: parent.top
        height: 35
        width: parent.width
    }
    // line under title
    Rectangle {
        color: "#afafaf"
        width: parent.width
        y: 35
        implicitHeight: 1
    }

    ColumnLayout {
        spacing: 20
        anchors.fill: parent

        Text {
            id: popupheader
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.topMargin: 10
            font.family: roboto.name
            font.bold: true
            text: qsTr("Advanced options")
        }

        ScrollView {
            id: popupbody
            font.family: roboto.name
            //Layout.maximumWidth: popup.width-30
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 25
            Layout.topMargin: 10
            clip: true
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            ColumnLayout {
                GroupBox {
                    label: RowLayout {
                        Label {
                            text: parent.parent.title
                        }
                    }

                    Layout.fillWidth: true

                    ColumnLayout {
                        spacing: -10

                        ImCheckBox {
                            id: setAir
                            text: qsTr("Set SBC to AIR")
                            onCheckedChanged: {
                                if (checked) {
                                    setGround.checked = false
                                    bootType="Air";
                                }
                            }
                        }
                        ImCheckBox {
                            id: setGround
                            text: qsTr("Set SBC to GROUND")
                            onCheckedChanged: {
                                if (checked) {
                                    setAir.checked = false
                                    bootAsGround();
                                    imageWriter.setSetting("bootType", "Ground");
                                    cameraSettingsRpi.visible=false
                                    cameraSettingsRock5.visible=false
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    title: qsTr("Camera Settings")
                    id: cameraSettingsRock5
                    Layout.fillWidth: true
                    visible: false

                    ColumnLayout {
                        spacing: -10
                        // Add a ComboBox to select between cameras
                        ComboBox {
                            id: cameraSelectorRock
                            textRole: "displayText"
                            model: ListModel {
                                ListElement { displayText: "NONE" }
                                ListElement { displayText: "IMX415" }
                                ListElement { displayText: "IMX462" }
                                ListElement { displayText: "HDMI" }
                            }
                            onCurrentIndexChanged: {
                                var selectedCamera = model.get(currentIndex).displayText;
                                if (selectedCamera !== "NONE") {
                                    imageWriter.setSetting("camera", selectedCamera);
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    title: qsTr("Camera Settings")
                    id: cameraSettingsRpi
                    Layout.fillWidth: true
                    visible: false
                    ColumnLayout {
                        // Add a ComboBox to select between cameras
                        ComboBox {
                            id: cameraVendorSelectorRpi
                            textRole: "displayText"
                            model: ListModel {
                                ListElement { displayText: "Original" }
                                ListElement { displayText: "Arducam" }
                                ListElement { displayText: "Veye" }
                            }
                            Layout.minimumWidth: 200
                            Layout.maximumHeight: 40
                            onCurrentIndexChanged: {
                                var selectedCameraVendor = model.get(currentIndex).displayText;
                                if (selectedCameraVendor !== "Original" && selectedCameraVendor !== "Veye") {
                                    cameraSelectorArducam.visible=true
                                    cameraSelectorVeye.visible=false
                                }
                                else if (selectedCameraVendor !== "Original" && selectedCameraVendor !== "Arducam") {
                                    cameraSelectorVeye.visible=true
                                    cameraSelectorArducam.visible=false
                                }

                            }
                        }
                        ComboBox {

                            id: cameraSelectorArducam
                            visible:false
                            textRole: "displayText"
                            model: ListModel {
                                ListElement { displayText: "None" }
                                ListElement { displayText: "SkyMaster HDR 708" }
                                ListElement { displayText: "IMX462 Mini" }
                                ListElement { displayText: "SkyVision Pro 519" }
                                ListElement { displayText: "IMX462" }
                                ListElement { displayText: "IMX477" }
                                ListElement { displayText: "IMX519" }
                                ListElement { displayText: "IMX327" }
                                ListElement { displayText: "IMX290" }
                                ListElement { displayText: "CUSTOM" }
                            }
                            Layout.minimumWidth: 200
                            Layout.maximumHeight: 40
                            onCurrentIndexChanged: {
                                var selectedCamera = model.get(currentIndex).displayText;
                                if (selectedCamera !== "None") {
                                    // Check if it's one of the specified values
                                    if (["SkyMaster HDR 708", "IMX462 Mini", "SkyVision Pro 519"].indexOf(selectedCamera) === -1) {
                                        imageWriter.setSetting("camera", selectedCamera);
                                    } else {
                                        // Handle the specified values differently
                                        if (selectedCamera === "SkyMaster HDR 708") {
                                            imageWriter.setSetting("camera", "IMX708");
                                        } else if (selectedCamera === "IMX462 Mini") {
                                            imageWriter.setSetting("camera", "ARDUCAM");
                                        } else if (selectedCamera === "SkyVision Pro 519") {
                                            imageWriter.setSetting("camera", "IMX519");
                                        }
                                    }
                                }
                            }
                        }
                        ComboBox {

                            id: cameraSelectorVeye
                            visible:false
                            textRole: "displayText"
                            model: ListModel {
                                ListElement { displayText: "None" }
                                ListElement { displayText: "CAM2M" }
                                ListElement { displayText: "CSIMX307" }
                                ListElement { displayText: "CSSC137" }
                                ListElement { displayText: "MVCAM" }
                            }
                            Layout.minimumWidth: 200
                            Layout.maximumHeight: 40
                            onCurrentIndexChanged: {
                                var selectedCamera = model.get(currentIndex).displayText;
                                if (selectedCamera !== "None") {
                                    console.debug(selectedCamera)
                                }
                            }
                        }

                    }
                }
                GroupBox {
                    title: qsTr("Bind Settings")
                    Layout.fillWidth: true
                    visible: true

                    ColumnLayout {
                        spacing: 0

                        Text {
                            text: qsTr("   Must match on Air and Ground!")
                            font.pixelSize: 12
                            color: "gray"
                            Layout.alignment: Qt.AlignHCenter
                        }

                        ImCheckBox {
                            id: bndKey
                            text: qsTr("Set binding phrase")
                            checkable: false
                            onCheckedChanged: {
                                imageWriter.setSetting("bindPhrase", bndPhrase.text);
                            }
                        }
                        TextField {
                            id: bndPhrase
                            maximumLength:10
                            width:10
                            color: bndPhrase.text.length >= 4 ? "green" : "red"
                            text: imageWriter.getValue("bindPhrase")
                            selectByMouse: true
                            placeholderTextColor: "blue"
                            placeholderText: "openhd"
                            onTextChanged: {
                                bndKey.checkable = bndPhrase.text.length >= 4
                            }

                        }
                    }
                }

                GroupBox {
                    title: qsTr("Misc Settings")
                    id: miscSettings
                    Layout.fillWidth: true
                    ColumnLayout {
                        spacing: -10

                        ImCheckBox {
                        id: setDebug
                        visible: true
                        text: qsTr("Debug Mode")
                        onCheckedChanged: {
                            if (checked) {
                                imageWriter.setSetting("mode", "debug");
                            }
                        }
                    }

                        ImCheckBox {
                            id: setWifiHotspot
                            visible: true
                            text: qsTr("WifiHotspot")
                            onCheckedChanged: {
                                if (checked) {
                                    imageWriter.setSetting("hotspot", "wifi");
                                }
                            }
                        }
                    }
                }
                GroupBox {
                    title: qsTr("Imager settings")
                    Layout.fillWidth: true

                    ColumnLayout {
                        spacing: -10

                        ImCheckBox {
                            id: chkBeep
                            text: qsTr("Play sound when finished")
                        }
                        ImCheckBox {
                            id: chkEject
                            text: qsTr("Do not flash config files")
                        }
                    }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignCenter | Qt.AlignBottom
            Layout.bottomMargin: 10
            spacing: 20

            ImButton {
                text: qsTr("SAVE")
                onClicked: {
                    applySettings()
                    popup.close()
                }
                Material.foreground: activeFocus ? "#d1dcfb" : "#ffffff"
                Material.background: "#2C3E50"
            }

            Text { text: " " }
        }
    }

    function initialize() {
        chkBeep.checked = imageWriter.getBoolSetting("beep")
        chkEject.checked = false
        var settings = imageWriter.getSavedCustomizationSettings()

        // initialise custom settings
        bootType = imageWriter.getValue("bootType")
        fileName = imageWriter.srcFileName();
        sbc = imageWriter.getValue("sbc")
        camera= imageWriter.getValue("camera")
        bindPhrase = imageWriter.getValue("bindPhrase")
        mode = imageWriter.getValue("mode")
        hotSpot = imageWriter.getValue("hotSpot")
        beep = imageWriter.getBoolSetting("beep")
        eject = imageWriter.getBoolSetting("eject")

        //get SBC
        if (fileName.includes("pi")) {
            imageWriter.setSetting("SBC", "rpi");
        }
        if (fileName.includes("rock5a")) {
            imageWriter.setSetting("SBC", "rock-5a");
        }
        if (fileName.includes("rock5b")) {
            imageWriter.setSetting("SBC", "rock-5b");
        }

        // reset all saved settings
        imageWriter.setSetting("bootType", "")
        imageWriter.setSetting("fileName", "")
        imageWriter.setSetting("sbc", "")
        imageWriter.setSetting("camera", "")
        imageWriter.setSetting("bindPhrase" , "")
        imageWriter.setSetting("mode", "")
        imageWriter.setSetting("hotSpot" , "")
        imageWriter.setSetting("beep", "")
        imageWriter.setSetting("eject", "")

        if (Object.keys(settings).length) {
            comboSaveSettings.currentIndex = 1
            hasSavedSettings = true
        }
        var tz;
        if (imageWriter.isEmbeddedMode()) {
            /* For some reason there is no password mask character set by default on Embedded edition */
            var bulletCharacter = String.fromCharCode(0x2022);
            fieldUserPassword.passwordCharacter = bulletCharacter;
            fieldWifiPassword.passwordCharacter = bulletCharacter;
        }

        initialized = true
    }

    //Consti10
    function check_air_or_ground_set_by_user(){
        console.log("check_air_or_ground_set_by_user,current: ground:"+openHDGround+" air:"+openHDAir);
        //return openHDGround.length>=1;
        return openHDAir.length>=1;
    }
    function check_air(){
        if (openHDAir == "air") {
            console.log("Image type:"+openHDAir);
            return openHDAir.length>=1;
        }
    }
    function check_ground(){
        if (openHDAir == "ground") {
            console.log("Image type:"+openHDAir);
            return openHDAir.length>=1;
        }
    }

    function openPopup() {
        if (!initialized) {
            initialize()
        }

        open()
        popupbody.forceActiveFocus()
    }

    function addCmdline(s) {
        cmdline += " "+s
    }
    function addConfig(s) {
        config += s+""
    }
    function bootAsGround(s) {
        openHDGround += s+""
    }
    function bootAsAir(s) {
        openHDAir += s+""
    }
    function bootAsIp(s) {
        openHDIp += s+""
    }
    //
    function escapeshellarg(arg) {
        return "'"+arg.replace(/'/g, "\\'")+"'"
    }

    function applySettings()
    {

        imageWriter.setSetting("bootType", bootType)
        imageWriter.setSetting("fileName", fileName)
        imageWriter.setSetting("sbc", sbc)
        imageWriter.setSetting("camera", camera)
        imageWriter.setSetting("bindPhrase" , bindPhrase)
        imageWriter.setSetting("mode", mode)
        imageWriter.setSetting("hotSpot" , hotSpot)
        imageWriter.setSetting("beep", beep)
        imageWriter.setSetting("eject", eject)

    }
}
