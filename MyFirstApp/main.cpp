#include <QApplication>
#include <FelgoApplication>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>

#include "database.h"
#include "productsmodel.h"
#include "itemmodel.h"
#include "mycartmodel.h"
#include "testimonialmodel.h"
#include "eventsmodel.h"


// uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
//#include <FelgoLiveClient>

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);

    FelgoApplication felgo;

    // Use platform-specific fonts instead of Felgo's default font
    felgo.setPreservePlatformFonts(true);

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    // Set an optional license key from project file
    // This does not work if using Felgo Live, only for Felgo Cloud Builds and local builds
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

    // use this during development
    // for PUBLISHING, use the entry point below
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));

    // use this instead of the above call to avoid deployment of the qml files and compile them into the binary with qt's resource system qrc
    // this is the preferred deployment option for publishing games to the app stores, because then your qml files and js files are protected
    // to avoid deployment of your qml files and images, also comment the DEPLOYMENTFOLDERS command in the .pro file
    // also see the .pro file for more details
    //felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    // to start your project as Live Client, comment (remove) the lines "felgo.setMainQmlFileName ..." & "engine.load ...",
    // and uncomment the line below
    //FelgoLiveClient client (&engine);

    //Instantiate the Database Object to Create Database
    Database database;
//    database.createDbPath();
    database.connectToDataBase();

    ProductsModel *model = new ProductsModel();
    ItemModel *model1 = new ItemModel();
    MyCartModel *model2 = new MyCartModel();
    TestimonialModel *model3 = new TestimonialModel();
    EventsModel *model4 = new EventsModel();

    engine.rootContext()->setContextProperty("database", &database);
    engine.rootContext()->setContextProperty("ProductModel", model);
    engine.rootContext()->setContextProperty("ItemModel", model1);
    engine.rootContext()->setContextProperty("CartModel", model2);
    engine.rootContext()->setContextProperty("TestimonyModel", model3);
    engine.rootContext()->setContextProperty("EventModel", model4);

    return app.exec();
}
