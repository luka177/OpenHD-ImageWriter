/****************************************************************************
** Meta object code from reading C++ file 'cli.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.12)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/cli.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cli.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.12. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Cli_t {
    QByteArrayData data[12];
    char stringdata0[113];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Cli_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Cli_t qt_meta_stringdata_Cli = {
    {
QT_MOC_LITERAL(0, 0, 3), // "Cli"
QT_MOC_LITERAL(1, 4, 9), // "onSuccess"
QT_MOC_LITERAL(2, 14, 0), // ""
QT_MOC_LITERAL(3, 15, 7), // "onError"
QT_MOC_LITERAL(4, 23, 3), // "msg"
QT_MOC_LITERAL(5, 27, 18), // "onDownloadProgress"
QT_MOC_LITERAL(6, 46, 5), // "dlnow"
QT_MOC_LITERAL(7, 52, 7), // "dltotal"
QT_MOC_LITERAL(8, 60, 16), // "onVerifyProgress"
QT_MOC_LITERAL(9, 77, 3), // "now"
QT_MOC_LITERAL(10, 81, 5), // "total"
QT_MOC_LITERAL(11, 87, 25) // "onPreparationStatusUpdate"

    },
    "Cli\0onSuccess\0\0onError\0msg\0"
    "onDownloadProgress\0dlnow\0dltotal\0"
    "onVerifyProgress\0now\0total\0"
    "onPreparationStatusUpdate"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Cli[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x09 /* Protected */,
       3,    1,   40,    2, 0x09 /* Protected */,
       5,    2,   43,    2, 0x09 /* Protected */,
       8,    2,   48,    2, 0x09 /* Protected */,
      11,    1,   53,    2, 0x09 /* Protected */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QVariant,    4,
    QMetaType::Void, QMetaType::QVariant, QMetaType::QVariant,    6,    7,
    QMetaType::Void, QMetaType::QVariant, QMetaType::QVariant,    9,   10,
    QMetaType::Void, QMetaType::QVariant,    4,

       0        // eod
};

void Cli::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Cli *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onSuccess(); break;
        case 1: _t->onError((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        case 2: _t->onDownloadProgress((*reinterpret_cast< QVariant(*)>(_a[1])),(*reinterpret_cast< QVariant(*)>(_a[2]))); break;
        case 3: _t->onVerifyProgress((*reinterpret_cast< QVariant(*)>(_a[1])),(*reinterpret_cast< QVariant(*)>(_a[2]))); break;
        case 4: _t->onPreparationStatusUpdate((*reinterpret_cast< QVariant(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Cli::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_Cli.data,
    qt_meta_data_Cli,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Cli::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Cli::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Cli.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Cli::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
