import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rhcweb/screens/dashboard_screen.dart';
import 'package:rhcweb/screens/edit_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rhcweb/shared/themes/app_text_styles.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/:page_name', page: () => MasterPage()),
        ]);
  }
}

////////////////////////////////////

class MasterPage extends StatelessWidget {
  late Widget
      InnerView; //Aqui eu permitir que a variável receba um valor posteriormente, pois se não o "MasterPage" da erro.
  MasterPage() {
    Map<String, Widget> InnterRoutes = {
      'dashboard': Dashboard(),
      'home': const EditPage(),
    };
    InnerView = InnterRoutes[Get.parameters[
        'page_name']]!; // Já aqui eu permitir que a variável fosse iniciada como null, "pelo menos é o que eu acho que fiz!"
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          width: 265,
          // backgroundColor: AppColors.background,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.8,
                    image: AssetImage("../images/sidebar.jpg"),
                    fit: BoxFit.cover)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage("../images/perfil.jpeg"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(children: [
                        Text(
                          'OSVALDO CRISPIM',
                          style: TextStyles.input,
                        ),
                        Text(
                          '(OSVALDO CRISPIM)',
                          style: TextStyles.input,
                        ),
                      ]),
                    )
                  ],
                ),
               
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pessoal',
                    style: TextStyles.titleRegular,
                  ),
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: const Icon(FontAwesomeIcons.solidCircleUser),
                  title: const Text('Meu Perfil'),
                  onTap: () {
                    Get.toNamed('/home');
                  },
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: const Icon(FontAwesomeIcons.sitemap),
                  title: const Text('Organograma'),
                  onTap: () {
                    Get.toNamed('/dashboard');
                  },
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.squarePlus),
                  title: Text('Formar Organograma'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.solidCircleUser),
                  title: Text('HomeOffice/Covid'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.users),
                  title: Text('Meus Subordinados'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.fileLines),
                  title: Text('Minhas Ocorrências'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.solidEnvelope),
                  title: Text('Mensagens'),
                ),
                /* const Divider(
                  height: 1,
                  thickness: 1,
                ), */
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Relatórios',
                    style: TextStyles.titleRegular,
                  ),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.userLock),
                  title: Text('Controle do Efetivo'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.solidMap),
                  title: Text('Mapa de Vagas'),
                ),
                const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.fileLines),
                  title: Text('Relatiorios e consultas'),
                  
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Gestao de pessoas',
                    style: TextStyles.titleRegular,
                  ),
                ),
                 const ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(FontAwesomeIcons.fileContract),
                  title: Text('Feedback orientado de valor'),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          width: 4,
          thickness: 1,
        ),
        Expanded(
            flex: 6, child: Container(color: Colors.white, child: InnerView)),
      ],
    );
  }
}
