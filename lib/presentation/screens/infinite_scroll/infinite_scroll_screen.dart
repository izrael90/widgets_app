import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    //desplazar el scroll hacia abajo

    if (!isMounted) return;
    setState(() {});
    moveScrollToBotton();
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    final lastID = imagesIds.last;
    isLoading = true;
    imagesIds.clear();
    imagesIds.add(lastID + 1);
    addFiveImages();
    isLoading = false;
    setState(() {});
  }

  void moveScrollToBotton() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void addFiveImages() {
    final lastID = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastID + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: RefreshIndicator(
            edgeOffset: 10,
            strokeWidth: 2,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                );
              },
            ),
          ),
        ),
        //poner un widget de carga en la parte central abajo
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
