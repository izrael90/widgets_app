import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Varias tarjetas en flutter',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y dialogs',
    subTitle: 'Indicadores de pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Statefull widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_sharp,
  ),
  MenuItem(
    title: 'Iu Controls + Titles',
    subTitle: 'Serie de controles en flutter',
    link: '/ui-controls',
    icon: Icons.design_services,
  ),
  MenuItem(
    title: 'App Tutorial',
    subTitle: 'Introducción a la aplicacion',
    link: '/tutorial',
    icon: Icons.accessibility_new_sharp,
  ),
];
