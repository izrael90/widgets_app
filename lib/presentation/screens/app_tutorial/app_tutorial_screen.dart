import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  const SlideInfo(
      'Busca la comida',
      'Fugiat cillum commodo deserunt elit incididunt ipsum nisi incididunt proident nisi. Aute incididunt dolor anim ullamco esse mollit excepteur nulla et magna sit laboris. Lorem ut veniam in sit culpa pariatur ullamco. Cillum laborum voluptate ex nisi non.',
      'assets/images/1.png'),
  const SlideInfo(
      'Entrega rápida',
      'Anim enim exercitation laboris ut velit fugiat excepteur nisi duis labore culpa fugiat amet. Id ipsum magna tempor officia et. Laboris cupidatat officia ipsum exercitation duis qui ex commodo eu veniam cupidatat excepteur nostrud.',
      'assets/images/2.png'),
  const SlideInfo(
      'Disfruta la comida',
      'Velit occaecat irure cupidatat labore est irure officia mollit est ad proident elit officia excepteur. Excepteur sit minim ullamco elit quis fugiat. Qui nostrud elit mollit nulla ut fugiat. Mollit proident culpa consequat id sint amet cillum excepteur laboris eiusmod esse reprehenderit consequat. Elit tempor reprehenderit est adipisicing commodo nulla esse enim reprehenderit aute laboris aliqua eu. Elit reprehenderit cillum exercitation laboris in dolore aliquip sit nostrud quis excepteur incididunt.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen ';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(
                child: const Text('Salir'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/login'),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyle),
              const SizedBox(height: 20),
              Text(caption, style: captionStyle),
            ],
          ),
        ));
  }
}
