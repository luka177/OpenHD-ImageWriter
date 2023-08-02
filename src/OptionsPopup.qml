/*
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (C) 2021 Raspberry Pi Ltd
 */

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.2
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
    property string cameraID: ""

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
                  title: qsTr("   Universal Settings")

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
                                  bootAsAir();
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

                              }
                          }
                      }

                      ImCheckBox {
                          id: setIp
                          visible: false
                          text: qsTr("DUMMY setting")
                          onCheckedChanged: {
                              if (checked) {
                                  //setGround.checked = false
                                  //bootAsIp();
                              }
                          }
                      }
                  }
              }
              GroupBox {
                  title: qsTr("Rockchip Camera")
                  Layout.fillWidth: true

                  ColumnLayout {
                      spacing: -10

                      ComboBox {
                          id: dropdownMenu
                          model: ["None", "IMX415", "Arducam", "IMX477", "IMX219"] // Three selections for the dropdown menu
                          currentIndex: 0 // Set the default selection index here (0 for the first item, 1 for the second, etc.)
                          onCurrentIndexChanged: {
                              // Handle the selected item change here
                              switch(currentIndex) {
                                  case 0: // No Camera
                                      cameraID=""
                                      break;
                                  case 1: // Camera 1
                                      cameraID="IMX415 "
                                      break;
                                  case 2: // Camera 2
                                      cameraID="Arducam "
                                      break;
                                  case 3: // Camera 3
                                      cameraID="IMX477 "
                                      break;
                                  case 4: // Camera 4
                                      cameraID="IMX219 "
                                      break;
                              }
                          }
                      }
                  }
              }

              GroupBox {
                  title: qsTr("Bind Settings")
                  Layout.fillWidth: true
                  visible: false

                  ColumnLayout {
                      spacing: -10

                      ImCheckBox {
                          id: bndKey
                          text: qsTr("Set binding phrase")
                          onCheckedChanged: {
                              if (checked) {
                              setBindKey(bndPhrase.text)
                              }

                          }
                      }

                      TextField {
                          id: bndPhrase
                          inputMask: "XXXXXXXX"
                          text: "A0b1C2fa"
                          width:10
                          color: acceptableInput ? "green" : "red"
                          selectByMouse: true


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
                    saveSettings()
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
    function setBindKey(s) {
        cloudinit=s
    }
    function escapeshellarg(arg) {
        return "'"+arg.replace(/'/g, "\\'")+"'"
    }

    function applySettings()
    {

        openHDGround = ""
        openHDAir = ""
        openHDIp = ""

        if (cameraID.length > 0) {
            bootAsAir(cameraID);
        }
        if (setAir.checked) {
            bootAsAir("air")
        }
        if (setIp.checked) {
            bootAsAir("IP")
        }
        if (setGround.checked) {
            bootAsAir("ground")
        }
        if (openHDGround.length) {
            openHDGround = ""+openHDGround
         }

        if (openHDAir.length) {
            openHDAir = ""+openHDAir
         }

        if (cloudinitwrite !== "") {
            addCloudInit("write_files:\n"+cloudinitwrite+"\n")
        }

        if (cloudinitrun !== "") {
            addCloudInit("runcmd:\n"+cloudinitrun+"\n")
        }

        imageWriter.setImageCustomization(config, cmdline, openHDAir, openHDGround, cloudinit, cloudinitnetwork)
    }

    function saveSettings()
    {
        imageWriter.setSetting("beep", chkBeep.checked)
        imageWriter.setSetting("eject", chkEject.checked)
    }
}
